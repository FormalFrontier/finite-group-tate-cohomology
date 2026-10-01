#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
# Authors: Formal Frontier Agents
"""Data-only native-record corruption tests; no synthetic fixture proves Lean facts.

Formal Frontier agents adapted the accepted PolynomialRootStability test pattern at
95ac896f81a3190b2634a4246a3e924d2a267a61. Supply the independently
retained seven original native records; no record is shipped with these tests.
"""

import argparse
import copy
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

import generate_api as api


ROOT = Path(__file__).resolve().parent.parent
PARSER = argparse.ArgumentParser(description=__doc__)
PARSER.add_argument("--native-data", type=Path, required=True)


class NativeControls(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.sources = {path: (ROOT / path).read_bytes() for path in api.SOURCE_INPUT_SHA256}
        cls.original = {
            module: (ARGS.native_data / ("declaration-data-" + module + ".bmp")).read_bytes()
            for module in api.MODULES
        }
        cls.records = {module: json.loads(raw) for module, raw in cls.original.items()}
        api.check_snapshot(api.SOURCE, cls.sources)
        api.validate(cls.records, cls.original, cls.sources, api.SOURCE)

    def corrupt(self, modify, expected):
        records = copy.deepcopy(self.records)
        sources = dict(self.sources)
        modify(records, sources)
        raw = {module: json.dumps(record, ensure_ascii=False, sort_keys=True,
                                  separators=(",", ":")).encode("utf-8")
               for module, record in records.items()}
        with self.assertRaisesRegex(ValueError, expected):
            api.render(records, raw, sources, api.SOURCE)

    def test_exact_unmodified_native_inputs_and_manifest(self):
        markdown, manifest_raw = api.render(self.records, self.original, self.sources, api.SOURCE)
        manifest = json.loads(manifest_raw)
        self.assertEqual(len(manifest["production_declarations"]), 102)
        self.assertEqual(len(manifest["public_client_declarations"]), 63)
        self.assertEqual(set(manifest["instance_declarations"]), set(api.EXPECTED_INSTANCES))
        self.assertEqual(manifest["undocumented_count"], 54)
        self.assertEqual(markdown.count(b"\n### "), 165)
        new_components = {"FiniteGroupTateCohomology.normNatTrans_app",
                          "FiniteGroupTateCohomology.quotientNormNatTrans_app",
                          "FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm_hom_app",
                          "FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm_hom_app"}
        self.assertTrue(new_components <= set(manifest["production_declarations"]))
        signatures = {row["info"]["name"]: api.Header(row["header"]).rendered()
                      for row in self.records[api.MODULES[0]]["declarations"]}
        self.assertNotIn("[Fintype H]", signatures[
            "FiniteGroupTateCohomology.quotientNormNatTrans_app"])
        self.assertIn("FiniteGroupTateCohomologyTests.quotientNorm_whiskered_component",
                      manifest["public_client_declarations"])
        self.assertIn("FiniteGroupTateCohomologyTests.negativeOne_component_kernelInclusion",
                      manifest["public_client_declarations"])
        self.assertIn("FiniteGroupTateCohomologyTests.zero_component_cokernelProjection",
                      manifest["public_client_declarations"])
        self.assertEqual(manifest["native_record_sha256"], api.NATIVE_RECORD_SHA256)
        self.assertEqual(manifest["inputs"], api.SOURCE_INPUT_SHA256)
        self.assertEqual(manifest["api_sha256"], api.digest(markdown))
        self.assertEqual((ROOT / "docs/API.md").read_bytes(), markdown)
        self.assertEqual((ROOT / "docs/api-manifest.json").read_bytes(), manifest_raw)
        source_prefix = ("[Source](https://github.com/FormalFrontier/"
                         "finite-group-tate-cohomology/blob/" + api.OFFICIAL_SOURCE + "/").encode()
        self.assertEqual(markdown.count(source_prefix), 165)
        self.assertNotIn(b"[Source](../", markdown)
        self.assertIn(api.SOURCE.encode(), markdown)
        self.assertNotIn(b"example.invalid", markdown + manifest_raw)
        self.assertNotIn(b"forgejo.vpn", markdown + manifest_raw)
        self.assertFalse(manifest["proof_certification"] or manifest["release_acceptance"])

    def test_missing_duplicate_extra_name_kind_source_and_instance_rows(self):
        module = api.MODULES[0]
        basic = api.MODULES[1]
        controls = [
            ("missing/extra native declaration", lambda r, s: r[module]["declarations"].pop()),
            ("missing/extra native declaration", lambda r, s: r[module]["declarations"].append(
                copy.deepcopy(r[module]["declarations"][0]))),
            ("duplicate native declaration", lambda r, s: r[module]["declarations"].__setitem__(
                1, copy.deepcopy(r[module]["declarations"][0]))),
            ("native module name differs", lambda r, s: r[module].__setitem__("name", "Other")),
            ("wrong native name/kind", lambda r, s: r[module]["declarations"][0]["info"].__setitem__(
                "kind", "axiom")),
            ("native source module/revision/path differs", lambda r, s: r[module]["declarations"][0]["info"].__setitem__(
                "sourceLink", "https://example.invalid/commit/main/Norm.lean")),
            ("native self link differs", lambda r, s: r[module]["declarations"][0]["info"].__setitem__(
                "docLink", "./other.html#name")),
            ("missing/extra/wrong native instance table", lambda r, s: r[basic]["instances"].pop()),
            ("duplicate native instance row", lambda r, s: r[basic]["instances"].append(
                copy.deepcopy(r[basic]["instances"][0]))),
            ("missing/extra/wrong native instance table", lambda r, s: r[basic]["instances"][0].__setitem__(
                "className", "CategoryTheory.Other")),
            ("native source docstring position differs", lambda r, s: r[module]["declarations"][0]["info"].__setitem__(
                "line", 1)),
        ]
        for diagnostic, change in controls:
            with self.subTest(diagnostic=diagnostic):
                self.corrupt(change, diagnostic)

    def test_active_html_and_implicit_binders(self):
        norm = api.MODULES[0]
        periodicity = api.MODULES[3]
        for fragment in ("<script>alert(1)</script>", "<img src='x'>", "<a href='javascript:evil'>x</a>",
                         "<span onclick='evil'>x</span>", "<div><span></div>"):
            with self.subTest(fragment=fragment):
                self.corrupt(lambda r, s: r[norm]["declarations"][0].__setitem__("header", fragment),
                             "native header")
        self.corrupt(lambda r, s: r[norm]["declarations"][0]["info"].__setitem__(
            "doc", "<script>alert(1)</script>"), "active/unsupported native docstring")
        for name, token in (("FiniteGroupTateCohomology.normFromCoinvariants", "{G : Type v}"),
                            ("FiniteGroupTateCohomology.quotientNorm", "[S.Normal]"),
                            ("FiniteGroupTateCohomology.quotientNorm", "[Fintype ↥S]"),
                            ("FiniteGroupTateCohomology.quotientNormNatTrans_app", "[Fintype ↥S]"),
                            ("FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity",
                             "(hg : ∀ (x : G), x ∈ Subgroup.zpowers g)")):
            module = periodicity if ".Cyclic." in name else norm
            with self.subTest(binder=name + "/" + token):
                def remove_binder(records, sources):
                    row = next(row for row in records[module]["declarations"]
                               if row["info"]["name"] == name)
                    self.assertIn(token, api.Header(row["header"]).rendered())
                    replacement = {"{G : Type v}": ("Type</a> v}", "Type</a> u}"),
                                   "[S.Normal]": ("Normal", "Other"),
                                   "[Fintype ↥S]": ("Fintype", "Infinite"),
                                   "(hg : ∀ (x : G), x ∈ Subgroup.zpowers g)":
                                       ("zpowers", "zpowerzzz")}[token]
                    self.assertIn(replacement[0], row["header"])
                    row["header"] = row["header"].replace(*replacement, 1)
                self.corrupt(remove_binder, "missing signature binder")

    def test_native_raw_bytes_docstrings_and_extra_file(self):
        module = api.MODULES[0]
        raw = dict(self.original)
        raw[module] += b" "
        with self.assertRaisesRegex(ValueError, "native raw record differs from pinned tool/input"):
            api.validate(self.records, raw, self.sources, api.SOURCE)
        self.corrupt(lambda records, sources: records[module]["declarations"][0]["info"].__setitem__(
            "doc", "Invented source docstring"), "native docstring/source mismatch")
        with tempfile.TemporaryDirectory() as temporary:
            for name, data in self.original.items():
                (Path(temporary) / ("declaration-data-" + name + ".bmp")).write_bytes(data)
            (Path(temporary) / "declaration-data-Unapproved.Extra.bmp").write_bytes(b"{}")
            result = subprocess.run([sys.executable, "-B", str(ROOT / "scripts/generate_api.py"),
                                     "--native-data", temporary, "--source-revision", api.SOURCE,
                                     "--docgen-revision", api.TOOL, "--check"],
                                    capture_output=True, text=True, check=False)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("missing/extra native record file", result.stderr)

    def test_fixed_source_and_no_git_or_optimized_weakening(self):
        for path in self.sources:
            with self.subTest(path=path):
                changed = dict(self.sources)
                changed[path] += b"\n"
                with self.assertRaisesRegex(ValueError, "source/pin drift from accepted input"):
                    api.check_snapshot(api.SOURCE, changed)
        with self.assertRaisesRegex(ValueError, "source/pin inventory differs"):
            api.check_snapshot(api.SOURCE, {**self.sources, "extra.lean": b""})
        with self.assertRaisesRegex(ValueError, "unexpected/stale analyzed source revision"):
            api.check_snapshot("main", self.sources)
        with tempfile.TemporaryDirectory() as temporary:
            result = subprocess.run([sys.executable, "-O", str(ROOT / "scripts/generate_api.py"),
                                     "--native-data", temporary, "--source-revision", api.SOURCE,
                                     "--docgen-revision", api.TOOL],
                                    capture_output=True, text=True, check=False)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("optimized Python is not supported", result.stderr)
            self.assertEqual(list(Path(temporary).iterdir()), [])

    def test_source_only_archive_replay_without_git_executable(self):
        with tempfile.TemporaryDirectory() as temporary:
            archive = Path(temporary) / "source-archive"
            (archive / "scripts").mkdir(parents=True)
            (archive / "docs").mkdir()
            for path in api.SOURCE_INPUT_SHA256:
                target = archive / path
                target.parent.mkdir(parents=True, exist_ok=True)
                target.write_bytes(self.sources[path])
            for name in ("scripts/generate_api.py", "docs/API.md", "docs/api-manifest.json"):
                (archive / name).write_bytes((ROOT / name).read_bytes())
            native = Path(temporary) / "retained-native-inputs"
            native.mkdir()
            for module, raw in self.original.items():
                (native / ("declaration-data-" + module + ".bmp")).write_bytes(raw)
            command = [sys.executable, "-I", "-B", str(archive / "scripts/generate_api.py"),
                       "--native-data", str(native), "--source-revision", api.SOURCE,
                       "--docgen-revision", api.TOOL, "--check"]
            result = subprocess.run(command, cwd=archive, env={"PATH": "/no-git-binary"},
                                    capture_output=True, text=True, check=False)
            self.assertEqual(result.returncode, 0, result.stderr)
            self.assertIn('"status": "matched"', result.stdout)
            (archive / "docs/api-manifest.json").write_bytes(b"{}")
            result = subprocess.run(command, cwd=archive, env={"PATH": "/no-git-binary"},
                                    capture_output=True, text=True, check=False)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn("generated file differs/stale manifest", result.stderr)


if __name__ == "__main__":
    ARGS = PARSER.parse_args()
    unittest.main(argv=[sys.argv[0]], verbosity=2)

#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
# Authors: Formal Frontier Agents
"""Bounded mixed-kind native doc-gen4 reference for finite-group Tate cohomology.

Formal Frontier agents adapted the accepted PolynomialRootStability donor generator at
95ac896f81a3190b2634a4246a3e924d2a267a61, itself adapted from Anchor's
ideal-completion Markdown recipe at f0c8c34386109116e4912fb425a8ad15d9dc42a4.
The fixed records are documentation input, never a proof or release certificate.
"""

if not __debug__:
    raise SystemExit("optimized Python is not supported for API generation")

import argparse
import hashlib
from html.parser import HTMLParser
import json
from pathlib import Path
import re


TOOL = "97d4ecdfc8e09e7f511724c25e303d448de6a3db"
SOURCE = "cba7734f0dddc4601fc1951d9eaca29a831e4bf7"
SOURCE_TREE = "52a73df34550707c12fa7d72aa82e705dbf3e69c"
OFFICIAL_SOURCE = "1ffe47ec77e24c0d0bca827b6f4ec6ca91e3351c"
MODULES = (
    "FiniteGroupTateCohomology.Norm",
    "FiniteGroupTateCohomology.Basic",
    "FiniteGroupTateCohomology.CyclicModelFunctor",
    "FiniteGroupTateCohomology.CyclicPeriodicity",
    "FiniteGroupTateCohomology",
    "FiniteGroupTateCohomologyTests.PublicAPI",
    "FiniteGroupTateCohomologyTests",
)
SOURCE_INPUT_SHA256 = {
    "FiniteGroupTateCohomology/Norm.lean": "e080c2c64287f4122b3fe968e4c49a434f30ef55bf752dcc0a99a7757e3f15f5",
    "FiniteGroupTateCohomology/Basic.lean": "aa5392ac3950b8dd368be265fdf9b17592c41b66e084498a26adc1365fc94d59",
    "FiniteGroupTateCohomology/CyclicModelFunctor.lean": "1bda4bef2301af3cbb47a24e748e6bff38269681a12450883313254f86774169",
    "FiniteGroupTateCohomology/CyclicPeriodicity.lean": "62644bc64a51795e2e19c43698b04caebfb45ee41c0859e2bb4c0d1bf771c0bc",
    "FiniteGroupTateCohomology.lean": "49d9297ce2abf6bdebe549f17f2638d75b18b875d6c0ca4c863ff754e8002516",
    "FiniteGroupTateCohomologyTests/PublicAPI.lean": "799b7736a331c76aa587d0edd73f81f5ed83fed7c858a791b9f3a44130e35c12",
    "FiniteGroupTateCohomologyTests.lean": "87ce4b0b1404ba2d7a200cd6f06849877e6220719095e6edda48aaffa81644a5",
    "lean-toolchain": "8190e75a201741065fe508b28955dd64dd72d090babe5f70ce6848879d68ae88",
    "lakefile.toml": "f8e58dc43fddfb3ed72bff133a1381aa7c71886742fa60db5fb1b1d2d9b7c3cd",
    "lake-manifest.json": "dae9638daf3d2259ec970343b33651a7471898691fa8b0fb0c4a26125d017691",
}
NATIVE_RECORD_SHA256 = {
    "FiniteGroupTateCohomology.Norm": "041e41075bf7e66c9a715bb3111c373f4abebfd93da359b272ac9accacdc16fb",
    "FiniteGroupTateCohomology.Basic": "ed3efbb92d93e0c042c852b1a8c1c8562ae378ca1f58cb3ab47af22563dadea0",
    "FiniteGroupTateCohomology.CyclicModelFunctor": "d3b7aae601b9431d96032d8cf93228915f2f31d0fc1554c83da3b9f16046f318",
    "FiniteGroupTateCohomology.CyclicPeriodicity": "51b369c3d0674eb83c503472d2b11cf0631959c3a6e27c8565d373aea9931151",
    "FiniteGroupTateCohomology": "43fc227272cfe8fccffe3d6eea512e7f5bda22871b9f10f3fa145e908b060105",
    "FiniteGroupTateCohomologyTests.PublicAPI": "7c5b36731d427fb4552629afda90f1d8f8a762af62e6530b1474bb805ee1b850",
    "FiniteGroupTateCohomologyTests": "e6be71d4a6af564536fcee275e42c19a279b2941ad7c0fbe857b73e2ce6b3dda",
}
COUNTS = (15, 46, 20, 21, 0, 63, 0)
KINDS = ("def", "theorem", "instance")
EXPECTED_INSTANCES = {
    "FiniteGroupTateCohomology.normSequence_mono_first": "CategoryTheory.Mono",
    "FiniteGroupTateCohomology.normSequence_epi_last": "CategoryTheory.Epi",
}
KEY_TOKENS = {
    "FiniteGroupTateCohomology.normFromCoinvariants":
        ("{R : Type u}", "{G : Type v}", "[Fintype G]", "(M : Rep R G)"),
    "FiniteGroupTateCohomology.quotientNorm":
        ("{R : Type u}", "{H : Type v}", "[Group H]", "[S.Normal]", "[Fintype ↥S]"),
    "FiniteGroupTateCohomology.quotientNormNatTrans":
        ("{R : Type u}", "{H : Type v}", "[S.Normal]", "[Fintype ↥S]"),
    "FiniteGroupTateCohomology.normNatTrans_app":
        ("{R : Type u}", "{G : Type v}", "[Fintype G]", "normFromCoinvariants M"),
    "FiniteGroupTateCohomology.quotientNormNatTrans_app":
        ("{R : Type u}", "{H : Type v}", "[S.Normal]", "[Fintype ↥S]", "quotientNorm A S"),
    "FiniteGroupTateCohomologyTests.quotientNorm_whiskered_component":
        ("{R : Type u}", "{H : Type v}", "[T.Normal]", "[Fintype ↥T]", "F.map"),
    "FiniteGroupTateCohomology.normSequence_exact":
        ("{R G : Type u}", "[Fintype G]", "(normSequence M).Exact"),
    "FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm_hom_app":
        ("{R G : Type u}", "(M : Rep R G)", "tateCohomologyNegOneIsoKernelNorm M"),
    "FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm_hom_app":
        ("{R G : Type u}", "(M : Rep R G)", "tateCohomologyZeroIsoCokernelNorm M"),
    "FiniteGroupTateCohomology.Cyclic.normHomCompSubMap":
        ("[CommGroup G]", "(g : G)", "(f : A ⟶ B)"),
    "FiniteGroupTateCohomology.Cyclic.evenModelFunctor":
        ("[CommGroup G]", "(g : G)"),
    "FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoEven":
        ("(hg : ∀ (x : G), x ∈ Subgroup.zpowers g)", "(hn : Even n)"),
    "FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity":
        ("(hg : ∀ (x : G), x ∈ Subgroup.zpowers g)", "(n : ℤ)", "(n + 2)"),
    "FiniteGroupTateCohomologyTests.normIndependentUniverses":
        ("{R : Type u}", "{H : Type v}", "[Fintype H]"),
    "FiniteGroupTateCohomologyTests.zeroCoefficient_even_comp":
        ("comp 0 0", "evenModelMap"),
}

CATALOGUE = {
    "invariantsMap_inclusion": "A coefficient morphism commutes with the inclusion of invariant vectors.",
    "coinvariantsMk_normFromCoinvariants_inclusion": "Composing the coinvariants quotient with the norm and invariant inclusion recovers the representation norm.",
    "normFromCoinvariants_naturality": "The ordinary norm commutes with coefficient morphisms, giving the natural-transformation equation.",
    "quotientNorm_mk": "Computes the residual quotient-equivariant norm on a coinvariant representative.",
    "quotientNorm_naturality": "The norm for a finite normal subgroup commutes with changes of coefficients.",
    "tateDNegTwoArrowIso_hom_right": "Identifies the right component of the arrow isomorphism at the differential entering Tate degree minus one.",
    "tateDZeroArrowIso_hom_left": "Identifies the left component of the arrow isomorphism at the differential leaving Tate degree zero.",
    "pOpcycles_tateOpcyclesIsoNegOne_hom": "The negative-one opcycle identification commutes with the opcycle quotient projection.",
    "coinvariantsMk_tateOpcyclesIsoNegOne_inv": "The inverse opcycle comparison sends the coinvariants quotient to the Tate opcycle projection.",
    "tateCyclesIsoZero_hom_inclusion": "The degree-zero cycle comparison commutes with the invariant submodule inclusion.",
    "tateOpcyclesIsoNegOne_naturality": "The negative-one opcycle identification commutes with coefficient morphisms.",
    "tateCyclesIsoZero_naturality": "The degree-zero cycle identification commutes with coefficient morphisms.",
    "tateCyclesIsoZero_inv_naturality": "The inverse of the degree-zero cycle identification commutes with coefficient morphisms.",
    "normKernelFunctor_map_ι": "The norm-kernel functor's coefficient map commutes with its kernel inclusion.",
    "normCokernelFunctor_π_map": "The norm-cokernel functor's coefficient map commutes with its cokernel projection.",
    "tateNormFromCoinvariants_eq": "Identifies the norm in the exceptional Tate homology sequence with the ordinary coinvariants-to-invariants norm.",
    "normSequence_first_naturality": "The first map of the four-term norm sequence commutes with coefficient morphisms.",
    "normSequence_last_naturality": "The last map of the four-term norm sequence commutes with coefficient morphisms.",
    "normSequence_mono_first": "The injection from Tate degree minus one into coinvariants is a category-theoretic monomorphism.",
    "normSequence_epi_last": "The projection from invariants onto Tate degree zero is a category-theoretic epimorphism.",
    "tateCohomologyNegOneIsoKernelNorm_hom_ι": "The negative-one kernel comparison commutes with the norm-kernel inclusion.",
    "tateCohomologyZeroIsoCokernelNorm_π_hom": "The degree-zero cokernel comparison commutes with the norm-cokernel projection.",
    "normHomCompSubMap_id": "Identity coefficient maps induce the identity morphism of the norm-then-(g−1) short complexes.",
    "normHomCompSubMap_comp": "The norm-then-(g−1) short-complex map respects composition of coefficient maps.",
    "subCompNormHomMap_id": "Identity coefficient maps induce the identity morphism of the (g−1)-then-norm short complexes.",
    "subCompNormHomMap_comp": "The (g−1)-then-norm short-complex map respects composition of coefficient maps.",
    "evenModelFunctor_obj": "Evaluating the even-model coefficient functor returns the homology of the norm-then-(g−1) short complex.",
    "evenModelFunctor_map": "The even-model coefficient functor maps a morphism by its induced short-complex homology map.",
    "oddModelFunctor_obj": "Evaluating the odd-model coefficient functor returns the homology of the (g−1)-then-norm short complex.",
    "oddModelFunctor_map": "The odd-model coefficient functor maps a morphism by its induced short-complex homology map.",
    "evenModelMap_id": "Identity coefficients induce the identity on even-model homology.",
    "evenModelMap_comp": "Even-model homology maps preserve composition of arbitrary coefficient morphisms.",
    "oddModelMap_id": "Identity coefficients induce the identity on odd-model homology.",
    "oddModelMap_comp": "Odd-model homology maps preserve composition of arbitrary coefficient morphisms.",
    "invariantsIsoKernelGeneratorSub_hom_ι": "The generator-based invariants/kernel comparison commutes with the kernel inclusion.",
    "cokernel_π_cokernelGeneratorSubIsoCoinvariants_hom": "The generator-based cokernel/coinvariants comparison commutes with the cokernel projection.",
}


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(raw):
    return hashlib.sha256(raw).hexdigest()


class Header(HTMLParser):
    """Extract all visible native tokens, including hidden-by-CSS implicits."""

    def __init__(self, value):
        super().__init__(convert_charrefs=True)
        self.stack = []
        self.text = []
        self.kinds = []
        self.names = []
        self.feed(value)
        self.close()
        require(not self.stack, "unclosed native header")

    def handle_starttag(self, tag, attrs):
        require(tag in {"div", "span", "a"}, "unexpected/active native header tag")
        attributes = dict(attrs)
        require(len(attrs) == len(attributes) and set(attributes) <= {"class", "href"},
                "active/unknown native header attribute")
        require(tag == "a" or "href" not in attributes, "unexpected native header link")
        require("href" not in attributes or
                re.fullmatch(r"\./[\w./#-]+", attributes["href"]) is not None,
                "active/external native header link")
        classes = set(attributes.get("class", "").split())
        if tag == "div" and "decl_type" in classes:
            self.text.append(" ")
        self.stack.append((tag, classes))

    def handle_endtag(self, tag):
        require(bool(self.stack) and self.stack[-1][0] == tag, "unbalanced native header")
        self.stack.pop()

    def handle_data(self, value):
        require(bool(self.stack) or not value.strip(), "text outside native header")
        self.text.append(value)
        if any("decl_kind" in classes for _, classes in self.stack):
            self.kinds.append(value)
        if any("decl_name" in classes for _, classes in self.stack):
            self.names.append(value)

    def handle_comment(self, _):
        raise ValueError("unexpected native header comment")

    def handle_decl(self, _):
        raise ValueError("unexpected native header declaration")

    def rendered(self):
        return " ".join("".join(self.text).split())


def source_anchor(raw, line, name, doc):
    lines = raw.decode("utf-8").splitlines()
    require(type(line) is int and 0 < line <= len(lines), "invalid native source line: " + name)
    rest = "\n".join(lines[line - 1:])
    if doc:
        require(rest.startswith("/--"), "native source docstring position differs: " + name)
        source_doc, closing, rest = rest.partition("-/")
        require(bool(closing) and source_doc[3:].strip() == doc.strip(),
                "native docstring/source mismatch: " + name)
    else:
        require(not rest.startswith("/--"), "native docstring missing: " + name)
    declaration = re.search(r"(?m)^\s*(?:(?:noncomputable|private|protected)\s+)?"
                            r"(def|lemma|theorem|instance|abbrev)\s+(\S+)", rest)
    require(declaration is not None, "native source declaration absent: " + name)
    source_name = name.rsplit(".", 1)[-1].removesuffix("_assoc")
    require(declaration.group(2) == source_name and
            "/--" not in rest[:declaration.start()], "native source/name position differs: " + name)


def check_snapshot(revision, sources):
    require(revision == SOURCE, "unexpected/stale analyzed source revision")
    require(set(sources) == set(SOURCE_INPUT_SHA256), "source/pin inventory differs")
    for path, expected in SOURCE_INPUT_SHA256.items():
        require(digest(sources[path]) == expected, "source/pin drift from accepted input: " + path)


def validate(records, raw_records, sources, revision):
    check_snapshot(revision, sources)
    require(set(records) == set(raw_records) == set(MODULES), "native module inventory differs")
    sections = {"production": [], "clients": []}
    all_names = set()
    undocumented = set()
    for module, expected_count in zip(MODULES, COUNTS):
        record = records[module]
        require(json.loads(raw_records[module]) == record,
                "native record bytes/JSON differ: " + module)
        require(type(record) is dict and set(record) == {"name", "declarations", "instances", "imports"},
                "native module shape differs: " + module)
        require(record["name"] == module, "native module name differs: " + module)
        require(type(record["declarations"]) is list and len(record["declarations"]) == expected_count,
                "missing/extra native declaration: " + module)
        require(type(record["instances"]) is list and type(record["imports"]) is list,
                "native instances/imports shape differs: " + module)
        instance_names = {}
        for instance in record["instances"]:
            require(type(instance) is dict and set(instance) == {"name", "className", "typeNames"}
                    and type(instance["typeNames"]) is list, "malformed native instance row")
            require(instance["name"] not in instance_names, "duplicate native instance row")
            instance_names[instance["name"]] = instance["className"]
        require(instance_names == (EXPECTED_INSTANCES if module == MODULES[1] else {}),
                "missing/extra/wrong native instance table: " + module)
        path = module.replace(".", "/") + ".lean"
        names = set()
        for row in record["declarations"]:
            require(type(row) is dict and set(row) == {"info", "header"}
                    and type(row["info"]) is dict,
                    "native declaration shape differs: " + module)
            info = row["info"]
            require(set(info) == {"name", "kind", "doc", "docLink", "sourceLink", "line"},
                    "native declaration info shape differs: " + module)
            name, kind = info["name"], info["kind"]
            require(type(name) is str and type(kind) is str and
                    kind in KINDS and name.startswith(module.split(".")[0] + "."),
                    "wrong native name/kind: " + str(name))
            require(name not in names and name not in all_names,
                    "duplicate native declaration: " + name)
            names.add(name)
            all_names.add(name)
            require(type(info["doc"]) is str and type(row["header"]) is str,
                    "malformed native doc/header: " + name)
            require(info["sourceLink"] == "https://example.invalid/commit/" + revision + "/" + path,
                    "native source module/revision/path differs: " + name)
            require(info["docLink"] == "./" + module.replace(".", "/") + ".html#" + name,
                    "native self link differs: " + name)
            require("```" not in info["doc"] and
                    re.search(r"<\s*[/!?a-zA-Z]", info["doc"]) is None,
                    "active/unsupported native docstring: " + name)
            source_anchor(sources[path], info["line"], name, info["doc"])
            header = Header(row["header"])
            visible_kind = "".join(header.kinds)
            text = header.rendered()
            require((visible_kind in {"noncomputable def", "noncomputable abbrev", "abbrev"}
                     if kind == "def" else visible_kind == kind) and
                    "".join(header.names) == name
                    and text.startswith(visible_kind + " " + name + " ") and
                    "```" not in text and "<script" not in text.lower(),
                    "native signature identity/format differs: " + name)
            for binder in KEY_TOKENS.get(name, ()):
                require(binder in text, "missing signature binder: " + name + " / " + binder)
            if kind == "instance":
                require(name in instance_names, "declaration/instance table mismatch: " + name)
            elif name in instance_names:
                raise ValueError("instance table kind mismatch: " + name)
            note = None
            if not info["doc"]:
                short_name = name.rsplit(".", 1)[-1]
                base = short_name.removesuffix("_assoc")
                require(base in CATALOGUE and kind in ("theorem", "instance"),
                        "missing original catalogue explanation: " + name)
                note = CATALOGUE[base]
                if base != short_name:
                    note = "Generated `@[reassoc]` association variant of `" + base + "`. " + note
                undocumented.add((module, name))
            section = "clients" if module.startswith("FiniteGroupTateCohomologyTests") else "production"
            sections[section].append(dict(name=name, kind=kind, path=path,
                                          line=info["line"], signature=text,
                                          doc=info["doc"].strip(), note=note))
        require(set(instance_names) == {row["info"]["name"] for row in record["declarations"]
                                        if row["info"]["kind"] == "instance"},
                "missing native instance declaration: " + module)
        require(digest(raw_records[module]) == NATIVE_RECORD_SHA256[module],
                "native raw record differs from pinned tool/input: " + module)
    require(len(all_names) == 165 and len(sections["production"]) == 102 and
            len(sections["clients"]) == 63 and len(undocumented) == 54,
            "mixed public/client/undocumented inventory differs")
    return sections


def render(records, raw_records, sources, revision):
    sections = validate(records, raw_records, sources, revision)
    lines = ["# Native API reference", "",
             "Fixed Lean `v4.34.0-rc2`, mathlib `e37d88a26f3791ed5a93daa1f949af1021b8d103`",
             "and separately pinned doc-gen4 `" + TOOL + "`. Full displayed signatures",
             "retain all native implicit arguments, typeclasses and universe variables.",
             "There are 102 production named declarations (including two named instances)",
             "and 63 checked-use client declarations, across seven shipped modules.",
             "The production and client reexport roots each have zero new named entries.",
             "The filtered native tables do **not** enumerate private declarations or",
             "generated proof bodies; this reference does not certify axioms, proofs,",
             "source coverage, rights or a release. [Reproduce and assess provenance](README.md).", "",
             "Native records analyze source checkpoint `" + SOURCE + "`",
             "(tree `" + SOURCE_TREE + "`). Historical **Source** links use the",
             "byte-identical official publication `" + OFFICIAL_SOURCE + "`.",
             "They do not point to this checkout's corrected-header sources.",
             "Local module links navigate current files; see the reproduction guide for",
             "the exact historical inputs and optional source-only replay.",
             "**Native source docstring** reproduces a matched source comment;",
             "**Original catalogue explanation** is newly written here for an entry",
             "without a Lean docstring (including compiler-generated association laws).", ""]
    for section, heading in (("production", "Production API (102 native named entries)"),
                             ("clients", "Checked-use clients (63 native named entries)")):
        lines.extend(["## " + heading, ""])
        for row in sorted(sections[section], key=lambda item:
                          (MODULES.index(item["path"].removesuffix(".lean").replace("/", ".")),
                           item["line"], item["name"])):
            lines.extend(["### " + row["name"], "", "Kind: `" + row["kind"] + "`.", "",
                          "```lean", row["signature"], "```", ""])
            if row["note"] is None:
                lines.extend(["**Native source docstring:** " + row["doc"], ""])
            else:
                lines.extend(["**Original catalogue explanation (not a Lean docstring):** " +
                              row["note"], ""])
            lines.extend([f"[Source](https://github.com/FormalFrontier/finite-group-tate-cohomology/blob/{OFFICIAL_SOURCE}/{row['path']}#L{row['line']}) "
                          "(native source start line; generated association laws point to their source lemma).", ""])
    markdown = "\n".join(lines).encode("utf-8")
    manifest = dict(format=2, generator="scripts/generate_api.py", docgen_revision=TOOL,
                    analyzed_source_revision=SOURCE, analyzed_source_tree=SOURCE_TREE,
                    modules=list(MODULES), inputs=SOURCE_INPUT_SHA256,
                    native_record_sha256=NATIVE_RECORD_SHA256,
                    normalized_record_sha256={module: digest(json.dumps(records[module],
                            ensure_ascii=False, sort_keys=True, separators=(",", ":")).encode("utf-8"))
                            for module in MODULES},
                    production_declarations=[row["name"] for row in sections["production"]],
                    public_client_declarations=[row["name"] for row in sections["clients"]],
                    instance_declarations=list(EXPECTED_INSTANCES),
                    undocumented_count=54, api_sha256=digest(markdown),
                    proof_certification=False, release_acceptance=False)
    return markdown, (json.dumps(manifest, indent=2, sort_keys=True) + "\n").encode("utf-8")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--native-data", type=Path, required=True)
    parser.add_argument("--source-revision", required=True)
    parser.add_argument("--docgen-revision", required=True)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    require(args.docgen_revision == TOOL, "unexpected/stale doc-gen4 revision")
    root = Path(__file__).resolve().parent.parent
    sources = {}
    for path in SOURCE_INPUT_SHA256:
        source_path = root / path
        require(source_path.is_file() and not source_path.is_symlink(), "missing/linked source input: " + path)
        sources[path] = source_path.read_bytes()
    check_snapshot(args.source_revision, sources)
    require(args.native_data.is_dir() and not args.native_data.is_symlink(), "native data directory absent/linked")
    expected_files = {"declaration-data-" + module + ".bmp" for module in MODULES}
    files = set(path.name for path in args.native_data.iterdir())
    require(files == expected_files, "missing/extra native record file")
    raw_records = {}
    records = {}
    for module in MODULES:
        path = args.native_data / ("declaration-data-" + module + ".bmp")
        require(path.is_file() and not path.is_symlink(), "missing/linked native record: " + module)
        raw_records[module] = path.read_bytes()
        records[module] = json.loads(raw_records[module])
    api, manifest = render(records, raw_records, sources, args.source_revision)
    for name, raw in (("API.md", api), ("api-manifest.json", manifest)):
        target = root / "docs" / name
        if args.check:
            require(target.is_file() and target.read_bytes() == raw,
                    "generated file differs/stale manifest: " + name)
        else:
            require(not target.is_symlink(), "linked output refused: " + name)
    if not args.check:
        (root / "docs" / "API.md").write_bytes(api)
        (root / "docs" / "api-manifest.json").write_bytes(manifest)
    print(json.dumps(dict(status="matched" if args.check else "generated", production=102,
                          clients=63, instances=2, api_sha256=digest(api),
                          proof_certification=False, release_acceptance=False)))


if __name__ == "__main__":
    main()

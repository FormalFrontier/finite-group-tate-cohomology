# Native reference and reproducibility

The [complete mixed-kind reference](API.md) and [data manifest](api-manifest.json)
cover **all seven shipped Lean modules** on the frozen development input
`9882255fffc9960eb01497ae2edce43ccf877408` (tree
`f813d0f13b34648a0953cd114c08b6b42eb83bd1`): four production leaves,
their zero-entry public reexport root, a checked-use client leaf and its
zero-entry root. The pinned native **declarations and instances tables** contain
98 production named entries (37 definitions, 59 theorems and two named
instances) and 50 client entries (18 definitions and 32 theorems). The native
kind `def` also covers source `abbrev`s. Their full displayed signatures and
source anchors are retained, including compiler-generated `@[reassoc]` laws.
Exactly 54 production entries lack source docstrings (9 Norm, 29 Basic, 12
CyclicModelFunctor, four CyclicPeriodicity); each has a clearly identified
**original catalogue explanation, not a fabricated Lean docstring**. All other
entry descriptions are checked against the matching original source comments.
No entry in these seven records imported an upstream generated boilerplate
docstring: all 94 present entry docs match this project's source comments.
No dependency docstrings, native website, JS, fonts or HTML are bundled.

This is a **public/native filtered** reference, not a census of private
declarations or of generated proof fields. Source contains 17 explicitly
`private` helpers; compiler-generated/private proofs add further declarations.
The previously reported 293 imported + 106 source-private + 14 upstream + 26
client `#print axioms` invocations overlap; **439 printings are not 439 unique
proof declarations** and do not certify a full raw or stored-body audit. An
independent full audit and proof-body binding remain necessary for release.
The default lint may be clean while optional `docBlameThm` still identifies
54 public/associated-equation entries (9/29/12/4 respectively). These notes
make the documentation gap visible, not silently close that lint. A reviewer
must assess whether the generated association laws need no separate source
docstrings, and whether remaining meaningful public lemmas should instead get
native comments in a later, separately reviewed Lean change; this scoped docs
candidate cannot change Lean.

## Frozen inputs and tool

The ten unchanged `.lean`/pin/config SHA-256 hashes are fixed independently in
[`scripts/generate_api.py`](../scripts/generate_api.py) and restated in the
[manifest](api-manifest.json). The fixed historical commit/tree are **labels
for analyzed mathematical inputs**, not claims about a future documentation
commit or about a locally available Git parent. Only the external acceptance
record can bind the final candidate commit and tree. The separately checked
upstream `leanprover/doc-gen4` revision is
`97d4ecdfc8e09e7f511724c25e303d448de6a3db` (tree
`ebf77f3e174c145c9ca2db0df1c18a78ae87c93b`). Its toolchain is Lean
`v4.34.0-rc2`; doc-gen4 remains a **separate core-only tool**, not a project
dependency. The library pins the same Lean toolchain and mathlib
`e37d88a26f3791ed5a93daa1f949af1021b8d103`.

Before **any** project build, install the pinned Lean toolchain and successfully
fetch the matching mathlib cache in this checkout. A cache failure is a blocker,
not permission to rebuild mathlib silently. `lake --help` has no documented
`LAKE_JOBS` bound in this pinned Lake; `LEAN_NUM_THREADS=2` is merely a Lean
runtime setting, **not** a total process/memory bound. Actual available memory
and Lake concurrency should be observed independently.

```sh
elan toolchain install "$(cat lean-toolchain)"
lake exe cache get
LEAN_NUM_THREADS=2 lake --wfail build
```

Clone upstream doc-gen4 separately, checkout that exact revision and verify its
tree, then run `lake build doc-gen4` inside its checkout. If `cc` is absent,
prepend `$(dirname "$(elan which lean)")` to that tool build's `PATH`.
For example, with `TOOL` set to the pinned executable and `OUT` to a **fresh**
external directory:

```sh
TOOL=/path/to/separate/doc-gen4/.lake/build/bin/doc-gen4
OUT=/path/to/fresh/native-output
REV=9882255fffc9960eb01497ae2edce43ccf877408
mkdir -p "$OUT/build" "$OUT/render" "$OUT/native-input"
for module in FiniteGroupTateCohomology.Norm FiniteGroupTateCohomology.Basic \
              FiniteGroupTateCohomology.CyclicModelFunctor \
              FiniteGroupTateCohomology.CyclicPeriodicity FiniteGroupTateCohomology \
              FiniteGroupTateCohomologyTests.PublicAPI FiniteGroupTateCohomologyTests; do
  path="${module//.//}.lean"
  LEAN_NUM_THREADS=2 lake env "$TOOL" single --build "$OUT/build" "$module" \
    "$OUT/build/api.db" "https://example.invalid/commit/$REV/$path"
done
"$TOOL" bibPrepass --build "$OUT/render" --none
"$TOOL" fromDb --build "$OUT/render" --manifest "$OUT/render/manifest.json" \
  "$OUT/build/api.db" FiniteGroupTateCohomology.Norm \
  FiniteGroupTateCohomology.Basic FiniteGroupTateCohomology.CyclicModelFunctor \
  FiniteGroupTateCohomology.CyclicPeriodicity FiniteGroupTateCohomology \
  FiniteGroupTateCohomologyTests.PublicAPI FiniteGroupTateCohomologyTests
for module in FiniteGroupTateCohomology.Norm FiniteGroupTateCohomology.Basic \
              FiniteGroupTateCohomology.CyclicModelFunctor \
              FiniteGroupTateCohomology.CyclicPeriodicity FiniteGroupTateCohomology \
              FiniteGroupTateCohomologyTests.PublicAPI FiniteGroupTateCohomologyTests; do
  cp "$OUT/render/doc-data/declaration-data-$module.bmp" "$OUT/native-input/"
done
python3 -B scripts/test_generate_api.py --native-data "$OUT/native-input"
python3 -B scripts/generate_api.py --native-data "$OUT/native-input" \
  --source-revision "$REV" \
  --docgen-revision 97d4ecdfc8e09e7f511724c25e303d448de6a3db --check
```

The `example.invalid` address is an inert **native record identity**, not an
actual source link. The shipped Markdown links only to local Lean files. Keep
the original native database, seven raw declaration records, full command
receipts and warnings outside the shipped tree for independent intake. The
generator requires **exactly seven retained input records**: copy only the
seven named modules, not doc-gen4's extra dependency-module files.

## What replay verifies

The adapter checks fixed source bytes, native module names, row counts, unique
names, kinds, both separate instance rows, source line/docstring agreement,
record revision and path, native display identity, key assumptions and **all
raw record SHA-256 hashes**. It renders all visible native signature text,
including otherwise visually collapsed implicits and inferred typeclasses.
Structural checks reject active/unknown header HTML and active Markdown HTML.
Raw hashes bind every byte (including Unicode, whitespace, source link and
record ordering), while normalized record hashes in the manifest hash JSON with
sorted keys, compact separators and UTF-8 Unicode, without dropping fields.
For this pinned doc-gen4 output, each normalized hash happens to equal its raw
hash; this coincidence is **not** a rule for other tool versions. No optimizer
mode is allowed: `python3 -O` refuses before reading or writing any output.
`--check` refuses stale Markdown or manifests without modifying them.

For replay in a source-only archive or an isolated parentless one-commit
same-tree checkout, keep the ten checked source inputs, adapter, generated docs
and seven externally retained raw records. **Neither Git nor the historical
commit object is required** by the adapter. The tested copy uses an unavailable
`PATH` for Git; parentless same-tree replay and independent final artifact
binding are separate reviewer checks. Data-only corruption tests exercise
literal negative diagnostics and do not substitute for native analysis,
proof checking, full artifact review or release acceptance.

## Attribution and rights

Original project source docstrings and the newly authored catalogue text are
Apache-2.0 project contributions with no invented owner; see the exact
[`LICENSE`](../LICENSE). This adapter and its tests adapt the **accepted**
`FormalFrontier/polynomial-root-stability` generator/test expressions at
`95ac896f81a3190b2634a4246a3e924d2a267a61` (themselves adaptations
from Anchor's ideal-completion Markdown recipe at
`f0c8c34386109116e4912fb425a8ad15d9dc42a4`). Worker-b authored this
mixed-kind, seven-module adaptation and its original catalogue notes. Those
adapted project files carry the donor's Apache-2.0 SPDX expression and
contributor credit; no copyright owner is asserted. Native signatures cite
types from Lean/mathlib but **do not copy upstream dependency docstrings**;
doc-gen4's original Apache-2.0 tool and excluded website assets keep upstream
notices in their own checkout. No third-party license is overridden by this
project's LICENSE. Exact rights, provenance and artifact review remain distinct
prerequisites for any internal or private GitHub release.

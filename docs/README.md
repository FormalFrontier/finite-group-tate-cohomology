# Native reference and reproducibility

The [mixed-kind API reference](API.md) and [manifest](api-manifest.json) describe
**seven** shipped modules. Their original native data analyzes source checkpoint
`cba7734f0dddc4601fc1951d9eaca29a831e4bf7` (tree
`52a73df34550707c12fa7d72aa82e705dbf3e69c`). The ten frozen
Lean/pin/configuration inputs also occur **byte-for-byte** in the prior official
publication `1ffe47ec77e24c0d0bca827b6f4ec6ca91e3351c` (tree
`836d08366e30a6159ad54f692c55833297c13e88`). Historical **Source**
links in the API resolve against that exact official GitHub revision. The
current checkout's seven improved SPDX headers change those input hashes even
though the native declaration positions are unchanged. Its local module links
are for current use, **not** historical native-source bindings.

The native tables contain **102 production named entries** (37 definitions,
63 theorems, two named instances), **63 checked-use entries** (18 definitions,
45 theorems) and zero new names in the two reexport roots. Native `def` also
covers source `abbrev`; compiler-generated `@[reassoc]` names and displayed
implicit binders are retained. Of the 165 entry descriptions, 111 match source
docstrings and the other 54 are explicitly **original catalogue explanations**
(9 Norm, 29 Basic, 12 CyclicModelFunctor, four CyclicPeriodicity), not invented
Lean docstrings. No mathlib dependency docstrings, native site assets, JS,
fonts or HTML are bundled.

This is a **public/native filtered reference**, not a private/generated proof
census, axiom certificate, release acceptance or selected-source coverage
claim. The source has 17 explicitly private helpers, with further generated
and private proof bodies. The prior 293 imported + 106 source-private + 14
upstream + 26 client axiom printings overlap: **439 printings are not 439
unique proofs**. At the original inputs, 54 optional-doc lint outcomes and
15 truthful-header lint outcomes were retained as **NONPASS** with reasons;
updating today's seven headers does not retroactively pass either historical
run. Historical stored-body verification is an input-specific fact, not a new
separate replay requirement. A release needs applicable complete transitive
standard-axiom evidence including private/generated declarations and separate
substantive review, rights/provenance and protected acceptance.

## Ordinary current-checkout use

From this checkout, with Lean `leanprover/lean4:v4.34.0-rc2` and direct mathlib
`83abb3e776bdefcbc447a1e44d0debe4010039e5` pinned in the current
project configuration (the historical native records below retain the earlier pin):

```sh
elan toolchain install "$(cat lean-toolchain)"
lake exe cache get
LEAN_NUM_THREADS=2 lake --wfail build
```

The **default warning-fatal build includes production and client roots**.
Focused client builds or direct Lean invocations are optional. Each new
checkout must successfully fetch the matching mathlib cache before building;
a failed fetch is not permission to compile mathlib from source. The pinned
`lake --help` does not establish `LAKE_JOBS` as a process bound, and
`LEAN_NUM_THREADS=2` bounds Lean runtime threads, not total Lake processes
or memory. This current checkout intentionally **fails** the historical
`SOURCE_INPUT_SHA256` guard in both Python scripts: changing that guard or
rehashing original native records would destroy the historical binding.

## Historical sources and optional native extraction

The original inputs are immutable **P** above, not a mutable `main`, not the
current corrected-header checkout and not a claim that P's **old renderer**
produces this version's cosmetic Source links. When the official historical
publication is accessible, obtain it and verify its exact commit/tree:

```sh
P=1ffe47ec77e24c0d0bca827b6f4ec6ca91e3351c
HIST=/absolute/path/to/tate-history
# In a fresh directory whose parent is writable:
git clone https://github.com/FormalFrontier/finite-group-tate-cohomology.git "$HIST"
git -C "$HIST" checkout --detach "$P"
test "$(git -C "$HIST" rev-parse HEAD)" = "$P"
test "$(git -C "$HIST" rev-parse HEAD^{tree})" = 836d08366e30a6159ad54f692c55833297c13e88
```

The optional Git-dependent extraction runs **only from HIST**. Obtain the
separate core-only `leanprover/doc-gen4` checkout at
`97d4ecdfc8e09e7f511724c25e303d448de6a3db` (tree
`ebf77f3e174c145c9ca2db0df1c18a78ae87c93b`), verify that checkout,
and build its `doc-gen4` executable with its own pinned Lean toolchain. This
is **not** a Lake dependency of the Tate project. If `cc` is missing,
prepend `$(dirname "$(elan which lean)")` to the tool-build `PATH`.
For example:

```sh
DOCGEN=/absolute/path/to/doc-gen4
git clone https://github.com/leanprover/doc-gen4.git "$DOCGEN"
git -C "$DOCGEN" checkout --detach 97d4ecdfc8e09e7f511724c25e303d448de6a3db
test "$(git -C "$DOCGEN" rev-parse HEAD^{tree})" = ebf77f3e174c145c9ca2db0df1c18a78ae87c93b
(
  cd "$DOCGEN"
  elan toolchain install "$(cat lean-toolchain)"
  lake build doc-gen4
)
```

Build the historical Tate sources only after that checkout's cache fetch:

```sh
TOOL=/absolute/path/to/doc-gen4/.lake/build/bin/doc-gen4
OUT=/absolute/path/to/fresh/native-output
mkdir -p "$OUT/build" "$OUT/render" "$OUT/native-input"
(
  cd "$HIST"
  elan toolchain install "$(cat lean-toolchain)"
  lake exe cache get
  LEAN_NUM_THREADS=2 lake --wfail build
  REV=cba7734f0dddc4601fc1951d9eaca29a831e4bf7
  for module in FiniteGroupTateCohomology.Norm FiniteGroupTateCohomology.Basic \
                FiniteGroupTateCohomology.CyclicModelFunctor \
                FiniteGroupTateCohomology.CyclicPeriodicity FiniteGroupTateCohomology \
                FiniteGroupTateCohomologyTests.PublicAPI FiniteGroupTateCohomologyTests; do
    path="${module//.//}.lean"
    LEAN_NUM_THREADS=2 lake env "$TOOL" single --build "$OUT/build" "$module" \
      "$OUT/build/api.db" "https://example.invalid/commit/$REV/$path"
  done
)
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
```

Here `example.invalid` is an **inert native-record identity** checked by the
original adapter, never a reader-facing Source URL. Use exactly seven raw
`declaration-data-*.bmp` records, without additional dependency-module records.
The original records, database, command receipts and warnings are retained
outside this shipping tree. No native extraction or proof check is performed
by merely reading this guide.

## Source-only replay against the current presentation

This separate sandbox combines exactly **ten original source/pin inputs from P**
with **four current files from this checkout**: `scripts/generate_api.py`,
`scripts/test_generate_api.py`, `docs/API.md`, `docs/api-manifest.json`. It
requires the seven genuine external raw native records in an absolute
`NATIVE=/absolute/path/to/seven-records` directory (either retained originals
or generated in the optional historical extraction above). It requires no
Git executable or commit object *inside* the sandbox. Starting in the current
checkout, after the verified `HIST` checkout above:

```sh
SANDBOX=$(mktemp -d)
NATIVE=/absolute/path/to/seven-records
for path in FiniteGroupTateCohomology.lean \
            FiniteGroupTateCohomology/Norm.lean \
            FiniteGroupTateCohomology/Basic.lean \
            FiniteGroupTateCohomology/CyclicModelFunctor.lean \
            FiniteGroupTateCohomology/CyclicPeriodicity.lean \
            FiniteGroupTateCohomologyTests.lean \
            FiniteGroupTateCohomologyTests/PublicAPI.lean \
            lake-manifest.json lakefile.toml lean-toolchain; do
  mkdir -p "$SANDBOX/$(dirname "$path")"
  cp "$HIST/$path" "$SANDBOX/$path"
done
mkdir -p "$SANDBOX/scripts" "$SANDBOX/docs"
cp scripts/generate_api.py scripts/test_generate_api.py "$SANDBOX/scripts/"
cp docs/API.md docs/api-manifest.json "$SANDBOX/docs/"
(
  cd "$SANDBOX"
  python3 -B - <<'PY'
import hashlib
import json
from pathlib import Path
manifest = json.loads(Path('docs/api-manifest.json').read_text())
for path, expected in manifest['inputs'].items():
    assert hashlib.sha256(Path(path).read_bytes()).hexdigest() == expected, path
print('10/10 historical source/pin hashes match')
PY
  python3 -B scripts/test_generate_api.py --native-data "$NATIVE"
  python3 -B scripts/generate_api.py --native-data "$NATIVE" \
    --source-revision cba7734f0dddc4601fc1951d9eaca29a831e4bf7 \
    --docgen-revision 97d4ecdfc8e09e7f511724c25e303d448de6a3db --check
)
```

Both scripts above must run **in the sandbox**, not directly in the
corrected-header C checkout or with P's older renderer. Success means the
old hashes, authentic native records, negative controls, source positions,
current presentation and its manifest match; it is neither a new extraction
nor proof/axiom/rights/release certification. The adapter rejects input
changes, record count/name/kind/source/docstring/signature drift, active HTML,
raw-hash drift, unexpected revision/tool pins, optimizer mode, stale output
and extra files. It checks all 165 visible native rows and two instance rows,
including the 54 separate original explanations. The raw and normalized hashes
happen to agree for this pinned output, but neither field is redefined by the
new public links. Without access to the seven authentic raw records, the full
native suite and replay **cannot be claimed run**; simple static checks of
shipped text do not replace it.

## Attribution and rights

The source docstrings and 54 catalogue explanations are original project work
under Apache-2.0 ([`LICENSE`](../LICENSE)); there is no invented copyright
owner. Formal Frontier contributors wrote the original mixed-kind seven-module
adapter and later norm/NatIso extensions. Its Python generator and tests adapt
Polynomial Root Stability's expression, itself adapted from Anchor's Ideal
Completion Markdown recipe.
Beacon is this unit's responsible maintainer; Lattice independently reviewed
earlier mathematical development. Lean/mathlib's upstream Tate APIs and
contributors retain their own notices. Native signatures cite upstream types,
not copied upstream docstrings; no third-party website assets are shipped.
Rights review, mathematical acceptance and source correspondence remain
separate from this native reference.

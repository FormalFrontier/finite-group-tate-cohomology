# Finite-group Tate cohomology

Reusable Lean mathematics for the norm, exceptional Tate degrees and additive
cyclic period two. The library builds on mathlib's Tate complex and finite-cyclic
resolution, rather than duplicating them. It is independent of any particular
source's interpretation or coverage records.

## Public imports and API

`import FiniteGroupTateCohomology` reexports all four modules below. Individual
modules may also be imported directly, using the same public declarations.
The [complete native mixed-kind API reference](docs/API.md),
[reproduction and provenance guide](docs/README.md) and
[input/hash manifest](docs/api-manifest.json) also account for the public
checked-use client module and both zero-entry reexport roots.

| Module | Main API |
| --- | --- |
| `FiniteGroupTateCohomology.Norm` | `normFromCoinvariants`, `normNatTrans`, `quotientNorm`, `quotientNorm_mk`, `quotientNormNatTrans` and their naturality lemmas. |
| `FiniteGroupTateCohomology.Basic` | `tateOpcyclesIsoNegOne`, `tateCyclesIsoZero`, `normSequence`, `normSequence_exact`, its first mono/last epi, `tateCohomologyNegOneIsoKernelNorm`, `tateCohomologyZeroIsoCokernelNorm` and their natural isomorphisms of coefficient functors. |
| `FiniteGroupTateCohomology.CyclicModelFunctor` | Fixed-element `Cyclic.normHomCompSubFunctor` / `subCompNormHomFunctor`, `evenModelFunctor` / `oddModelFunctor`, their maps, object/map equations and identity/composition laws. |
| `FiniteGroupTateCohomology.CyclicPeriodicity` | `Cyclic.evenModel` / `oddModel`, generator-dependent model identifications, `tateCohomologyIsoEven` / `tateCohomologyIsoOdd`, `tateCohomologyParityIso` and `tateCohomologyPeriodicity` with inverse/telescoping laws. |

For a finite group, `normFromCoinvariants` maps coinvariants to invariants;
`normSequence` has the order `Tate⁻¹ → coinvariants → invariants → Tate⁰` and
identifies the exceptional groups with the kernel and cokernel of this norm.
`Norm` allows *independent* scalar, group and coefficient universes. Its
`quotientNorm` is equivariant for the residual quotient of a **finite normal
subgroup of an arbitrary ambient group**; neither ambient finiteness nor
commutativity is assumed. The exceptional-degree API in `Basic` has the pinned
Tate-complex *same-universe* boundary. No field, nontriviality or characteristic
hypothesis is imposed on these theorems.

The fixed-`g` functors need only an element of a finite commutative group, **not
a proof it generates**. Their even short complex is `A --N--> A --(g - 1)--> A`;
their odd short complex reverses the two maps. For comparison with Tate
cohomology, `CyclicPeriodicity` additionally requires an *explicit generator*
`hg : ∀ x, x ∈ Subgroup.zpowers g`. Its all-integer comparisons at `0` and
`-1` factor through the exceptional cokernel/kernel identifications. Its
periodicity and telescoping laws are **objectwise**. Although the alternating
models vary naturally in the coefficient representation, the Tate comparison
isomorphisms are not asserted natural: the pinned mathlib comparisons used here
do not supply that naturality.

For checked downstream usage (including finite nontrivial and degenerate cases),
see [`FiniteGroupTateCohomologyTests/PublicAPI.lean`](FiniteGroupTateCohomologyTests/PublicAPI.lean).
Its order-two group and coefficients are genuinely nontrivial, its zero
coefficient endomorphism is **not** the identity, and its finite normal
subgroup example uses the **whole** group, not a proper subgroup. Further
clients cover degrees `-2` through `2` and zero-ring/trivial-group cases;
they are checked uses, not new production theorems.
Applications may import the
root or an individual module without importing private implementation bodies.

## Reproduce

The pins are Lean `leanprover/lean4:v4.34.0-rc2` (`lean-toolchain`) and mathlib
`e37d88a26f3791ed5a93daa1f949af1021b8d103` (`lakefile.toml` and
`lake-manifest.json`). From this repository root, **fetch the matching mathlib
cache successfully before any build**; do not silently rebuild mathlib from
source if the cache fails:

```sh
elan toolchain install "$(cat lean-toolchain)"
lake exe cache get
LEAN_NUM_THREADS=2 lake --wfail build
LEAN_NUM_THREADS=2 lake --wfail build FiniteGroupTateCohomologyTests
lake env lean -DwarningAsError=true FiniteGroupTateCohomologyTests/PublicAPI.lean
lake env lean -T0 -DwarningAsError=true FiniteGroupTateCohomologyTests/PublicAPI.lean
```

The pinned `lake --help` does **not** document `LAKE_JOBS` as a verified
concurrency bound. `LEAN_NUM_THREADS=2` sets Lean runtime threads only, not
Lake's total process count or an overall memory cap. Each checkout needs its
own successful cache fetch before building. The separately pinned native
documentation tool and seven-module generation/replay recipe are in
[`docs/README.md`](docs/README.md).

The default build includes the production library and the public-client test
library. Import the root to access the whole interface or import an individual
module for a narrower dependency. Downstream users must pin a reviewed release
before treating any development commit as a versioned dependency.

## Scope and provenance

At this documentation author's September 25, 2026 snapshot, development PR12
had **already** completed the bounded module migration, public examples and
metadata step: merged at `9882255fffc9960eb01497ae2edce43ccf877408`
after ordinary-main acceptance and independent development review. The norm,
exceptional-degree descriptions, quotient-equivariant norm, cyclic objectwise
comparisons and fixed-element coefficient functors were present on that accepted
development branch. New native documentation, full release audit, final rights
clearance, exact-head independent review and release acceptance remained
**pending at authoring**; this is not a live claim about future promotion.
An external exact-candidate acceptance/publication record, not this file or
its historic labels, establishes any later release. Neither source completion
nor compatibility of a future published release follows from this development
snapshot.

The library does **not** provide a complete standard-resolution comparison,
generator independence, naturality of Tate comparisons or periodicity, an
integral degree-two class, cup-product periodicity, a coefficient exact hexagon,
or local duality. These require additional results; do not infer them from the
objectwise period-two isomorphisms.

The mathematical starting points are the classical finite-group Tate norm
sequence and cyclic additive period two. Formal dependency citations are
mathlib4 `e37d88a26f3791ed5a93daa1f949af1021b8d103` modules
`Mathlib.RepresentationTheory.Homological.TateCohomology.Basic`,
`Mathlib.RepresentationTheory.Homological.FiniteCyclic`, and the associated
group-(co)homology finite-cyclic comparison modules; see the exact
`lake-manifest.json` pin. These are dependency/API citations, **not**
source-specific correspondence or a claim of novelty over mathlib.

**Authors: Formal Frontier Agents.** Original project contributions are licensed
under Apache-2.0; the complete text is in [`LICENSE`](LICENSE). The development includes
contributions by Beacon and formalization workers identified in the Git history,
and builds on mathlib's independently credited, Apache-2.0-licensed Tate and
finite-cyclic APIs (including work by Yunzhou Xie, Yaël Dillies and Amelia
Livingston). Upstream authors and notices remain with their upstream material;
this project's license does not supersede any third-party rights. AI-assisted
agents contributed formalization, examples and documentation. Checked Lean proofs
and independent reviews, not AI authorship, determine mathematical status;
development review is not review or clearance of this documentation candidate.
The native reference carries matched original source docstrings and original
catalogue notes; its adapter credits the accepted polynomial-root-stability
donor and its earlier Anchor expression origin in [`docs/README.md`](docs/README.md).
At this author's dated snapshot, complete rights/provenance and redistribution
review of the entire artifact and eventual published history still remained
to be performed independently. Source-specific correspondence and coverage
belong in their source repositories.

## Measured build and documentation baseline

On September 25, 2026, in a fresh checkout of the ten unchanged source/pin
inputs above, Lean `v4.34.0-rc2`, pinned mathlib and **successfully fetched
8,892 precompiled cache artifacts** preceded the warning-fatal default build.
With `LEAN_NUM_THREADS=2` (and no `LAKE_JOBS` set), `lake --wfail build`
completed **2,432 jobs in 15.045 s real** (18.051 s user, 4.655 s system).
The separate pinned, core-only doc-gen4 executable built 194 jobs in 125.883 s
real; seven native `single` invocations took **2.911–3.176 s each** (21.321 s
combined), `bibPrepass --none` 0.104 s and `fromDb` 0.244 s. The no-bibliography
step printed `INFO: reference page disabled`, not a suppressed warning. A
second fresh native run produced byte-identical database and all seven raw
records; command logs and records are retained externally, not shipped here.
The 15-GiB cgroup limit was 16,106,127,360 bytes; one-second samples of its
shared `memory.current` reached 13,836,591,104 bytes during the default build,
and two-second samples reached 13,521,739,776 bytes during the first native
run. Shared cgroup accounting includes caches/other jobs, so these samples
are **not** a measured peak RSS or a portable resource guarantee. Cache-first
success, timings and native signatures do not replace full private/generated
proof census, stored-body verification or final artifact acceptance.

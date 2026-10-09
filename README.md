# Finite-group Tate cohomology

Reusable Lean mathematics for the norm, exceptional Tate degrees and additive
cyclic period two. The library builds on mathlib's Tate complex and finite-cyclic
resolution, rather than duplicating them. It is independent of any particular
source's interpretation or coverage records.

## Headline results

- **Natural norms.** For a commutative scalar ring and finite group, the
  [norm from coinvariants to invariants](FiniteGroupTateCohomology/Norm.lean#L29)
  is natural in the coefficient representation. For a finite normal subgroup
  of an arbitrary ambient group, the
  [residual-quotient-equivariant norm](FiniteGroupTateCohomology/Norm.lean#L102)
  is natural as well; the ambient group need not be finite or commutative.
  This module permits independent scalar, group and coefficient universes.
- **Exceptional degrees.** The
  [exact norm sequence](FiniteGroupTateCohomology/Basic.lean#L285)
  `Tate⁻¹ → M_G → M^G → Tate⁰` identifies degrees −1 and 0 naturally with
  the norm's kernel and cokernel. Both
  [natural isomorphisms](FiniteGroupTateCohomology/Basic.lean#L352)
  (including their [component identities](FiniteGroupTateCohomology/Basic.lean#L452))
  are shipped, not proposed; this layer inherits the same-universe boundary
  of the pinned Tate-complex API.
- **Fixed-element coefficient functors.** For an element `g` of a finite
  commutative group, the [even](FiniteGroupTateCohomology/CyclicModelFunctor.lean#L127)
  and [odd](FiniteGroupTateCohomology/CyclicModelFunctor.lean#L133)
  alternating `N`/`g−1` homology models are functorial in coefficients.
  This construction does not require `g` to generate the group.
- **Objectwise additive period two.** With a chosen element satisfying
  `∀ x, x ∈ Subgroup.zpowers g`, the
  [all-integer Tate comparisons](FiniteGroupTateCohomology/CyclicPeriodicity.lean#L197)
  give [period-two isomorphisms](FiniteGroupTateCohomology/CyclicPeriodicity.lean#L305).
  [Same-parity comparisons](FiniteGroupTateCohomology/CyclicPeriodicity.lean#L262)
  have identity, inverse and telescoping laws; these Tate comparisons are
  **objectwise**, not claimed natural in the coefficient representation.

## Using the library

Add the library to your `lakefile.toml`:

```toml
[[require]]
name = "finite-group-tate-cohomology"
git = "https://github.com/FormalFrontier/finite-group-tate-cohomology.git"
rev = "main"
```

GitHub `main` contains reviewed releases. Lake resolves the latest release when
first adding or updating the dependency; `lake-manifest.json` retains the resolved
commit until the next update. To pin a particular release, replace `main` with
its full commit hash. Dependencies between libraries use full published-release
commit pins.

```lean
import FiniteGroupTateCohomology
```

## Public imports and API

`import FiniteGroupTateCohomology` reexports all four modules below. Individual
modules may also be imported directly, using the same public declarations.
The [complete native mixed-kind API reference](docs/API.md),
[reproduction and provenance guide](docs/README.md) and
[input/hash manifest](docs/api-manifest.json) also account for the public
checked-use client module and both zero-entry reexport roots. These documents
record their earlier pinned source bytes, not a catalogue certified for the
current Mathlib revision.

| Module | Main API |
| --- | --- |
| [`FiniteGroupTateCohomology.Norm`](FiniteGroupTateCohomology/Norm.lean) | `normFromCoinvariants`, `normNatTrans`, `normNatTrans_app`, `quotientNorm`, `quotientNorm_mk`, `quotientNormNatTrans`, `quotientNormNatTrans_app` and their naturality lemmas. |
| [`FiniteGroupTateCohomology.Basic`](FiniteGroupTateCohomology/Basic.lean) | `tateOpcyclesIsoNegOne`, `tateCyclesIsoZero`, `normSequence`, `normSequence_exact`, its first mono/last epi, `tateCohomologyNegOneIsoKernelNorm`, `tateCohomologyZeroIsoCokernelNorm`, their natural isomorphisms of coefficient functors and the two `*NatIso*_hom_app` component lemmas. |
| [`FiniteGroupTateCohomology.CyclicModelFunctor`](FiniteGroupTateCohomology/CyclicModelFunctor.lean) | Fixed-element `Cyclic.normHomCompSubFunctor` / `subCompNormHomFunctor`, `evenModelFunctor` / `oddModelFunctor`, their maps, object/map equations and identity/composition laws. |
| [`FiniteGroupTateCohomology.CyclicPeriodicity`](FiniteGroupTateCohomology/CyclicPeriodicity.lean) | `Cyclic.evenModel` / `oddModel`, generator-dependent model identifications, `tateCohomologyIsoEven` / `tateCohomologyIsoOdd`, `tateCohomologyParityIso` and `tateCohomologyPeriodicity` with inverse/telescoping laws. |

For a finite group, `normFromCoinvariants` maps coinvariants to invariants;
`normSequence` has the order `Tate⁻¹ → coinvariants → invariants → Tate⁰` and
identifies the exceptional groups with the kernel and cokernel of this norm.
`Norm` allows *independent* scalar, group and coefficient universes. Its
`quotientNorm` is equivariant for the residual quotient of a **finite normal
subgroup of an arbitrary ambient group**; neither ambient finiteness nor
commutativity is assumed. The exceptional-degree API in `Basic` has the pinned
Tate-complex *same-universe* boundary. No field, nontriviality or characteristic
hypothesis is imposed on these theorems.
The two public `*_app` lemmas identify the natural-transformation components
with these maps, also after ordinary functor whiskering. For example, the
checked native client uses `Functor.whiskerRight_app`,
`Functor.whiskerLeft_app` and `quotientNormNatTrans_app` to expose the residual
norm supplied to a postcomposed functor. Neither component lemma requires
access to a private definition. The exceptional-degree
`tateCohomologyNegOneNatIsoKernelNorm_hom_app` and
`tateCohomologyZeroNatIsoCokernelNorm_hom_app` additionally identify each
natural-isomorphism component with its objectwise comparison. They retain
`Basic`'s same-universe assumptions; the ordinary native clients compose them
with the kernel inclusion and cokernel projection.

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
clients cover independent universes, norm components and their naturality,
representatives and whiskering, degrees `-2` through `2`, and zero-ring/trivial-group cases;
they are checked uses, not new production theorems.
Applications may import the
root or an individual module without importing private implementation bodies.

## Reproduce

The pins are Lean `leanprover/lean4:v4.34.0-rc2` (`lean-toolchain`) and mathlib
`83abb3e776bdefcbc447a1e44d0debe4010039e5` (`lakefile.toml` and
`lake-manifest.json`). From this repository root, **fetch the matching mathlib
cache successfully before any build**; do not silently rebuild mathlib from
source if the cache fails:

```sh
elan toolchain install "$(cat lean-toolchain)"
lake exe cache get
LEAN_NUM_THREADS=2 lake --wfail build
```

The warning-fatal default build includes **both** production and checked-use
client roots. A focused client build or direct Lean invocation is optional,
not an additional public-use or release gate.

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

The library implements the four groups above on top of pinned mathlib's Tate
complex, finite-cyclic comparison and group-(co)homology APIs. It supplies
original project norms, exactness, natural exceptional-degree comparisons,
fixed-element coefficient functors and generator-dependent **objectwise**
periodicity; it does not assert completed correspondence to any selected
source. The [native reference](docs/API.md) lists 102 production entries and
63 checked-use client entries, not every private or generated proof body.
Its [guide](docs/README.md) explains the historical source-byte binding and
optional reproduction of that reference; current source headers differ from
the originals analyzed for its native records.

The library does **not** provide a complete standard-resolution comparison,
generator independence, naturality of the Tate comparisons or periodicity, an
integral degree-two class, cup-product periodicity, a coefficient exact hexagon,
cohomological triviality, local duality or NSW coverage. Fixed-class lifting
in separate later work is not part of this library. The order-two and
degenerate clients illustrate checked usage, not new production results.

**Authors: Formal Frontier Agents.** Beacon is the responsible maintainer for
this contribution; Lattice provided independent review of earlier mathematical
development. Formalization workers contributed the original mixed-kind native
reference and catalogue, subsequent norm and exceptional NatIso components,
and checked-use examples. AI-assisted agents contributed mathematics, clients
and documentation; checked proofs and independent review, not AI authorship,
determine acceptance. The adapter follows the Root Stability → Ideal
Completion lineage described in the [guide](docs/README.md). Original project
contributions use Apache-2.0 ([`LICENSE`](LICENSE)); there is no invented
copyright owner. The pinned mathlib dependency provides separate Tate and
finite-cyclic APIs, credited upstream to contributors including Yunzhou Xie,
Yaël Dillies and Amelia Livingston. Dependency reuse is not the entire project
contribution and does not itself establish source-specific coverage.

# Native API reference

Fixed Lean `v4.34.0-rc2`, mathlib `e37d88a26f3791ed5a93daa1f949af1021b8d103`
and separately pinned doc-gen4 `97d4ecdfc8e09e7f511724c25e303d448de6a3db`. Full displayed signatures
retain all native implicit arguments, typeclasses and universe variables.
There are 102 production named declarations (including two named instances)
and 63 checked-use client declarations, across seven shipped modules.
The production and client reexport roots each have zero new named entries.
The filtered native tables do **not** enumerate private declarations or
generated proof bodies; this reference does not certify axioms, proofs,
source coverage, rights or a release. [Reproduce and assess provenance](README.md).

Source links point only to the matching `.lean` files shipped here.
**Native source docstring** reproduces a matched source comment;
**Original catalogue explanation** is newly written here for an entry
without a Lean docstring (including compiler-generated association laws).

## Production API (102 native named entries)

### FiniteGroupTateCohomology.normFromCoinvariants

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.normFromCoinvariants {R : Type u} {G : Type v} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : (Rep.coinvariantsFunctor R G).obj M ⟶ (Rep.invariantsFunctor R G).obj M
```

**Native source docstring:** The norm map on a representation, descended from coinvariants and
corestricted to invariants.

[Source](../FiniteGroupTateCohomology/Norm.lean#L29) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.invariantsMap_inclusion

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.invariantsMap_inclusion {R : Type u} {G : Type v} [CommRing R] [Group G] {M N : Rep R G} (f : M ⟶ N) : CategoryTheory.CategoryStruct.comp ((Rep.invariantsFunctor R G).map f) (ModuleCat.ofHom N.ρ.invariants.subtype) = CategoryTheory.CategoryStruct.comp (ModuleCat.ofHom M.ρ.invariants.subtype) (Rep.Hom.toModuleCatHom f)
```

**Original catalogue explanation (not a Lean docstring):** A coefficient morphism commutes with the inclusion of invariant vectors.

[Source](../FiniteGroupTateCohomology/Norm.lean#L39) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.invariantsMap_inclusion_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.invariantsMap_inclusion_assoc {R : Type u} {G : Type v} [CommRing R] [Group G] {M N : Rep R G} (f : M ⟶ N) {Z : ModuleCat R} (h : ↧↑N ⟶ Z) : CategoryTheory.CategoryStruct.comp ((Rep.invariantsFunctor R G).map f) (CategoryTheory.CategoryStruct.comp (ModuleCat.ofHom N.ρ.invariants.subtype) h) = CategoryTheory.CategoryStruct.comp (ModuleCat.ofHom M.ρ.invariants.subtype) (CategoryTheory.CategoryStruct.comp (Rep.Hom.toModuleCatHom f) h)
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `invariantsMap_inclusion`. A coefficient morphism commutes with the inclusion of invariant vectors.

[Source](../FiniteGroupTateCohomology/Norm.lean#L39) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.coinvariantsMk_normFromCoinvariants_inclusion

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.coinvariantsMk_normFromCoinvariants_inclusion {R : Type u} {G : Type v} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.CategoryStruct.comp ((Rep.coinvariantsMk R G).app M) (CategoryTheory.CategoryStruct.comp (normFromCoinvariants M) (ModuleCat.ofHom M.ρ.invariants.subtype)) = Rep.Hom.toModuleCatHom M.norm
```

**Original catalogue explanation (not a Lean docstring):** Composing the coinvariants quotient with the norm and invariant inclusion recovers the representation norm.

[Source](../FiniteGroupTateCohomology/Norm.lean#L46) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.coinvariantsMk_normFromCoinvariants_inclusion_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.coinvariantsMk_normFromCoinvariants_inclusion_assoc {R : Type u} {G : Type v} [CommRing R] [Group G] [Fintype G] (M : Rep R G) {Z : ModuleCat R} (h : ↧↑M ⟶ Z) : CategoryTheory.CategoryStruct.comp ((Rep.coinvariantsMk R G).app M) (CategoryTheory.CategoryStruct.comp (normFromCoinvariants M) (CategoryTheory.CategoryStruct.comp (ModuleCat.ofHom M.ρ.invariants.subtype) h)) = CategoryTheory.CategoryStruct.comp (Rep.Hom.toModuleCatHom M.norm) h
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `coinvariantsMk_normFromCoinvariants_inclusion`. Composing the coinvariants quotient with the norm and invariant inclusion recovers the representation norm.

[Source](../FiniteGroupTateCohomology/Norm.lean#L46) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normFromCoinvariants_naturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normFromCoinvariants_naturality {R : Type u} {G : Type v} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) : CategoryTheory.CategoryStruct.comp (normFromCoinvariants M) ((Rep.invariantsFunctor R G).map f) = CategoryTheory.CategoryStruct.comp ((Rep.coinvariantsFunctor R G).map f) (normFromCoinvariants N)
```

**Original catalogue explanation (not a Lean docstring):** The ordinary norm commutes with coefficient morphisms, giving the natural-transformation equation.

[Source](../FiniteGroupTateCohomology/Norm.lean#L54) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normFromCoinvariants_naturality_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normFromCoinvariants_naturality_assoc {R : Type u} {G : Type v} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) {Z : ModuleCat R} (h : (Rep.invariantsFunctor R G).obj N ⟶ Z) : CategoryTheory.CategoryStruct.comp (normFromCoinvariants M) (CategoryTheory.CategoryStruct.comp ((Rep.invariantsFunctor R G).map f) h) = CategoryTheory.CategoryStruct.comp ((Rep.coinvariantsFunctor R G).map f) (CategoryTheory.CategoryStruct.comp (normFromCoinvariants N) h)
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `normFromCoinvariants_naturality`. The ordinary norm commutes with coefficient morphisms, giving the natural-transformation equation.

[Source](../FiniteGroupTateCohomology/Norm.lean#L54) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normNatTrans

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.normNatTrans {R : Type u} {G : Type v} [CommRing R] [Group G] [Fintype G] : Rep.coinvariantsFunctor R G ⟶ Rep.invariantsFunctor R G
```

**Native source docstring:** The norm from coinvariants to invariants, natural in the representation.

[Source](../FiniteGroupTateCohomology/Norm.lean#L68) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normNatTrans_app

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normNatTrans_app {R : Type u} {G : Type v} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : normNatTrans.app M = normFromCoinvariants M
```

**Native source docstring:** The component of the norm natural transformation is the norm map.

[Source](../FiniteGroupTateCohomology/Norm.lean#L75) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.quotientNorm

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.quotientNorm {R : Type u} [CommRing R] {H : Type v} [Group H] (A : Rep R H) (S : Subgroup H) [S.Normal] [Fintype ↥S] : A.quotientToCoinvariants S ⟶ A.quotientToInvariants S
```

**Native source docstring:** For a finite normal subgroup `S` of `H`, the `S`-norm is equivariant for
the residual `H ⧸ S`-action on coinvariants and invariants.

[Source](../FiniteGroupTateCohomology/Norm.lean#L102) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.quotientNorm_mk

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.quotientNorm_mk {R : Type u} [CommRing R] {H : Type v} [Group H] (A : Rep R H) (S : Subgroup H) [S.Normal] [Fintype ↥S] (x : ↑A) : (CategoryTheory.ConcreteCategory.hom (quotientNorm A S)) ((Representation.Coinvariants.mk (MonoidHom.comp A.ρ S.subtype)) x) = ⟨(Representation.norm (MonoidHom.comp A.ρ S.subtype)) x, ⋯⟩
```

**Original catalogue explanation (not a Lean docstring):** Computes the residual quotient-equivariant norm on a coinvariant representative.

[Source](../FiniteGroupTateCohomology/Norm.lean#L116) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.quotientNorm_naturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.quotientNorm_naturality {R : Type u} [CommRing R] {H : Type v} [Group H] (A : Rep R H) (S : Subgroup H) [S.Normal] [Fintype ↥S] {B : Rep R H} (f : A ⟶ B) : CategoryTheory.CategoryStruct.comp (quotientNorm A S) ((Rep.quotientToInvariantsFunctor R S).map f) = CategoryTheory.CategoryStruct.comp ((Rep.quotientToCoinvariantsFunctor R S).map f) (quotientNorm B S)
```

**Original catalogue explanation (not a Lean docstring):** The norm for a finite normal subgroup commutes with changes of coefficients.

[Source](../FiniteGroupTateCohomology/Norm.lean#L123) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.quotientNorm_naturality_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.quotientNorm_naturality_assoc {R : Type u} [CommRing R] {H : Type v} [Group H] (A : Rep R H) (S : Subgroup H) [S.Normal] [Fintype ↥S] {B : Rep R H} (f : A ⟶ B) {Z : Rep R (H ⧸ S)} (h : (Rep.quotientToInvariantsFunctor R S).obj B ⟶ Z) : CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (quotientNorm A S) ((Rep.quotientToInvariantsFunctor R S).map f)) h = CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp ((Rep.quotientToCoinvariantsFunctor R S).map f) (quotientNorm B S)) h
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `quotientNorm_naturality`. The norm for a finite normal subgroup commutes with changes of coefficients.

[Source](../FiniteGroupTateCohomology/Norm.lean#L123) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.quotientNormNatTrans

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.quotientNormNatTrans {R : Type u} [CommRing R] {H : Type v} [Group H] (S : Subgroup H) [S.Normal] [Fintype ↥S] : Rep.quotientToCoinvariantsFunctor R S ⟶ Rep.quotientToInvariantsFunctor R S
```

**Native source docstring:** The residual-quotient-equivariant norm, natural in the ambient
representation.

[Source](../FiniteGroupTateCohomology/Norm.lean#L134) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.quotientNormNatTrans_app

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.quotientNormNatTrans_app {R : Type u} [CommRing R] {H : Type v} [Group H] (A : Rep R H) (S : Subgroup H) [S.Normal] [Fintype ↥S] : (quotientNormNatTrans S).app A = quotientNorm A S
```

**Native source docstring:** The component of the quotient-equivariant norm natural transformation is
the quotient-equivariant norm map, with no finiteness assumption on `H`.

[Source](../FiniteGroupTateCohomology/Norm.lean#L143) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateDNegTwoArrowIso

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.tateDNegTwoArrowIso {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.Arrow.mk ((tateComplex M).d (-2) (-1)) ≅ CategoryTheory.Arrow.mk (groupHomology.shortComplexH0 M).f
```

**Native source docstring:** The differential entering degree `-1` in the Tate complex, identified with
the concrete degree-zero group-homology differential.

[Source](../FiniteGroupTateCohomology/Basic.lean#L35) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateDNegTwoArrowIso_hom_right

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateDNegTwoArrowIso_hom_right {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.Arrow.Hom.right (tateDNegTwoArrowIso M).hom = (groupHomology.chainsIso₀ M).hom
```

**Original catalogue explanation (not a Lean docstring):** Identifies the right component of the arrow isomorphism at the differential entering Tate degree minus one.

[Source](../FiniteGroupTateCohomology/Basic.lean#L46) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateDZeroArrowIso

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.tateDZeroArrowIso {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.Arrow.mk ((tateComplex M).d 0 1) ≅ CategoryTheory.Arrow.mk (groupCohomology.shortComplexH0 M).g
```

**Native source docstring:** The differential leaving degree `0` in the Tate complex, identified with
the concrete degree-zero group-cohomology differential.

[Source](../FiniteGroupTateCohomology/Basic.lean#L50) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateDZeroArrowIso_hom_left

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateDZeroArrowIso_hom_left {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.Arrow.Hom.left (tateDZeroArrowIso M).hom = (groupCohomology.cochainsIso₀ M).hom
```

**Original catalogue explanation (not a Lean docstring):** Identifies the left component of the arrow isomorphism at the differential leaving Tate degree zero.

[Source](../FiniteGroupTateCohomology/Basic.lean#L61) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateOpcyclesIsoNegOne

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.tateOpcyclesIsoNegOne {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : HomologicalComplex.opcycles (tateComplex M) (-1) ≅ (Rep.coinvariantsFunctor R G).obj M
```

**Native source docstring:** The opcycles in degree `-1` of the Tate complex are the coinvariants.

[Source](../FiniteGroupTateCohomology/Basic.lean#L65) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCyclesIsoZero

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.tateCyclesIsoZero {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : HomologicalComplex.cycles (tateComplex M) 0 ≅ (Rep.invariantsFunctor R G).obj M
```

**Native source docstring:** The cycles in degree `0` of the Tate complex are the invariants.

[Source](../FiniteGroupTateCohomology/Basic.lean#L73) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.pOpcycles_tateOpcyclesIsoNegOne_hom

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.pOpcycles_tateOpcyclesIsoNegOne_hom {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.CategoryStruct.comp (HomologicalComplex.pOpcycles (tateComplex M) (-1)) (tateOpcyclesIsoNegOne M).hom = CategoryTheory.CategoryStruct.comp (CategoryTheory.Arrow.Hom.right (tateDNegTwoArrowIso M).hom) (groupHomology.shortComplexH0 M).g
```

**Original catalogue explanation (not a Lean docstring):** The negative-one opcycle identification commutes with the opcycle quotient projection.

[Source](../FiniteGroupTateCohomology/Basic.lean#L82) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.pOpcycles_tateOpcyclesIsoNegOne_hom_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.pOpcycles_tateOpcyclesIsoNegOne_hom_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) {Z : ModuleCat R} (h : (Rep.coinvariantsFunctor R G).obj M ⟶ Z) : CategoryTheory.CategoryStruct.comp (HomologicalComplex.pOpcycles (tateComplex M) (-1)) (CategoryTheory.CategoryStruct.comp (tateOpcyclesIsoNegOne M).hom h) = CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (CategoryTheory.Arrow.Hom.right (tateDNegTwoArrowIso M).hom) (groupHomology.shortComplexH0 M).g) h
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `pOpcycles_tateOpcyclesIsoNegOne_hom`. The negative-one opcycle identification commutes with the opcycle quotient projection.

[Source](../FiniteGroupTateCohomology/Basic.lean#L82) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.coinvariantsMk_tateOpcyclesIsoNegOne_inv

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.coinvariantsMk_tateOpcyclesIsoNegOne_inv {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.CategoryStruct.comp ((Rep.coinvariantsMk R G).app M) (tateOpcyclesIsoNegOne M).inv = CategoryTheory.CategoryStruct.comp (groupHomology.chainsIso₀ M).inv (HomologicalComplex.pOpcycles (tateComplex M) (-1))
```

**Original catalogue explanation (not a Lean docstring):** The inverse opcycle comparison sends the coinvariants quotient to the Tate opcycle projection.

[Source](../FiniteGroupTateCohomology/Basic.lean#L88) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.coinvariantsMk_tateOpcyclesIsoNegOne_inv_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.coinvariantsMk_tateOpcyclesIsoNegOne_inv_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) {Z : ModuleCat R} (h : HomologicalComplex.opcycles (tateComplex M) (-1) ⟶ Z) : CategoryTheory.CategoryStruct.comp ((Rep.coinvariantsMk R G).app M) (CategoryTheory.CategoryStruct.comp (tateOpcyclesIsoNegOne M).inv h) = CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (groupHomology.chainsIso₀ M).inv (HomologicalComplex.pOpcycles (tateComplex M) (-1))) h
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `coinvariantsMk_tateOpcyclesIsoNegOne_inv`. The inverse opcycle comparison sends the coinvariants quotient to the Tate opcycle projection.

[Source](../FiniteGroupTateCohomology/Basic.lean#L88) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCyclesIsoZero_hom_inclusion

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCyclesIsoZero_hom_inclusion {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero M).hom (groupCohomology.shortComplexH0 M).f = CategoryTheory.CategoryStruct.comp (HomologicalComplex.iCycles (tateComplex M) 0) (CategoryTheory.Arrow.Hom.left (tateDZeroArrowIso M).hom)
```

**Original catalogue explanation (not a Lean docstring):** The degree-zero cycle comparison commutes with the invariant submodule inclusion.

[Source](../FiniteGroupTateCohomology/Basic.lean#L96) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCyclesIsoZero_hom_inclusion_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCyclesIsoZero_hom_inclusion_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) {Z : ModuleCat R} (h : (groupCohomology.shortComplexH0 M).X₂ ⟶ Z) : CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero M).hom (CategoryTheory.CategoryStruct.comp (groupCohomology.shortComplexH0 M).f h) = CategoryTheory.CategoryStruct.comp (HomologicalComplex.iCycles (tateComplex M) 0) (CategoryTheory.CategoryStruct.comp (CategoryTheory.Arrow.Hom.left (tateDZeroArrowIso M).hom) h)
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `tateCyclesIsoZero_hom_inclusion`. The degree-zero cycle comparison commutes with the invariant submodule inclusion.

[Source](../FiniteGroupTateCohomology/Basic.lean#L96) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateOpcyclesIsoNegOne_naturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateOpcyclesIsoNegOne_naturality {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) : CategoryTheory.CategoryStruct.comp (HomologicalComplex.opcyclesMap (tateComplex.map f) (-1)) (tateOpcyclesIsoNegOne N).hom = CategoryTheory.CategoryStruct.comp (tateOpcyclesIsoNegOne M).hom ((Rep.coinvariantsFunctor R G).map f)
```

**Original catalogue explanation (not a Lean docstring):** The negative-one opcycle identification commutes with coefficient morphisms.

[Source](../FiniteGroupTateCohomology/Basic.lean#L104) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateOpcyclesIsoNegOne_naturality_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateOpcyclesIsoNegOne_naturality_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) {Z : ModuleCat R} (h : (Rep.coinvariantsFunctor R G).obj N ⟶ Z) : CategoryTheory.CategoryStruct.comp (HomologicalComplex.opcyclesMap (tateComplex.map f) (-1)) (CategoryTheory.CategoryStruct.comp (tateOpcyclesIsoNegOne N).hom h) = CategoryTheory.CategoryStruct.comp (tateOpcyclesIsoNegOne M).hom (CategoryTheory.CategoryStruct.comp ((Rep.coinvariantsFunctor R G).map f) h)
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `tateOpcyclesIsoNegOne_naturality`. The negative-one opcycle identification commutes with coefficient morphisms.

[Source](../FiniteGroupTateCohomology/Basic.lean#L104) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCyclesIsoZero_naturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCyclesIsoZero_naturality {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) : CategoryTheory.CategoryStruct.comp (HomologicalComplex.cyclesMap (tateComplex.map f) 0) (tateCyclesIsoZero N).hom = CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero M).hom ((Rep.invariantsFunctor R G).map f)
```

**Original catalogue explanation (not a Lean docstring):** The degree-zero cycle identification commutes with coefficient morphisms.

[Source](../FiniteGroupTateCohomology/Basic.lean#L126) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCyclesIsoZero_naturality_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCyclesIsoZero_naturality_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) {Z : ModuleCat R} (h : (Rep.invariantsFunctor R G).obj N ⟶ Z) : CategoryTheory.CategoryStruct.comp (HomologicalComplex.cyclesMap (tateComplex.map f) 0) (CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero N).hom h) = CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero M).hom (CategoryTheory.CategoryStruct.comp ((Rep.invariantsFunctor R G).map f) h)
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `tateCyclesIsoZero_naturality`. The degree-zero cycle identification commutes with coefficient morphisms.

[Source](../FiniteGroupTateCohomology/Basic.lean#L126) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCyclesIsoZero_inv_naturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCyclesIsoZero_inv_naturality {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) : CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero M).inv (HomologicalComplex.cyclesMap (tateComplex.map f) 0) = CategoryTheory.CategoryStruct.comp ((Rep.invariantsFunctor R G).map f) (tateCyclesIsoZero N).inv
```

**Original catalogue explanation (not a Lean docstring):** The inverse of the degree-zero cycle identification commutes with coefficient morphisms.

[Source](../FiniteGroupTateCohomology/Basic.lean#L152) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCyclesIsoZero_inv_naturality_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCyclesIsoZero_inv_naturality_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) {Z : ModuleCat R} (h : HomologicalComplex.cycles (tateComplex N) 0 ⟶ Z) : CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero M).inv (CategoryTheory.CategoryStruct.comp (HomologicalComplex.cyclesMap (tateComplex.map f) 0) h) = CategoryTheory.CategoryStruct.comp ((Rep.invariantsFunctor R G).map f) (CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero N).inv h)
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `tateCyclesIsoZero_inv_naturality`. The inverse of the degree-zero cycle identification commutes with coefficient morphisms.

[Source](../FiniteGroupTateCohomology/Basic.lean#L152) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normArrowFunctor

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.normArrowFunctor {R G : Type u} [CommRing R] [Group G] [Fintype G] : CategoryTheory.Functor (Rep R G) (CategoryTheory.Arrow (ModuleCat R))
```

**Native source docstring:** The natural norm, regarded as a functor to the arrow category.

[Source](../FiniteGroupTateCohomology/Basic.lean#L159) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normKernelFunctor

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.normKernelFunctor {R G : Type u} [CommRing R] [Group G] [Fintype G] : CategoryTheory.Functor (Rep R G) (ModuleCat R)
```

**Native source docstring:** Kernels of the norm, functorially in the representation.

[Source](../FiniteGroupTateCohomology/Basic.lean#L168) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normCokernelFunctor

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.normCokernelFunctor {R G : Type u} [CommRing R] [Group G] [Fintype G] : CategoryTheory.Functor (Rep R G) (ModuleCat R)
```

**Native source docstring:** Cokernels of the norm, functorially in the representation.

[Source](../FiniteGroupTateCohomology/Basic.lean#L173) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normKernelFunctor_map_ι

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normKernelFunctor_map_ι {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) : CategoryTheory.CategoryStruct.comp (normKernelFunctor.map f) ((CategoryTheory.Limits.ker.ι (ModuleCat R)).app (normArrowFunctor.obj N)) = CategoryTheory.CategoryStruct.comp ((CategoryTheory.Limits.ker.ι (ModuleCat R)).app (normArrowFunctor.obj M)) ((Rep.coinvariantsFunctor R G).map f)
```

**Original catalogue explanation (not a Lean docstring):** The norm-kernel functor's coefficient map commutes with its kernel inclusion.

[Source](../FiniteGroupTateCohomology/Basic.lean#L179) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normKernelFunctor_map_ι_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normKernelFunctor_map_ι_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) {Z : ModuleCat R} (h : CategoryTheory.Arrow.leftFunc.obj (normArrowFunctor.obj N) ⟶ Z) : CategoryTheory.CategoryStruct.comp (normKernelFunctor.map f) (CategoryTheory.CategoryStruct.comp ((CategoryTheory.Limits.ker.ι (ModuleCat R)).app (normArrowFunctor.obj N)) h) = CategoryTheory.CategoryStruct.comp ((CategoryTheory.Limits.ker.ι (ModuleCat R)).app (normArrowFunctor.obj M)) (CategoryTheory.CategoryStruct.comp ((Rep.coinvariantsFunctor R G).map f) h)
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `normKernelFunctor_map_ι`. The norm-kernel functor's coefficient map commutes with its kernel inclusion.

[Source](../FiniteGroupTateCohomology/Basic.lean#L179) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normCokernelFunctor_π_map

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normCokernelFunctor_π_map {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) : CategoryTheory.CategoryStruct.comp ((CategoryTheory.Limits.coker.π (ModuleCat R)).app (normArrowFunctor.obj M)) (normCokernelFunctor.map f) = CategoryTheory.CategoryStruct.comp ((Rep.invariantsFunctor R G).map f) ((CategoryTheory.Limits.coker.π (ModuleCat R)).app (normArrowFunctor.obj N))
```

**Original catalogue explanation (not a Lean docstring):** The norm-cokernel functor's coefficient map commutes with its cokernel projection.

[Source](../FiniteGroupTateCohomology/Basic.lean#L198) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normCokernelFunctor_π_map_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normCokernelFunctor_π_map_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) {Z : ModuleCat R} (h : normCokernelFunctor.obj N ⟶ Z) : CategoryTheory.CategoryStruct.comp ((CategoryTheory.Limits.coker.π (ModuleCat R)).app (normArrowFunctor.obj M)) (CategoryTheory.CategoryStruct.comp (normCokernelFunctor.map f) h) = CategoryTheory.CategoryStruct.comp ((Rep.invariantsFunctor R G).map f) (CategoryTheory.CategoryStruct.comp ((CategoryTheory.Limits.coker.π (ModuleCat R)).app (normArrowFunctor.obj N)) h)
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `normCokernelFunctor_π_map`. The norm-cokernel functor's coefficient map commutes with its cokernel projection.

[Source](../FiniteGroupTateCohomology/Basic.lean#L198) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateNormFromCoinvariants

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.tateNormFromCoinvariants {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : (Rep.coinvariantsFunctor R G).obj M ⟶ (Rep.invariantsFunctor R G).obj M
```

**Native source docstring:** The norm map appearing in the homology sequence of the Tate complex,
expressed between the concrete coinvariants and invariants.

[Source](../FiniteGroupTateCohomology/Basic.lean#L216) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateNormFromCoinvariants_eq

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateNormFromCoinvariants_eq {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : tateNormFromCoinvariants M = normFromCoinvariants M
```

**Original catalogue explanation (not a Lean docstring):** Identifies the norm in the exceptional Tate homology sequence with the ordinary coinvariants-to-invariants norm.

[Source](../FiniteGroupTateCohomology/Basic.lean#L225) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normSequence

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.normSequence {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.ComposableArrows (ModuleCat R) 3
```

**Native source docstring:** The four-term norm sequence in exceptional Tate degrees.

[Source](../FiniteGroupTateCohomology/Basic.lean#L233) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normSequence_first_naturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normSequence_first_naturality {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) : CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyMap (tateComplex.map f) (-1)) (CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyι (tateComplex N) (-1)) (tateOpcyclesIsoNegOne N).hom) = CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyι (tateComplex M) (-1)) (tateOpcyclesIsoNegOne M).hom) ((Rep.coinvariantsFunctor R G).map f)
```

**Original catalogue explanation (not a Lean docstring):** The first map of the four-term norm sequence commutes with coefficient morphisms.

[Source](../FiniteGroupTateCohomology/Basic.lean#L242) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normSequence_first_naturality_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normSequence_first_naturality_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) {Z : ModuleCat R} (h : (Rep.coinvariantsFunctor R G).obj N ⟶ Z) : CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyMap (tateComplex.map f) (-1)) (CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyι (tateComplex N) (-1)) (CategoryTheory.CategoryStruct.comp (tateOpcyclesIsoNegOne N).hom h)) = CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyι (tateComplex M) (-1)) (CategoryTheory.CategoryStruct.comp (tateOpcyclesIsoNegOne M).hom (CategoryTheory.CategoryStruct.comp ((Rep.coinvariantsFunctor R G).map f) h))
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `normSequence_first_naturality`. The first map of the four-term norm sequence commutes with coefficient morphisms.

[Source](../FiniteGroupTateCohomology/Basic.lean#L242) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normSequence_last_naturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normSequence_last_naturality {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) : CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero M).inv (HomologicalComplex.homologyπ (tateComplex M) 0)) (HomologicalComplex.homologyMap (tateComplex.map f) 0) = CategoryTheory.CategoryStruct.comp ((Rep.invariantsFunctor R G).map f) (CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero N).inv (HomologicalComplex.homologyπ (tateComplex N) 0))
```

**Original catalogue explanation (not a Lean docstring):** The last map of the four-term norm sequence commutes with coefficient morphisms.

[Source](../FiniteGroupTateCohomology/Basic.lean#L253) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normSequence_last_naturality_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normSequence_last_naturality_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] {M N : Rep R G} (f : M ⟶ N) {Z : ModuleCat R} (h : HomologicalComplex.homology (tateComplex N) 0 ⟶ Z) : CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero M).inv (CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyπ (tateComplex M) 0) (CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyMap (tateComplex.map f) 0) h)) = CategoryTheory.CategoryStruct.comp ((Rep.invariantsFunctor R G).map f) (CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero N).inv (CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyπ (tateComplex N) 0) h))
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `normSequence_last_naturality`. The last map of the four-term norm sequence commutes with coefficient morphisms.

[Source](../FiniteGroupTateCohomology/Basic.lean#L253) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.homologySequenceIsoNormSequence

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.homologySequenceIsoNormSequence {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : HomologicalComplex.HomologySequence.composableArrows₃ (tateComplex M) (-1) 0 ≅ normSequence M
```

**Native source docstring:** The concrete norm sequence is isomorphic to the canonical homology sequence
of the Tate complex.

[Source](../FiniteGroupTateCohomology/Basic.lean#L263) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normSequence_exact

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.normSequence_exact {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : (normSequence M).Exact
```

**Native source docstring:** The four-term norm sequence is exact.

[Source](../FiniteGroupTateCohomology/Basic.lean#L284) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normSequence_mono_first

Kind: `instance`.

```lean
instance FiniteGroupTateCohomology.normSequence_mono_first {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.Mono ((normSequence M).map' 0 1 normSequence_mono_first._proof_1 normSequence_mono_first._proof_3)
```

**Original catalogue explanation (not a Lean docstring):** The injection from Tate degree minus one into coinvariants is a category-theoretic monomorphism.

[Source](../FiniteGroupTateCohomology/Basic.lean#L291) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.normSequence_epi_last

Kind: `instance`.

```lean
instance FiniteGroupTateCohomology.normSequence_epi_last {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.Epi ((normSequence M).map' 2 3 normSequence_epi_last._proof_2 normSequence_epi_last._proof_3)
```

**Original catalogue explanation (not a Lean docstring):** The projection from invariants onto Tate degree zero is a category-theoretic epimorphism.

[Source](../FiniteGroupTateCohomology/Basic.lean#L296) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCohomologyNegOneIsoKernelNorm

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.tateCohomologyNegOneIsoKernelNorm {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : tateCohomology M (-1) ≅ CategoryTheory.Limits.kernel (normFromCoinvariants M)
```

**Native source docstring:** Degree `-1` Tate cohomology is the kernel of the norm from coinvariants to
invariants.

[Source](../FiniteGroupTateCohomology/Basic.lean#L300) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCohomologyZeroIsoCokernelNorm

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.tateCohomologyZeroIsoCokernelNorm {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : tateCohomology M 0 ≅ CategoryTheory.Limits.cokernel (normFromCoinvariants M)
```

**Native source docstring:** Degree `0` Tate cohomology is the cokernel of the norm from coinvariants to
invariants.

[Source](../FiniteGroupTateCohomology/Basic.lean#L307) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCohomologyNegOneIsoKernelNorm_hom_ι

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCohomologyNegOneIsoKernelNorm_hom_ι {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.CategoryStruct.comp (tateCohomologyNegOneIsoKernelNorm M).hom (CategoryTheory.Limits.kernel.ι (normFromCoinvariants M)) = CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyι (tateComplex M) (-1)) (tateOpcyclesIsoNegOne M).hom
```

**Original catalogue explanation (not a Lean docstring):** The negative-one kernel comparison commutes with the norm-kernel inclusion.

[Source](../FiniteGroupTateCohomology/Basic.lean#L314) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCohomologyNegOneIsoKernelNorm_hom_ι_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCohomologyNegOneIsoKernelNorm_hom_ι_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) {Z : ModuleCat R} (h : (Rep.coinvariantsFunctor R G).obj M ⟶ Z) : CategoryTheory.CategoryStruct.comp (tateCohomologyNegOneIsoKernelNorm M).hom (CategoryTheory.CategoryStruct.comp (CategoryTheory.Limits.kernel.ι (normFromCoinvariants M)) h) = CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyι (tateComplex M) (-1)) (tateOpcyclesIsoNegOne M).hom) h
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `tateCohomologyNegOneIsoKernelNorm_hom_ι`. The negative-one kernel comparison commutes with the norm-kernel inclusion.

[Source](../FiniteGroupTateCohomology/Basic.lean#L314) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCohomologyZeroIsoCokernelNorm_π_hom

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCohomologyZeroIsoCokernelNorm_π_hom {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero M).inv (HomologicalComplex.homologyπ (tateComplex M) 0)) (tateCohomologyZeroIsoCokernelNorm M).hom = CategoryTheory.Limits.cokernel.π (normFromCoinvariants M)
```

**Original catalogue explanation (not a Lean docstring):** The degree-zero cokernel comparison commutes with the norm-cokernel projection.

[Source](../FiniteGroupTateCohomology/Basic.lean#L323) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCohomologyZeroIsoCokernelNorm_π_hom_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCohomologyZeroIsoCokernelNorm_π_hom_assoc {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) {Z : ModuleCat R} (h : CategoryTheory.Limits.cokernel (normFromCoinvariants M) ⟶ Z) : CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (tateCyclesIsoZero M).inv (HomologicalComplex.homologyπ (tateComplex M) 0)) (tateCohomologyZeroIsoCokernelNorm M).hom) h = CategoryTheory.CategoryStruct.comp (CategoryTheory.Limits.cokernel.π (normFromCoinvariants M)) h
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `tateCohomologyZeroIsoCokernelNorm_π_hom`. The degree-zero cokernel comparison commutes with the norm-cokernel projection.

[Source](../FiniteGroupTateCohomology/Basic.lean#L323) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm {R G : Type u} [CommRing R] [Group G] [Fintype G] : tateCohomologyFunctor (-1) ≅ normKernelFunctor
```

**Native source docstring:** Degree `-1` Tate cohomology is naturally isomorphic to the kernel of the
norm from coinvariants to invariants.

[Source](../FiniteGroupTateCohomology/Basic.lean#L350) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm {R G : Type u} [CommRing R] [Group G] [Fintype G] : tateCohomologyFunctor 0 ≅ normCokernelFunctor
```

**Native source docstring:** Degree `0` Tate cohomology is naturally isomorphic to the cokernel of the
norm from coinvariants to invariants.

[Source](../FiniteGroupTateCohomology/Basic.lean#L405) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm_hom_app

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm_hom_app {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : tateCohomologyNegOneNatIsoKernelNorm.hom.app M = (tateCohomologyNegOneIsoKernelNorm M).hom
```

**Native source docstring:** The degree `-1` natural isomorphism has the kernel comparison as its component.

[Source](../FiniteGroupTateCohomology/Basic.lean#L451) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm_hom_app

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm_hom_app {R G : Type u} [CommRing R] [Group G] [Fintype G] (M : Rep R G) : tateCohomologyZeroNatIsoCokernelNorm.hom.app M = (tateCohomologyZeroIsoCokernelNorm M).hom
```

**Native source docstring:** The degree `0` natural isomorphism has the cokernel comparison as its component.

[Source](../FiniteGroupTateCohomology/Basic.lean#L457) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.normHomCompSubMap

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.normHomCompSubMap {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] {A B : Rep R G} (g : G) (f : A ⟶ B) : Rep.FiniteCyclicGroup.normHomCompSub A g ⟶ Rep.FiniteCyclicGroup.normHomCompSub B g
```

**Native source docstring:** The canonical morphism between the short complexes
`A --N--> A --(g - 1)--> A` induced by a representation morphism.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L61) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.subCompNormHomMap

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.subCompNormHomMap {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] {A B : Rep R G} (g : G) (f : A ⟶ B) : Rep.FiniteCyclicGroup.subCompNormHom A g ⟶ Rep.FiniteCyclicGroup.subCompNormHom B g
```

**Native source docstring:** The canonical morphism between the short complexes
`A --(g - 1)--> A --N--> A` induced by a representation morphism.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L73) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.normHomCompSubMap_id

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.normHomCompSubMap_id {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) : normHomCompSubMap g (CategoryTheory.CategoryStruct.id A) = CategoryTheory.CategoryStruct.id (Rep.FiniteCyclicGroup.normHomCompSub A g)
```

**Original catalogue explanation (not a Lean docstring):** Identity coefficient maps induce the identity morphism of the norm-then-(g−1) short complexes.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L85) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.normHomCompSubMap_comp

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.normHomCompSubMap_comp {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] {A B C : Rep R G} (g : G) (f : A ⟶ B) (h : B ⟶ C) : normHomCompSubMap g (CategoryTheory.CategoryStruct.comp f h) = CategoryTheory.CategoryStruct.comp (normHomCompSubMap g f) (normHomCompSubMap g h)
```

**Original catalogue explanation (not a Lean docstring):** The norm-then-(g−1) short-complex map respects composition of coefficient maps.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L90) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.subCompNormHomMap_id

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.subCompNormHomMap_id {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) : subCompNormHomMap g (CategoryTheory.CategoryStruct.id A) = CategoryTheory.CategoryStruct.id (Rep.FiniteCyclicGroup.subCompNormHom A g)
```

**Original catalogue explanation (not a Lean docstring):** Identity coefficient maps induce the identity morphism of the (g−1)-then-norm short complexes.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L96) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.subCompNormHomMap_comp

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.subCompNormHomMap_comp {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] {A B C : Rep R G} (g : G) (f : A ⟶ B) (h : B ⟶ C) : subCompNormHomMap g (CategoryTheory.CategoryStruct.comp f h) = CategoryTheory.CategoryStruct.comp (subCompNormHomMap g f) (subCompNormHomMap g h)
```

**Original catalogue explanation (not a Lean docstring):** The (g−1)-then-norm short-complex map respects composition of coefficient maps.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L101) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.normHomCompSubFunctor

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.normHomCompSubFunctor {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) : CategoryTheory.Functor (Rep R G) (CategoryTheory.ShortComplex (ModuleCat R))
```

**Native source docstring:** The fixed-`g` functor of short complexes
`A --N--> A --(g - 1)--> A`.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L107) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.subCompNormHomFunctor

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.subCompNormHomFunctor {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) : CategoryTheory.Functor (Rep R G) (CategoryTheory.ShortComplex (ModuleCat R))
```

**Native source docstring:** The fixed-`g` functor of short complexes
`A --(g - 1)--> A --N--> A`.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L117) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.evenModelFunctor

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.evenModelFunctor {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) : CategoryTheory.Functor (Rep R G) (ModuleCat R)
```

**Native source docstring:** The coefficient functor obtained as the homology of
`A --N--> A --(g - 1)--> A`.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L127) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.oddModelFunctor

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.oddModelFunctor {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) : CategoryTheory.Functor (Rep R G) (ModuleCat R)
```

**Native source docstring:** The coefficient functor obtained as the homology of
`A --(g - 1)--> A --N--> A`.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L133) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.evenModelFunctor_obj

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.evenModelFunctor_obj {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) (A : Rep R G) : (evenModelFunctor g).obj A = (Rep.FiniteCyclicGroup.normHomCompSub A g).homology
```

**Original catalogue explanation (not a Lean docstring):** Evaluating the even-model coefficient functor returns the homology of the norm-then-(g−1) short complex.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L139) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.evenModelFunctor_map

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.evenModelFunctor_map {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) {A B : Rep R G} (f : A ⟶ B) : (evenModelFunctor g).map f = CategoryTheory.ShortComplex.homologyMap (normHomCompSubMap g f)
```

**Original catalogue explanation (not a Lean docstring):** The even-model coefficient functor maps a morphism by its induced short-complex homology map.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L145) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.oddModelFunctor_obj

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.oddModelFunctor_obj {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) (A : Rep R G) : (oddModelFunctor g).obj A = (Rep.FiniteCyclicGroup.subCompNormHom A g).homology
```

**Original catalogue explanation (not a Lean docstring):** Evaluating the odd-model coefficient functor returns the homology of the (g−1)-then-norm short complex.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L150) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.oddModelFunctor_map

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.oddModelFunctor_map {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) {A B : Rep R G} (f : A ⟶ B) : (oddModelFunctor g).map f = CategoryTheory.ShortComplex.homologyMap (subCompNormHomMap g f)
```

**Original catalogue explanation (not a Lean docstring):** The odd-model coefficient functor maps a morphism by its induced short-complex homology map.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L156) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.evenModelMap

Kind: `def`.

```lean
noncomputable abbrev FiniteGroupTateCohomology.Cyclic.evenModelMap {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] {A B : Rep R G} (g : G) (f : A ⟶ B) : (Rep.FiniteCyclicGroup.normHomCompSub A g).homology ⟶ (Rep.FiniteCyclicGroup.normHomCompSub B g).homology
```

**Native source docstring:** The canonical map on the even alternating model induced by a
representation morphism.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L161) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.oddModelMap

Kind: `def`.

```lean
noncomputable abbrev FiniteGroupTateCohomology.Cyclic.oddModelMap {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] {A B : Rep R G} (g : G) (f : A ⟶ B) : (Rep.FiniteCyclicGroup.subCompNormHom A g).homology ⟶ (Rep.FiniteCyclicGroup.subCompNormHom B g).homology
```

**Native source docstring:** The canonical map on the odd alternating model induced by a
representation morphism.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L168) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.evenModelMap_id

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.evenModelMap_id {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) : evenModelMap g (CategoryTheory.CategoryStruct.id A) = CategoryTheory.CategoryStruct.id (Rep.FiniteCyclicGroup.normHomCompSub A g).homology
```

**Original catalogue explanation (not a Lean docstring):** Identity coefficients induce the identity on even-model homology.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L175) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.evenModelMap_comp

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.evenModelMap_comp {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] {A B C : Rep R G} (g : G) (f : A ⟶ B) (h : B ⟶ C) : evenModelMap g (CategoryTheory.CategoryStruct.comp f h) = CategoryTheory.CategoryStruct.comp (evenModelMap g f) (evenModelMap g h)
```

**Original catalogue explanation (not a Lean docstring):** Even-model homology maps preserve composition of arbitrary coefficient morphisms.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L179) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.oddModelMap_id

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.oddModelMap_id {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) : oddModelMap g (CategoryTheory.CategoryStruct.id A) = CategoryTheory.CategoryStruct.id (Rep.FiniteCyclicGroup.subCompNormHom A g).homology
```

**Original catalogue explanation (not a Lean docstring):** Identity coefficients induce the identity on odd-model homology.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L184) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.oddModelMap_comp

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.oddModelMap_comp {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] {A B C : Rep R G} (g : G) (f : A ⟶ B) (h : B ⟶ C) : oddModelMap g (CategoryTheory.CategoryStruct.comp f h) = CategoryTheory.CategoryStruct.comp (oddModelMap g f) (oddModelMap g h)
```

**Original catalogue explanation (not a Lean docstring):** Odd-model homology maps preserve composition of arbitrary coefficient morphisms.

[Source](../FiniteGroupTateCohomology/CyclicModelFunctor.lean#L188) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.evenModel

Kind: `def`.

```lean
noncomputable abbrev FiniteGroupTateCohomology.Cyclic.evenModel {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) : ModuleCat R
```

**Native source docstring:** The alternating short-complex homology used in even Tate degrees:
`A --N--> A --(g - 1)--> A`.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L47) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.oddModel

Kind: `def`.

```lean
noncomputable abbrev FiniteGroupTateCohomology.Cyclic.oddModel {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) : ModuleCat R
```

**Native source docstring:** The alternating short-complex homology used in odd Tate degrees:
`A --(g - 1)--> A --N--> A`.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L52) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.generatorSub

Kind: `def`.

```lean
noncomputable abbrev FiniteGroupTateCohomology.Cyclic.generatorSub {R G : Type u} [CommRing R] [CommGroup G] (A : Rep R G) (g : G) : ↧↑A ⟶ ↧↑A
```

**Native source docstring:** The endomorphism `g - 1` of the underlying coefficient module.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L57) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.invariantsIsoKernelGeneratorSub

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.invariantsIsoKernelGeneratorSub {R G : Type u} [CommRing R] [CommGroup G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) : (Rep.invariantsFunctor R G).obj A ≅ CategoryTheory.Limits.kernel (generatorSub A g)
```

**Native source docstring:** For a chosen generator, the invariant submodule is the kernel of `g - 1`.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L61) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.cokernelGeneratorSubIsoCoinvariants

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.cokernelGeneratorSubIsoCoinvariants {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) : CategoryTheory.Limits.cokernel (generatorSub A g) ≅ (Rep.coinvariantsFunctor R G).obj A
```

**Native source docstring:** For a chosen generator, the cokernel of `g - 1` is the coinvariant module.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L78) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.invariantsIsoKernelGeneratorSub_hom_ι

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.invariantsIsoKernelGeneratorSub_hom_ι {R G : Type u} [CommRing R] [CommGroup G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) : CategoryTheory.CategoryStruct.comp (invariantsIsoKernelGeneratorSub A g hg).hom (CategoryTheory.Limits.kernel.ι (generatorSub A g)) = ModuleCat.ofHom A.ρ.invariants.subtype
```

**Original catalogue explanation (not a Lean docstring):** The generator-based invariants/kernel comparison commutes with the kernel inclusion.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L84) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.invariantsIsoKernelGeneratorSub_hom_ι_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.invariantsIsoKernelGeneratorSub_hom_ι_assoc {R G : Type u} [CommRing R] [CommGroup G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) {Z : ModuleCat R} (h : ↧↑A ⟶ Z) : CategoryTheory.CategoryStruct.comp (invariantsIsoKernelGeneratorSub A g hg).hom (CategoryTheory.CategoryStruct.comp (CategoryTheory.Limits.kernel.ι (generatorSub A g)) h) = CategoryTheory.CategoryStruct.comp (ModuleCat.ofHom A.ρ.invariants.subtype) h
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `invariantsIsoKernelGeneratorSub_hom_ι`. The generator-based invariants/kernel comparison commutes with the kernel inclusion.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L84) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.cokernel_π_cokernelGeneratorSubIsoCoinvariants_hom

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.cokernel_π_cokernelGeneratorSubIsoCoinvariants_hom {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) : CategoryTheory.CategoryStruct.comp (CategoryTheory.Limits.cokernel.π (generatorSub A g)) (cokernelGeneratorSubIsoCoinvariants A g hg).hom = (Rep.coinvariantsMk R G).app A
```

**Original catalogue explanation (not a Lean docstring):** The generator-based cokernel/coinvariants comparison commutes with the cokernel projection.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L94) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.cokernel_π_cokernelGeneratorSubIsoCoinvariants_hom_assoc

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.cokernel_π_cokernelGeneratorSubIsoCoinvariants_hom_assoc {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) {Z : ModuleCat R} (h : (Rep.coinvariantsFunctor R G).obj A ⟶ Z) : CategoryTheory.CategoryStruct.comp (CategoryTheory.Limits.cokernel.π (generatorSub A g)) (CategoryTheory.CategoryStruct.comp (cokernelGeneratorSubIsoCoinvariants A g hg).hom h) = CategoryTheory.CategoryStruct.comp ((Rep.coinvariantsMk R G).app A) h
```

**Original catalogue explanation (not a Lean docstring):** Generated `@[reassoc]` association variant of `cokernel_π_cokernelGeneratorSubIsoCoinvariants_hom`. The generator-based cokernel/coinvariants comparison commutes with the cokernel projection.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L94) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.evenModelIsoCokernelNorm

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.evenModelIsoCokernelNorm {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) : evenModel A g ≅ CategoryTheory.Limits.cokernel (normFromCoinvariants A)
```

**Native source docstring:** The even alternating model is canonically the cokernel of the norm from
coinvariants to invariants.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L135) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.oddModelIsoKernelNorm

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.oddModelIsoKernelNorm {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) : oddModel A g ≅ CategoryTheory.Limits.kernel (normFromCoinvariants A)
```

**Native source docstring:** The odd alternating model is canonically the kernel of the norm from
coinvariants to invariants.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L146) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoEven

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoEven {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) (n : ℤ) (hn : Even n) : tateCohomology A n ≅ evenModel A g
```

**Native source docstring:** Tate cohomology in every even integer degree, compared coherently with
`A --N--> A --(g - 1)--> A`.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L197) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoOdd

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoOdd {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) (n : ℤ) (hn : Odd n) : tateCohomology A n ≅ oddModel A g
```

**Native source docstring:** Tate cohomology in every odd integer degree, compared coherently with
`A --(g - 1)--> A --N--> A`.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L222) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoEven_zero

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoEven_zero {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) : tateCohomologyIsoEven A g hg 0 tateCohomologyIsoEven_zero._proof_1 = tateCohomologyZeroIsoCokernelNorm A ≪≫ (evenModelIsoCokernelNorm A g hg).symm
```

**Native source docstring:** At degree `0`, the even comparison is exactly the accepted cokernel-of-norm
comparison followed by the inverse model identification.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L246) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoOdd_negOne

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoOdd_negOne {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) : tateCohomologyIsoOdd A g hg (-1) tateCohomologyIsoOdd_negOne._proof_1 = tateCohomologyNegOneIsoKernelNorm A ≪≫ (oddModelIsoKernelNorm A g hg).symm
```

**Native source docstring:** At degree `-1`, the odd comparison is exactly the accepted kernel-of-norm
comparison followed by the inverse model identification.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L254) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.tateCohomologyParityIso

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.tateCohomologyParityIso {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) (n m : ℤ) (h : Even n ↔ Even m) : tateCohomology A n ≅ tateCohomology A m
```

**Native source docstring:** The normalized isomorphism between any two Tate degrees of the same parity.
It is defined by mapping both degrees to their common alternating model.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L262) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.tateCohomologyParityIso_self

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.tateCohomologyParityIso_self {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) (n : ℤ) : tateCohomologyParityIso A g hg n n ⋯ = CategoryTheory.Iso.refl (tateCohomology A n)
```

**Native source docstring:** The normalized same-parity isomorphism at one degree is the identity.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L274) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.tateCohomologyParityIso_symm

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.tateCohomologyParityIso_symm {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) (n m : ℤ) (h : Even n ↔ Even m) : (tateCohomologyParityIso A g hg n m h).symm = tateCohomologyParityIso A g hg m n ⋯
```

**Native source docstring:** Normalized same-parity comparisons invert by reversing their endpoints.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L280) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.tateCohomologyParityIso_trans

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.tateCohomologyParityIso_trans {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) (n m l : ℤ) (hnm : Even n ↔ Even m) (hml : Even m ↔ Even l) : tateCohomologyParityIso A g hg n m hnm ≪≫ tateCohomologyParityIso A g hg m l hml = tateCohomologyParityIso A g hg n l ⋯
```

**Native source docstring:** Normalized same-parity comparisons telescope through an intermediate
degree.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L290) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) (n : ℤ) : tateCohomology A n ≅ tateCohomology A (n + 2)
```

**Native source docstring:** Additive period-two Tate cohomology for a finite cyclic group with chosen
generator.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L305) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity_trans

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity_trans {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (A : Rep R G) (g : G) (hg : ∀ (x : G), x ∈ Subgroup.zpowers g) (n : ℤ) : tateCohomologyPeriodicity A g hg n ≪≫ tateCohomologyPeriodicity A g hg (n + 2) = tateCohomologyParityIso A g hg n (n + 2 + 2) ⋯
```

**Native source docstring:** Two consecutive period-two shifts are the normalized same-parity
comparison across four degrees; the intermediate model cancels.

[Source](../FiniteGroupTateCohomology/CyclicPeriodicity.lean#L311) (native source start line; generated association laws point to their source lemma).

## Checked-use clients (63 native named entries)

### FiniteGroupTateCohomologyTests.normIndependentUniverses

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.normIndependentUniverses {R : Type u} {H : Type v} [CommRing R] [Group H] (A : Rep R H) [Fintype H] : (Rep.coinvariantsFunctor R H).obj A ⟶ (Rep.invariantsFunctor R H).obj A
```

**Native source docstring:** The ordinary norm also keeps scalar, group and carrier universes independent.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L31) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.norm_transformation_component

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.norm_transformation_component {R : Type u} {H : Type v} [CommRing R] [Group H] [Fintype H] (A : Rep R H) : FiniteGroupTateCohomology.normNatTrans.app A = FiniteGroupTateCohomology.normFromCoinvariants A
```

**Native source docstring:** The ordinary natural transformation has the advertised component with
independent scalar, group and carrier universes.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L36) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.norm_independentNaturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.norm_independentNaturality {R : Type u} {H : Type v} [CommRing R] [Group H] [Fintype H] {A B : Rep R H} (f : A ⟶ B) : CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.normFromCoinvariants A) ((Rep.invariantsFunctor R H).map f) = CategoryTheory.CategoryStruct.comp ((Rep.coinvariantsFunctor R H).map f) (FiniteGroupTateCohomology.normFromCoinvariants B)
```

**Native source docstring:** The ordinary norm commutes with independent-universe coefficient maps.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L43) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.quotientNormClient

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.quotientNormClient {R : Type u} {H : Type v} [CommRing R] [Group H] (S : Subgroup H) [S.Normal] [Fintype ↥S] (A : Rep R H) : A.quotientToCoinvariants S ⟶ A.quotientToInvariants S
```

**Native source docstring:** The residual norm is usable for an arbitrary ambient group and an
independent-universe coefficient representation.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L51) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.quotientNorm_representative

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.quotientNorm_representative {R : Type u} {H : Type v} [CommRing R] [Group H] (S : Subgroup H) [S.Normal] [Fintype ↥S] (A : Rep R H) (x : ↑A) : (CategoryTheory.ConcreteCategory.hom (FiniteGroupTateCohomology.quotientNorm A S)) ((Representation.Coinvariants.mk (MonoidHom.comp A.ρ S.subtype)) x) = ⟨(Representation.norm (MonoidHom.comp A.ρ S.subtype)) x, ⋯⟩
```

**Native source docstring:** The residual norm has its public representative computation.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L57) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.quotientNorm_coefficients

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.quotientNorm_coefficients {R : Type u} {H : Type v} [CommRing R] [Group H] (S : Subgroup H) [S.Normal] [Fintype ↥S] (A B : Rep R H) (f : A ⟶ B) : CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.quotientNorm A S) ((Rep.quotientToInvariantsFunctor R S).map f) = CategoryTheory.CategoryStruct.comp ((Rep.quotientToCoinvariantsFunctor R S).map f) (FiniteGroupTateCohomology.quotientNorm B S)
```

**Native source docstring:** Changing coefficients commutes with the norm for a normal subgroup.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L65) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.quotientNormNaturalTransformation

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.quotientNormNaturalTransformation {R : Type u} {H : Type v} [CommRing R] [Group H] (S : Subgroup H) [S.Normal] [Fintype ↥S] : Rep.quotientToCoinvariantsFunctor R S ⟶ Rep.quotientToInvariantsFunctor R S
```

**Native source docstring:** The residual norm is a natural transformation, not merely an objectwise map.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L73) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.quotientNorm_transformation_component

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.quotientNorm_transformation_component {R : Type u} {H : Type v} [CommRing R] [Group H] (S : Subgroup H) [S.Normal] [Fintype ↥S] (A : Rep R H) : (FiniteGroupTateCohomology.quotientNormNatTrans S).app A = FiniteGroupTateCohomology.quotientNorm A S
```

**Native source docstring:** The residual natural transformation has the quotient norm component,
without requiring the ambient group to be finite.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L79) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.quotientNorm_transformation_representative

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.quotientNorm_transformation_representative {R : Type u} {H : Type v} [CommRing R] [Group H] (S : Subgroup H) [S.Normal] [Fintype ↥S] (A : Rep R H) (x : ↑A) : (CategoryTheory.ConcreteCategory.hom ((FiniteGroupTateCohomology.quotientNormNatTrans S).app A)) ((Representation.Coinvariants.mk (MonoidHom.comp A.ρ S.subtype)) x) = ⟨(Representation.norm (MonoidHom.comp A.ρ S.subtype)) x, ⋯⟩
```

**Native source docstring:** The natural transformation computes on a coinvariant representative.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L86) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.quotientNorm_transformation_coefficients

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.quotientNorm_transformation_coefficients {R : Type u} {H : Type v} [CommRing R] [Group H] (S : Subgroup H) [S.Normal] [Fintype ↥S] {A B : Rep R H} (f : A ⟶ B) : CategoryTheory.CategoryStruct.comp ((FiniteGroupTateCohomology.quotientNormNatTrans S).app A) ((Rep.quotientToInvariantsFunctor R S).map f) = CategoryTheory.CategoryStruct.comp ((Rep.quotientToCoinvariantsFunctor R S).map f) ((FiniteGroupTateCohomology.quotientNormNatTrans S).app B)
```

**Native source docstring:** The residual naturality square reduces to the maps' naturality square.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L95) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.quotientNorm_whiskered_component

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.quotientNorm_whiskered_component {R : Type u} {H : Type v} [CommRing R] [Group H] (S : Subgroup H) [S.Normal] (T : Subgroup (H ⧸ S)) [T.Normal] [Fintype ↥T] (F : CategoryTheory.Functor (Rep R ((H ⧸ S) ⧸ T)) (ModuleCat R)) (A : Rep R H) : (CategoryTheory.Functor.whiskerRight ((Rep.quotientToInvariantsFunctor R S).whiskerLeft (FiniteGroupTateCohomology.quotientNormNatTrans T)) F).app A = F.map (FiniteGroupTateCohomology.quotientNorm (A.quotientToInvariants S) T)
```

**Native source docstring:** Both whiskerings expose the residual norm as the map supplied to the
postcomposed functor, as in finite-level deflation.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L105) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.negativeOneKernel

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.negativeOneKernel {R G : Type u} [CommRing R] [Group G] [Fintype G] (A : Rep R G) : tateCohomology A (-1) ≅ CategoryTheory.Limits.kernel (FiniteGroupTateCohomology.normFromCoinvariants A)
```

**Native source docstring:** Tate degree minus one is the kernel of the norm.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L126) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.zeroCokernel

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.zeroCokernel {R G : Type u} [CommRing R] [Group G] [Fintype G] (A : Rep R G) : tateCohomology A 0 ≅ CategoryTheory.Limits.cokernel (FiniteGroupTateCohomology.normFromCoinvariants A)
```

**Native source docstring:** Degree zero is the cokernel of the norm.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L131) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.fourTerm_exact

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.fourTerm_exact {R G : Type u} [CommRing R] [Group G] [Fintype G] (A : Rep R G) : (FiniteGroupTateCohomology.normSequence A).Exact
```

**Native source docstring:** The four-term norm sequence is exact at its two middle terms.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L136) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.fourTerm_middle

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.fourTerm_middle {R G : Type u} [CommRing R] [Group G] [Fintype G] (A : Rep R G) : (FiniteGroupTateCohomology.normSequence A).map' 1 2 fourTerm_middle._proof_2 fourTerm_middle._proof_4 = FiniteGroupTateCohomology.normFromCoinvariants A
```

**Native source docstring:** The middle arrow is definitionally the norm, not an unrelated connecting map.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L141) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.fourTerm_first_mono

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.fourTerm_first_mono {R G : Type u} [CommRing R] [Group G] [Fintype G] (A : Rep R G) : CategoryTheory.Mono ((FiniteGroupTateCohomology.normSequence A).map' 0 1 fourTerm_first_mono._proof_1 fourTerm_first_mono._proof_3)
```

**Native source docstring:** The first map of the four-term norm sequence is a monomorphism.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L147) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.fourTerm_last_epi

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.fourTerm_last_epi {R G : Type u} [CommRing R] [Group G] [Fintype G] (A : Rep R G) : CategoryTheory.Epi ((FiniteGroupTateCohomology.normSequence A).map' 2 3 fourTerm_middle._proof_4 fourTerm_last_epi._proof_1)
```

**Native source docstring:** The last map of the four-term norm sequence is an epimorphism.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L152) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.fourTerm_first_naturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.fourTerm_first_naturality {R G : Type u} [CommRing R] [Group G] [Fintype G] {A B : Rep R G} (f : A ⟶ B) : CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyMap (tateComplex.map f) (-1)) (CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyι (tateComplex B) (-1)) (FiniteGroupTateCohomology.tateOpcyclesIsoNegOne B).hom) = CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyι (tateComplex A) (-1)) (FiniteGroupTateCohomology.tateOpcyclesIsoNegOne A).hom) ((Rep.coinvariantsFunctor R G).map f)
```

**Native source docstring:** The first endpoint commutes with coefficient maps.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L157) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.fourTerm_last_naturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.fourTerm_last_naturality {R G : Type u} [CommRing R] [Group G] [Fintype G] {A B : Rep R G} (f : A ⟶ B) : CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.tateCyclesIsoZero A).inv (HomologicalComplex.homologyπ (tateComplex A) 0)) (HomologicalComplex.homologyMap (tateComplex.map f) 0) = CategoryTheory.CategoryStruct.comp ((Rep.invariantsFunctor R G).map f) (CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.tateCyclesIsoZero B).inv (HomologicalComplex.homologyπ (tateComplex B) 0))
```

**Native source docstring:** The last endpoint commutes with coefficient maps.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L167) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.negativeOne_naturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.negativeOne_naturality {R G : Type u} [CommRing R] [Group G] [Fintype G] (A B : Rep R G) (f : A ⟶ B) : CategoryTheory.CategoryStruct.comp ((tateCohomologyFunctor (-1)).map f) (FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm.hom.app B) = CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm.hom.app A) (FiniteGroupTateCohomology.normKernelFunctor.map f)
```

**Native source docstring:** The kernel comparison is natural in the coefficient representation.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L177) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.zero_naturality

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.zero_naturality {R G : Type u} [CommRing R] [Group G] [Fintype G] (A B : Rep R G) (f : A ⟶ B) : CategoryTheory.CategoryStruct.comp ((tateCohomologyFunctor 0).map f) (FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm.hom.app B) = CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm.hom.app A) (FiniteGroupTateCohomology.normCokernelFunctor.map f)
```

**Native source docstring:** The cokernel comparison is natural in the coefficient representation.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L188) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.negativeOne_component

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.negativeOne_component {R G : Type u} [CommRing R] [Group G] [Fintype G] (A : Rep R G) : FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm.hom.app A = (FiniteGroupTateCohomology.tateCohomologyNegOneIsoKernelNorm A).hom
```

**Native source docstring:** The negative-one natural component is the objectwise norm-kernel comparison.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L199) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.zero_component

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.zero_component {R G : Type u} [CommRing R] [Group G] [Fintype G] (A : Rep R G) : FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm.hom.app A = (FiniteGroupTateCohomology.tateCohomologyZeroIsoCokernelNorm A).hom
```

**Native source docstring:** The zero-degree natural component is the objectwise norm-cokernel comparison.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L206) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.negativeOne_component_kernelInclusion

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.negativeOne_component_kernelInclusion {R G : Type u} [CommRing R] [Group G] [Fintype G] (A : Rep R G) : CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm.hom.app A) (CategoryTheory.Limits.kernel.ι (FiniteGroupTateCohomology.normFromCoinvariants A)) = CategoryTheory.CategoryStruct.comp (HomologicalComplex.homologyι (tateComplex A) (-1)) (FiniteGroupTateCohomology.tateOpcyclesIsoNegOne A).hom
```

**Native source docstring:** The negative-one natural component commutes with the norm-kernel inclusion.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L214) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.zero_component_cokernelProjection

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.zero_component_cokernelProjection {R G : Type u} [CommRing R] [Group G] [Fintype G] (A : Rep R G) : CategoryTheory.CategoryStruct.comp (CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.tateCyclesIsoZero A).inv (HomologicalComplex.homologyπ (tateComplex A) 0)) (FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm.hom.app A) = CategoryTheory.Limits.cokernel.π (FiniteGroupTateCohomology.normFromCoinvariants A)
```

**Native source docstring:** The zero-degree natural component commutes with the norm-cokernel projection.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L225) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.evenShortComplex_fixedElement

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.evenShortComplex_fixedElement {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) (A : Rep R G) : (FiniteGroupTateCohomology.Cyclic.normHomCompSubFunctor g).obj A = Rep.FiniteCyclicGroup.normHomCompSub A g
```

**Native source docstring:** An arbitrary chosen element defines an even short-complex coefficient functor.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L243) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.oddModel_fixedElement

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.oddModel_fixedElement {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) (A : Rep R G) : (FiniteGroupTateCohomology.Cyclic.oddModelFunctor g).obj A = (Rep.FiniteCyclicGroup.subCompNormHom A g).homology
```

**Native source docstring:** The odd model reverses the two differentials, without a generator proof.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L249) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.evenShortComplex_first

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.evenShortComplex_first {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) {A B : Rep R G} (f : A ⟶ B) : (FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g f).τ₁ = Rep.Hom.toModuleCatHom f
```

**Native source docstring:** The first position of the even complex uses the underlying coefficient map.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L255) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.evenShortComplex_second

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.evenShortComplex_second {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) {A B : Rep R G} (f : A ⟶ B) : (FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g f).τ₂ = Rep.Hom.toModuleCatHom f
```

**Native source docstring:** The second position of the even complex uses the underlying coefficient map.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L260) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.evenShortComplex_third

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.evenShortComplex_third {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) {A B : Rep R G} (f : A ⟶ B) : (FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g f).τ₃ = Rep.Hom.toModuleCatHom f
```

**Native source docstring:** The third position of the even complex uses the underlying coefficient map.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L265) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.oddShortComplex_first

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.oddShortComplex_first {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) {A B : Rep R G} (f : A ⟶ B) : (FiniteGroupTateCohomology.Cyclic.subCompNormHomMap g f).τ₁ = Rep.Hom.toModuleCatHom f
```

**Native source docstring:** The first position of the odd complex uses the underlying coefficient map.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L270) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.oddShortComplex_second

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.oddShortComplex_second {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) {A B : Rep R G} (f : A ⟶ B) : (FiniteGroupTateCohomology.Cyclic.subCompNormHomMap g f).τ₂ = Rep.Hom.toModuleCatHom f
```

**Native source docstring:** The second position of the odd complex uses the underlying coefficient map.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L275) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.oddShortComplex_third

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.oddShortComplex_third {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) {A B : Rep R G} (f : A ⟶ B) : (FiniteGroupTateCohomology.Cyclic.subCompNormHomMap g f).τ₃ = Rep.Hom.toModuleCatHom f
```

**Native source docstring:** The third position of the odd complex uses the underlying coefficient map.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L280) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.evenShortComplex_id

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.evenShortComplex_id {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) (A : Rep R G) : FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g (CategoryTheory.CategoryStruct.id A) = CategoryTheory.CategoryStruct.id (Rep.FiniteCyclicGroup.normHomCompSub A g)
```

**Native source docstring:** Identity coefficients give identity maps of even short complexes.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L285) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.oddShortComplex_id

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.oddShortComplex_id {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) (A : Rep R G) : FiniteGroupTateCohomology.Cyclic.subCompNormHomMap g (CategoryTheory.CategoryStruct.id A) = CategoryTheory.CategoryStruct.id (Rep.FiniteCyclicGroup.subCompNormHom A g)
```

**Native source docstring:** Identity coefficients give identity maps of odd short complexes.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L290) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.evenModel_id

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.evenModel_id {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) (A : Rep R G) : FiniteGroupTateCohomology.Cyclic.evenModelMap g (CategoryTheory.CategoryStruct.id A) = CategoryTheory.CategoryStruct.id (Rep.FiniteCyclicGroup.normHomCompSub A g).homology
```

**Native source docstring:** Identity coefficients give the identity map on even model homology.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L295) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.oddModel_id

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.oddModel_id {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) (A : Rep R G) : FiniteGroupTateCohomology.Cyclic.oddModelMap g (CategoryTheory.CategoryStruct.id A) = CategoryTheory.CategoryStruct.id (Rep.FiniteCyclicGroup.subCompNormHom A g).homology
```

**Native source docstring:** Identity coefficients give the identity map on odd model homology.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L300) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.evenShortComplex_comp

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.evenShortComplex_comp {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) {A B C : Rep R G} (f : A ⟶ B) (h : B ⟶ C) : FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g (CategoryTheory.CategoryStruct.comp f h) = CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g f) (FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g h)
```

**Native source docstring:** Coefficient maps on the even short complexes respect composition.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L305) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.evenModel_comp

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.evenModel_comp {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) {A B C : Rep R G} (f : A ⟶ B) (h : B ⟶ C) : FiniteGroupTateCohomology.Cyclic.evenModelMap g (CategoryTheory.CategoryStruct.comp f h) = CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.Cyclic.evenModelMap g f) (FiniteGroupTateCohomology.Cyclic.evenModelMap g h)
```

**Native source docstring:** Homology maps of the even model respect arbitrary coefficient compositions.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L313) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.oddModel_comp

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.oddModel_comp {R G : Type u} [CommRing R] [CommGroup G] [Fintype G] (g : G) {A B C : Rep R G} (f : A ⟶ B) (h : B ⟶ C) : FiniteGroupTateCohomology.Cyclic.oddModelMap g (CategoryTheory.CategoryStruct.comp f h) = CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.Cyclic.oddModelMap g f) (FiniteGroupTateCohomology.Cyclic.oddModelMap g h)
```

**Native source docstring:** Homology maps of the odd model respect arbitrary coefficient compositions.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L321) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.cyclicRepresentation

Kind: `def`.

```lean
abbrev FiniteGroupTateCohomologyTests.cyclicRepresentation : Rep (ZMod 2) (Multiplicative (ZMod 2))
```

**Native source docstring:** A nonzero coefficient representation of the nontrivial cyclic group of order two.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L333) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.concreteNegativeOne_component

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.concreteNegativeOne_component : FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm.hom.app cyclicRepresentation = (FiniteGroupTateCohomology.tateCohomologyNegOneIsoKernelNorm cyclicRepresentation).hom
```

**Native source docstring:** The norm-kernel natural component specializes to nontrivial cyclic coefficients.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L337) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.concreteZero_component

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.concreteZero_component : FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm.hom.app cyclicRepresentation = (FiniteGroupTateCohomology.tateCohomologyZeroIsoCokernelNorm cyclicRepresentation).hom
```

**Native source docstring:** The norm-cokernel natural component specializes to nontrivial cyclic coefficients.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L345) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.concreteQuotientNorm

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.concreteQuotientNorm : cyclicRepresentation.quotientToCoinvariants ⊤ ⟶ cyclicRepresentation.quotientToInvariants ⊤
```

**Native source docstring:** The norm descends equivariantly for the whole nontrivial order-two group.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L353) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.concreteQuotientNorm_component

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.concreteQuotientNorm_component [Fintype ↥⊤] : (FiniteGroupTateCohomology.quotientNormNatTrans ⊤).app cyclicRepresentation = FiniteGroupTateCohomology.quotientNorm cyclicRepresentation ⊤
```

**Native source docstring:** The whole order-two subgroup supplies a nontrivial concrete component.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L361) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.degenerateNorm_component

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.degenerateNorm_component : FiniteGroupTateCohomology.normNatTrans.app (Rep.trivial PUnit.{u_1 + 1} PUnit.{u_2 + 1} PUnit.{u_1 + 1}) = FiniteGroupTateCohomology.normFromCoinvariants (Rep.trivial PUnit.{u_1 + 1} PUnit.{u_2 + 1} PUnit.{u_1 + 1})
```

**Native source docstring:** The component contract also applies to the trivial group and zero ring.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L370) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.twoGenerator

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.twoGenerator (x : Multiplicative (ZMod 2)) : x ∈ Subgroup.zpowers (Multiplicative.ofAdd 1)
```

**Native source docstring:** The chosen nonidentity element really generates the cyclic group of order two.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L377) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.zeroCoefficient_ne_id

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.zeroCoefficient_ne_id : 0 ≠ CategoryTheory.CategoryStruct.id cyclicRepresentation
```

**Native source docstring:** The zero coefficient endomorphism is genuinely not the identity.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L385) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.zeroCoefficient_even_comp

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.zeroCoefficient_even_comp : FiniteGroupTateCohomology.Cyclic.evenModelMap (Multiplicative.ofAdd 1) (CategoryTheory.CategoryStruct.comp 0 0) = CategoryTheory.CategoryStruct.comp (FiniteGroupTateCohomology.Cyclic.evenModelMap (Multiplicative.ofAdd 1) 0) (FiniteGroupTateCohomology.Cyclic.evenModelMap (Multiplicative.ofAdd 1) 0)
```

**Native source docstring:** Nonidentity coefficient maps obey the even model's composition law.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L393) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.degreeNegTwo

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.degreeNegTwo : tateCohomology cyclicRepresentation (-2) ≅ FiniteGroupTateCohomology.Cyclic.evenModel cyclicRepresentation (Multiplicative.ofAdd 1)
```

**Native source docstring:** The even comparison is usable in Tate degree minus two.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L404) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.degreeNegOne

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.degreeNegOne : tateCohomology cyclicRepresentation (-1) ≅ FiniteGroupTateCohomology.Cyclic.oddModel cyclicRepresentation (Multiplicative.ofAdd 1)
```

**Native source docstring:** The odd comparison is usable in Tate degree minus one.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L411) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.degreeZero

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.degreeZero : tateCohomology cyclicRepresentation 0 ≅ FiniteGroupTateCohomology.Cyclic.evenModel cyclicRepresentation (Multiplicative.ofAdd 1)
```

**Native source docstring:** The even comparison is usable in Tate degree zero.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L418) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.degreeOne

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.degreeOne : tateCohomology cyclicRepresentation 1 ≅ FiniteGroupTateCohomology.Cyclic.oddModel cyclicRepresentation (Multiplicative.ofAdd 1)
```

**Native source docstring:** The odd comparison is usable in Tate degree one.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L425) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.degreeTwo

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.degreeTwo : tateCohomology cyclicRepresentation 2 ≅ FiniteGroupTateCohomology.Cyclic.evenModel cyclicRepresentation (Multiplicative.ofAdd 1)
```

**Native source docstring:** The even comparison is usable in Tate degree two.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L432) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.periodNegTwo

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.periodNegTwo : tateCohomology cyclicRepresentation (-2) ≅ tateCohomology cyclicRepresentation (-2 + 2)
```

**Native source docstring:** The chosen generator supplies period two at degree minus two.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L439) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.periodNegOne

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.periodNegOne : tateCohomology cyclicRepresentation (-1) ≅ tateCohomology cyclicRepresentation (-1 + 2)
```

**Native source docstring:** The chosen generator supplies period two at degree minus one.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L446) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.periodZero

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.periodZero : tateCohomology cyclicRepresentation 0 ≅ tateCohomology cyclicRepresentation (0 + 2)
```

**Native source docstring:** The chosen generator supplies period two at degree zero.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L453) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.periodOne

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.periodOne : tateCohomology cyclicRepresentation 1 ≅ tateCohomology cyclicRepresentation (1 + 2)
```

**Native source docstring:** The chosen generator supplies period two at degree one.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L460) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.periodTwo

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.periodTwo : tateCohomology cyclicRepresentation 2 ≅ tateCohomology cyclicRepresentation (2 + 2)
```

**Native source docstring:** The chosen generator supplies period two at degree two.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L467) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.degreeZero_cokernel

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.degreeZero_cokernel : FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoEven cyclicRepresentation (Multiplicative.ofAdd 1) twoGenerator 0 degreeZero_cokernel._proof_1 = FiniteGroupTateCohomology.tateCohomologyZeroIsoCokernelNorm cyclicRepresentation ≪≫ (FiniteGroupTateCohomology.Cyclic.evenModelIsoCokernelNorm cyclicRepresentation (Multiplicative.ofAdd 1) twoGenerator).symm
```

**Native source docstring:** The exceptional degree-zero comparison factors through the norm cokernel.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L474) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.degreeZero_telescope

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.degreeZero_telescope : FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity cyclicRepresentation (Multiplicative.ofAdd 1) twoGenerator 0 ≪≫ FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity cyclicRepresentation (Multiplicative.ofAdd 1) twoGenerator (0 + 2) = FiniteGroupTateCohomology.Cyclic.tateCohomologyParityIso cyclicRepresentation (Multiplicative.ofAdd 1) twoGenerator 0 (0 + 2 + 2) ⋯
```

**Native source docstring:** Two period-two steps telescope through the same chosen cyclic model.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L484) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.degenerateNormSequence

Kind: `theorem`.

```lean
theorem FiniteGroupTateCohomologyTests.degenerateNormSequence : (FiniteGroupTateCohomology.normSequence (Rep.trivial PUnit.{u_1 + 1} PUnit.{u_1 + 1} PUnit.{u_1 + 1})).Exact
```

**Native source docstring:** A trivial group over a zero ring is admissible in the norm exact sequence.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L496) (native source start line; generated association laws point to their source lemma).

### FiniteGroupTateCohomologyTests.degeneratePeriodicity

Kind: `def`.

```lean
noncomputable def FiniteGroupTateCohomologyTests.degeneratePeriodicity (n : ℤ) : tateCohomology (Rep.trivial PUnit.{u_1 + 1} PUnit.{u_1 + 1} PUnit.{u_1 + 1}) n ≅ tateCohomology (Rep.trivial PUnit.{u_1 + 1} PUnit.{u_1 + 1} PUnit.{u_1 + 1}) (n + 2)
```

**Native source docstring:** Degenerate coefficients and the trivial group also admit cyclic periodicity.

[Source](../FiniteGroupTateCohomologyTests/PublicAPI.lean#L501) (native source start line; generated association laws point to their source lemma).

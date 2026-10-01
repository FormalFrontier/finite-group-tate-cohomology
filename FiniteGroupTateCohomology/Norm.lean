/-
SPDX-License-Identifier: Apache-2.0
Authors: Formal Frontier Agents
-/
module

public import Mathlib.RepresentationTheory.Coinvariants
public import Mathlib.RepresentationTheory.Invariants

/-!
# Norms between coinvariants and invariants

This module defines the norm from coinvariants to invariants for a finite
group, naturally in the representation.  For a finite normal subgroup of a
larger group, it also proves that this norm is equivariant for the residual
quotient-group action.
-/

public section

open CategoryTheory

namespace FiniteGroupTateCohomology

universe u v w

variable {R : Type u} {G : Type v} [CommRing R] [Group G] [Fintype G]

/-- The norm map on a representation, descended from coinvariants and
corestricted to invariants. -/
@[expose]
noncomputable def normFromCoinvariants (M : Rep.{w} R G) :
    (Rep.coinvariantsFunctor R G).obj M ⟶ (Rep.invariantsFunctor R G).obj M :=
  ModuleCat.ofHom <| Representation.Coinvariants.lift M.ρ
    (M.ρ.norm.codRestrict M.ρ.invariants fun x g ↦ M.ρ.self_norm_apply g x)
    fun g ↦ LinearMap.ext fun x ↦ Subtype.ext (M.ρ.norm_self_apply g x)

omit [Fintype G] in
@[reassoc]
lemma invariantsMap_inclusion {M N : Rep.{w} R G} (f : M ⟶ N) :
    (Rep.invariantsFunctor R G).map f ≫ ModuleCat.ofHom N.ρ.invariants.subtype =
      ModuleCat.ofHom M.ρ.invariants.subtype ≫ f.toModuleCatHom := by
  ext
  rfl

@[reassoc]
lemma coinvariantsMk_normFromCoinvariants_inclusion (M : Rep.{w} R G) :
    (Rep.coinvariantsMk R G).app M ≫ normFromCoinvariants M ≫
      ModuleCat.ofHom M.ρ.invariants.subtype = M.norm.toModuleCatHom := by
  ext
  rfl

set_option backward.isDefEq.respectTransparency false in
@[reassoc]
lemma normFromCoinvariants_naturality {M N : Rep.{w} R G} (f : M ⟶ N) :
    normFromCoinvariants M ≫ (Rep.invariantsFunctor R G).map f =
      (Rep.coinvariantsFunctor R G).map f ≫ normFromCoinvariants N := by
  apply Rep.coinvariantsFunctor_hom_ext
  let _ : Mono (ModuleCat.ofHom N.ρ.invariants.subtype) :=
    (ModuleCat.mono_iff_injective _).2 Subtype.val_injective
  apply (cancel_mono (ModuleCat.ofHom N.ρ.invariants.subtype)).1
  simp only [Category.assoc, invariantsMap_inclusion]
  rw [coinvariantsMk_normFromCoinvariants_inclusion_assoc]
  rw [← (Rep.coinvariantsMk R G).naturality_assoc f]
  rw [coinvariantsMk_normFromCoinvariants_inclusion]
  exact congrArg Rep.Hom.toModuleCatHom (Rep.norm_comm f).symm

/-- The norm from coinvariants to invariants, natural in the representation. -/
@[expose]
noncomputable def normNatTrans :
    Rep.coinvariantsFunctor R G ⟶ Rep.invariantsFunctor R G where
  app := normFromCoinvariants
  naturality _ _ f := (normFromCoinvariants_naturality f).symm

/-- The component of the norm natural transformation is the norm map. -/
@[simp]
lemma normNatTrans_app (M : Rep.{w} R G) :
    (normNatTrans (R := R) (G := G)).app M = normFromCoinvariants M :=
  rfl

section Quotient

variable {H : Type v} [Group H]
variable (A : Rep.{w} R H) (S : Subgroup H) [S.Normal] [Fintype S]

private lemma subgroupNorm_comm_apply (g : H) (x : A) :
    Representation.norm (A.ρ.comp S.subtype) (A.ρ g x) =
      A.ρ g (Representation.norm (A.ρ.comp S.subtype) x) := by
  let e : S ≃ S := {
    toFun := fun s => ⟨g⁻¹ * s.1 * g, by
      simpa using Subgroup.Normal.conj_mem (H := S) (self := inferInstance)
        s.1 s.2 g⁻¹⟩
    invFun := fun s =>
      ⟨g * s.1 * g⁻¹, Subgroup.Normal.conj_mem (H := S) (self := inferInstance)
        s.1 s.2 g⟩
    left_inv := fun s => by ext; simp [mul_assoc]
    right_inv := fun s => by ext; simp [mul_assoc]
  }
  simpa [Representation.norm, e, mul_assoc] using
    e.sum_comp (fun s : S => A.ρ (g * s.1) x)

/-- For a finite normal subgroup `S` of `H`, the `S`-norm is equivariant for
the residual `H ⧸ S`-action on coinvariants and invariants. -/
@[expose]
noncomputable def quotientNorm :
    A.quotientToCoinvariants S ⟶ A.quotientToInvariants S :=
  Rep.ofHom ⟨(normFromCoinvariants (Rep.res S.subtype A)).hom, fun q => by
    refine QuotientGroup.induction_on q ?_
    intro g
    apply Representation.Coinvariants.hom_ext
    ext x
    change Representation.norm (A.ρ.comp S.subtype) (A.ρ g x) =
      A.ρ g (Representation.norm (A.ρ.comp S.subtype) x)
    exact subgroupNorm_comm_apply A S g x⟩

@[simp]
lemma quotientNorm_mk (x : A) :
    quotientNorm A S (Representation.Coinvariants.mk (A.ρ.comp S.subtype) x) =
      ⟨Representation.norm (A.ρ.comp S.subtype) x,
        fun s ↦ Representation.self_norm_apply (A.ρ.comp S.subtype) s x⟩ :=
  rfl

@[reassoc]
lemma quotientNorm_naturality {B : Rep.{w} R H} (f : A ⟶ B) :
    quotientNorm A S ≫ (Rep.quotientToInvariantsFunctor R S).map f =
      (Rep.quotientToCoinvariantsFunctor R S).map f ≫ quotientNorm B S := by
  ext x
  apply Subtype.ext
  change f.hom ((Rep.norm (Rep.res S.subtype A)).hom x) =
    (Rep.norm (Rep.res S.subtype B)).hom (f.hom x)
  simpa using congrArg (fun q => q.hom x)
    (Rep.norm_comm ((Rep.resFunctor S.subtype).map f)).symm

/-- The residual-quotient-equivariant norm, natural in the ambient
representation. -/
@[expose]
noncomputable def quotientNormNatTrans :
    Rep.quotientToCoinvariantsFunctor R S ⟶
      Rep.quotientToInvariantsFunctor R S where
  app := fun A => quotientNorm A S
  naturality _ _ f := (quotientNorm_naturality _ _ f).symm

/-- The component of the quotient-equivariant norm natural transformation is
the quotient-equivariant norm map, with no finiteness assumption on `H`. -/
@[simp]
lemma quotientNormNatTrans_app :
    (quotientNormNatTrans (R := R) S).app A = quotientNorm A S :=
  rfl

end Quotient

end FiniteGroupTateCohomology

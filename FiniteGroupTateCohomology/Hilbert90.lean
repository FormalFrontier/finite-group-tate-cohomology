/-
SPDX-License-Identifier: Apache-2.0
Authors: Formal Frontier Agents
-/
module

public import Mathlib.RepresentationTheory.Homological.GroupCohomology.Hilbert90
import Mathlib.Algebra.Module.ULift

/-!
# Hilbert's theorem 90 for fields in independent universes

This module derives the norm-one form of Hilbert's theorem 90 from Mathlib's
multiplicative cocycle theorem and its finite-cyclic cohomology calculation.
Only the auxiliary group, unit module and integer coefficients are lifted;
the fields, their algebra structure, norm and automorphisms are unchanged.

## References

The proof uses the Hilbert 90 formalization of Riccardo Brasca and Amelia
Livingston, and the low-degree and finite-cyclic cohomology APIs of Amelia
Livingston and Joël Riou. The canonical lifts use Kim Morrison's ULift APIs;
the field-norm product formula is from Junyan Xu's norm development.
-/

public section

open CategoryTheory Additive

universe uK uL

namespace groupCohomology
namespace Hilbert90

variable (K : Type uK) (L : Type uL) [Field K] [Field L] [Algebra K L]

/-- The canonical action on lifted units, over lifted integer coefficients. -/
private noncomputable def unitsRepresentation :
    Rep.{max uK uL} (ULift.{max uK uL} ℤ) (ULift.{max uK uL} Gal(L/K)) :=
  Rep.of
    { toFun := fun σ =>
        (Representation.ofMulDistribMulAction
          (ULift.{max uK uL} Gal(L/K)) (ULift.{max uK uL} Lˣ) σ).restrictScalars
            (ULift.{max uK uL} ℤ)
      map_one' := by
        apply LinearMap.ext
        intro x
        exact congrArg (fun f => f x)
          (Representation.ofMulDistribMulAction
            (ULift.{max uK uL} Gal(L/K)) (ULift.{max uK uL} Lˣ)).map_one
      map_mul' := by
        intro σ τ
        apply LinearMap.ext
        intro x
        exact congrArg (fun f => f x)
          ((Representation.ofMulDistribMulAction
            (ULift.{max uK uL} Gal(L/K)) (ULift.{max uK uL} Lˣ)).map_mul σ τ) }

@[simp]
private lemma unitsRepresentation_apply (σ : ULift.{max uK uL} Gal(L/K))
    (a : unitsRepresentation K L) :
    ((unitsRepresentation K L).ρ σ a).toMul.down = σ.down • a.toMul.down :=
  rfl

/-- Projection to the original units, written additively. -/
private def unitsProjection : unitsRepresentation K L ≃+ Additive Lˣ :=
  (MulEquiv.ulift : ULift.{max uK uL} Lˣ ≃* Lˣ).toAdditive

@[simp]
private lemma unitsProjection_apply (a : unitsRepresentation K L) :
    (unitsProjection K L a).toMul = a.toMul.down :=
  rfl

@[simp]
private lemma unitsProjection_action (σ : ULift.{max uK uL} Gal(L/K))
    (a : unitsRepresentation K L) :
    unitsProjection K L ((unitsRepresentation K L).ρ σ a) =
      ofMul (σ.down • (unitsProjection K L a).toMul) :=
  rfl

variable [FiniteDimensional K L]

private lemma h1_eq_zero (a : H1 (unitsRepresentation K L)) : a = 0 := by
  refine H1_induction_on a ?_
  intro c
  apply (H1π_eq_zero_iff c).2
  let f : Gal(L/K) → Lˣ := fun σ => (c.1 (ULift.up σ)).toMul.down
  have hf : IsMulCocycle₁ f := by
    intro σ τ
    have hc := (mem_cocycles₁_iff _).1 c.2 (ULift.up σ) (ULift.up τ)
    have hup : (ULift.up σ : ULift.{max uK uL} Gal(L/K)) * ULift.up τ =
        ULift.up (σ * τ) := rfl
    rw [hup] at hc
    have hc' := congrArg (unitsProjection K L) hc
    rw [map_add] at hc'
    simpa only [unitsProjection_action, toMul_add, toMul_ofMul,
      unitsProjection_apply, f] using congrArg toMul hc'
  obtain ⟨b, hb⟩ := isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units f hf
  change c.1 ∈ LinearMap.range (d₀₁ (unitsRepresentation K L)).hom
  let b' : unitsRepresentation K L := ofMul (ULift.up b)
  refine ⟨b', ?_⟩
  funext σ
  apply (unitsProjection K L).injective
  change unitsProjection K L ((unitsRepresentation K L).ρ σ b' - b') =
    unitsProjection K L (c.1 σ)
  rw [map_sub]
  change ofMul ((σ.down • b) / b) = ofMul ((c.1 σ).toMul.down)
  exact congrArg ofMul (hb σ.down)

private lemma norm_projection (x : Lˣ) :
    ((unitsRepresentation K L).norm.hom (ofMul (ULift.up x))).toMul.down =
      ∏ σ : Gal(L/K), σ • x := by
  let a : unitsRepresentation K L := ofMul (ULift.up x)
  change (unitsProjection K L ((unitsRepresentation K L).ρ.norm a)).toMul = _
  have heval : (unitsRepresentation K L).ρ.norm a =
      ∑ σ : ULift.{max uK uL} Gal(L/K), (unitsRepresentation K L).ρ σ a := by
    simp only [Representation.norm, LinearMap.sum_apply]
  rw [heval, map_sum, toMul_sum]
  have ha : (unitsProjection K L a).toMul = x := rfl
  simp only [unitsProjection_action, toMul_ofMul, ha]
  exact (Equiv.ulift : ULift.{max uK uL} Gal(L/K) ≃ Gal(L/K)).prod_comp (fun σ => σ • x)

variable [IsGalois K L]

private lemma norm_eq_zero (x : Lˣ) (hx : Algebra.norm K (x : L) = 1) :
    (unitsRepresentation K L).norm.hom (ofMul (ULift.up x)) = 0 := by
  apply (unitsProjection K L).injective
  change ofMul (((unitsRepresentation K L).norm.hom (ofMul (ULift.up x))).toMul.down) = 0
  change ((unitsRepresentation K L).norm.hom (ofMul (ULift.up x))).toMul.down = 1
  apply Units.ext
  rw [norm_projection]
  simp only [Units.coe_prod, AlgEquiv.smul_units_def, Units.coe_map,
    MonoidHom.coe_coe, ← Algebra.norm_eq_prod_automorphisms, hx, map_one, Units.val_one]

end Hilbert90

variable {K : Type uK} {L : Type uL} [Field K] [Field L] [Algebra K L]
  [FiniteDimensional K L] [IsGalois K L]
  {g : Gal(L/K)}

/-- Hilbert's theorem 90: a norm-one element of a finite cyclic Galois extension
is the quotient of a unit by its image under the specified generator.
The base and extension fields may lie in independent universes. -/
theorem exists_unit_div_of_norm_eq_one (hg : ∀ σ, σ ∈ Subgroup.zpowers g)
    {x : L} (hx : Algebra.norm K x = 1) : ∃ y : Lˣ, (y : L) / g (y : L) = x := by
  classical
  let : IsCyclic Gal(L/K) := isCyclic_iff_exists_zpowers_eq_top.2
    ⟨g, (Subgroup.eq_top_iff' (Subgroup.zpowers g)).2 hg⟩
  let := IsCyclic.commGroup (α := Gal(L/K))
  let A := Hilbert90.unitsRepresentation K L
  let xu : Lˣ := Units.mk0 x (Algebra.norm_ne_zero_iff.1 (hx ▸ one_ne_zero))
  have hxzero : A.norm.hom (ofMul (ULift.up xu)) = 0 :=
    Hilbert90.norm_eq_zero K L xu hx
  have hg' : ∀ σ : ULift.{max uK uL} Gal(L/K), σ ∈ Subgroup.zpowers (ULift.up g) := by
    intro σ
    obtain ⟨n, hn⟩ := Subgroup.mem_zpowers_iff.1 (hg σ.down)
    apply Subgroup.mem_zpowers_iff.2
    refine ⟨n, ?_⟩
    apply ULift.ext
    simpa using hn
  have hπ := Rep.FiniteCyclicGroup.groupCohomologyπOdd_eq_zero_iff A (ULift.up g) hg'
    1 (by simp) ⟨ofMul (ULift.up xu), hxzero⟩
  obtain ⟨a, ha⟩ := hπ.1 (Hilbert90.h1_eq_zero K L _)
  have ha' := congrArg (Hilbert90.unitsProjection K L) ha
  change Hilbert90.unitsProjection K L
    ((Hilbert90.unitsRepresentation K L).ρ (ULift.up g) a - a) = ofMul xu at ha'
  rw [map_sub] at ha'
  let b := (Hilbert90.unitsProjection K L a).toMul
  have hb : g • b / b = xu := by
    simpa only [Hilbert90.unitsProjection_action, toMul_sub, toMul_ofMul, b]
      using congrArg toMul ha'
  refine ⟨b⁻¹, ?_⟩
  have hb' : b⁻¹ / (g • b⁻¹) = xu := by
    simpa only [smul_inv', inv_div_inv] using hb
  simpa only [Units.val_div_eq_div_val, AlgEquiv.smul_units_def, Units.coe_map,
    MonoidHom.coe_coe, Units.val_mk0, xu] using congrArg Units.val hb'

/-- At universe zero, the independent-universe theorem and Mathlib's theorem
are proofs of the same proposition. This does not choose or compare witnesses. -/
theorem exists_unit_div_of_norm_eq_one_eq_exists_div_of_norm_eq_one
    {K L : Type} [Field K] [Field L] [Algebra K L] [FiniteDimensional K L]
    [IsGalois K L] [IsCyclic Gal(L/K)] {g : Gal(L/K)}
    (hg : ∀ σ, σ ∈ Subgroup.zpowers g) {x : L} (hx : Algebra.norm K x = 1) :
    (exists_unit_div_of_norm_eq_one hg hx : ∃ y : Lˣ, (y : L) / g (y : L) = x) =
      exists_div_of_norm_eq_one hg hx :=
  Subsingleton.elim _ _

end groupCohomology

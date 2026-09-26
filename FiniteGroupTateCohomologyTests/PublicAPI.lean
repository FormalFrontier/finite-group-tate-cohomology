/-
Authors: Formal Frontier Agents
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import FiniteGroupTateCohomology

/-!
# Downstream clients of finite-group Tate cohomology

These named proofs exercise the public root as an ordinary downstream import.
They cover independent-universe norms, exceptional degrees, fixed-element
coefficient functors and objectwise cyclic comparisons, including a nontrivial
finite group and a degenerate zero-ring example.
-/

public section

open CategoryTheory CategoryTheory.Limits

namespace FiniteGroupTateCohomologyTests

section Norm

universe u v w

variable {R : Type u} {H : Type v} [CommRing R] [Group H]
variable (S : Subgroup H) [S.Normal] [Fintype S]

/-- The ordinary norm also keeps scalar, group and carrier universes independent. -/
noncomputable def normIndependentUniverses (A : Rep.{w} R H) [Fintype H] :
    (Rep.coinvariantsFunctor R H).obj A ⟶ (Rep.invariantsFunctor R H).obj A :=
  FiniteGroupTateCohomology.normFromCoinvariants A

/-- The ordinary natural transformation has the advertised component with
independent scalar, group and carrier universes. -/
theorem norm_transformation_component [Fintype H] (A : Rep.{w} R H) :
    (FiniteGroupTateCohomology.normNatTrans (R := R) (G := H)).app A =
      FiniteGroupTateCohomology.normFromCoinvariants A :=
  FiniteGroupTateCohomology.normNatTrans_app A

/-- The ordinary norm commutes with independent-universe coefficient maps. -/
theorem norm_independentNaturality [Fintype H] {A B : Rep.{w} R H} (f : A ⟶ B) :
    FiniteGroupTateCohomology.normFromCoinvariants A ≫
        (Rep.invariantsFunctor R H).map f =
      (Rep.coinvariantsFunctor R H).map f ≫
        FiniteGroupTateCohomology.normFromCoinvariants B :=
  FiniteGroupTateCohomology.normFromCoinvariants_naturality f

/-- The residual norm is usable for an arbitrary ambient group and an
independent-universe coefficient representation. -/
noncomputable def quotientNormClient (A : Rep.{w} R H) :
    A.quotientToCoinvariants S ⟶ A.quotientToInvariants S :=
  FiniteGroupTateCohomology.quotientNorm A S

/-- The residual norm has its public representative computation. -/
theorem quotientNorm_representative (A : Rep.{w} R H) (x : A) :
    FiniteGroupTateCohomology.quotientNorm A S
        (Representation.Coinvariants.mk (A.ρ.comp S.subtype) x) =
      ⟨Representation.norm (A.ρ.comp S.subtype) x,
        fun s ↦ Representation.self_norm_apply (A.ρ.comp S.subtype) s x⟩ :=
  FiniteGroupTateCohomology.quotientNorm_mk A S x

/-- Changing coefficients commutes with the norm for a normal subgroup. -/
theorem quotientNorm_coefficients (A B : Rep.{w} R H) (f : A ⟶ B) :
    FiniteGroupTateCohomology.quotientNorm A S ≫
        (Rep.quotientToInvariantsFunctor R S).map f =
      (Rep.quotientToCoinvariantsFunctor R S).map f ≫
        FiniteGroupTateCohomology.quotientNorm B S :=
  FiniteGroupTateCohomology.quotientNorm_naturality A S f

/-- The residual norm is a natural transformation, not merely an objectwise map. -/
noncomputable def quotientNormNaturalTransformation :
    Rep.quotientToCoinvariantsFunctor R S ⟶
      Rep.quotientToInvariantsFunctor R S :=
  FiniteGroupTateCohomology.quotientNormNatTrans S

/-- The residual natural transformation has the quotient norm component,
without requiring the ambient group to be finite. -/
theorem quotientNorm_transformation_component (A : Rep.{w} R H) :
    (FiniteGroupTateCohomology.quotientNormNatTrans (R := R) S).app A =
      FiniteGroupTateCohomology.quotientNorm A S :=
  FiniteGroupTateCohomology.quotientNormNatTrans_app A S

/-- The natural transformation computes on a coinvariant representative. -/
theorem quotientNorm_transformation_representative (A : Rep.{w} R H) (x : A) :
    (FiniteGroupTateCohomology.quotientNormNatTrans (R := R) S).app A
        (Representation.Coinvariants.mk (A.ρ.comp S.subtype) x) =
      ⟨Representation.norm (A.ρ.comp S.subtype) x,
        fun s ↦ Representation.self_norm_apply (A.ρ.comp S.subtype) s x⟩ := by
  rw [FiniteGroupTateCohomology.quotientNormNatTrans_app]
  exact FiniteGroupTateCohomology.quotientNorm_mk A S x

/-- The residual naturality square reduces to the maps' naturality square. -/
theorem quotientNorm_transformation_coefficients {A B : Rep.{w} R H} (f : A ⟶ B) :
    (FiniteGroupTateCohomology.quotientNormNatTrans (R := R) S).app A ≫
        (Rep.quotientToInvariantsFunctor R S).map f =
      (Rep.quotientToCoinvariantsFunctor R S).map f ≫
        (FiniteGroupTateCohomology.quotientNormNatTrans (R := R) S).app B := by
  simpa only [FiniteGroupTateCohomology.quotientNormNatTrans_app] using
    (FiniteGroupTateCohomology.quotientNormNatTrans (R := R) S).naturality f |>.symm

omit [Fintype S] in
/-- Both whiskerings expose the residual norm as the map supplied to the
postcomposed functor, as in finite-level deflation. -/
theorem quotientNorm_whiskered_component
    (T : Subgroup (H ⧸ S)) [T.Normal] [Fintype T]
    (F : Rep R ((H ⧸ S) ⧸ T) ⥤ ModuleCat R) (A : Rep.{w} R H) :
    (Functor.whiskerRight
        (Functor.whiskerLeft (Rep.quotientToInvariantsFunctor R S)
          (FiniteGroupTateCohomology.quotientNormNatTrans (R := R) T)) F).app A =
      F.map (FiniteGroupTateCohomology.quotientNorm (A.quotientToInvariants S) T) := by
  rw [Functor.whiskerRight_app, Functor.whiskerLeft_app,
    FiniteGroupTateCohomology.quotientNormNatTrans_app]
  rfl

end Norm

section Exceptional

universe u

variable {R G : Type u} [CommRing R] [Group G] [Fintype G]

/-- Tate degree minus one is the kernel of the norm. -/
noncomputable def negativeOneKernel (A : Rep R G) :
    tateCohomology A (-1) ≅ kernel (FiniteGroupTateCohomology.normFromCoinvariants A) :=
  FiniteGroupTateCohomology.tateCohomologyNegOneIsoKernelNorm A

/-- Degree zero is the cokernel of the norm. -/
noncomputable def zeroCokernel (A : Rep R G) :
    tateCohomology A 0 ≅ cokernel (FiniteGroupTateCohomology.normFromCoinvariants A) :=
  FiniteGroupTateCohomology.tateCohomologyZeroIsoCokernelNorm A

/-- The four-term norm sequence is exact at its two middle terms. -/
theorem fourTerm_exact (A : Rep R G) :
    (FiniteGroupTateCohomology.normSequence A).Exact :=
  FiniteGroupTateCohomology.normSequence_exact A

/-- The middle arrow is definitionally the norm, not an unrelated connecting map. -/
theorem fourTerm_middle (A : Rep R G) :
    (FiniteGroupTateCohomology.normSequence A).map' 1 2 =
      FiniteGroupTateCohomology.normFromCoinvariants A := by
  rfl

/-- The first map of the four-term norm sequence is a monomorphism. -/
theorem fourTerm_first_mono (A : Rep R G) :
    Mono ((FiniteGroupTateCohomology.normSequence A).map' 0 1) :=
  FiniteGroupTateCohomology.normSequence_mono_first A

/-- The last map of the four-term norm sequence is an epimorphism. -/
theorem fourTerm_last_epi (A : Rep R G) :
    Epi ((FiniteGroupTateCohomology.normSequence A).map' 2 3) :=
  FiniteGroupTateCohomology.normSequence_epi_last A

/-- The first endpoint commutes with coefficient maps. -/
theorem fourTerm_first_naturality {A B : Rep R G} (f : A ⟶ B) :
    HomologicalComplex.homologyMap (tateComplex.map f) (-1) ≫
        ((tateComplex B).homologyι (-1) ≫
          (FiniteGroupTateCohomology.tateOpcyclesIsoNegOne B).hom) =
      ((tateComplex A).homologyι (-1) ≫
        (FiniteGroupTateCohomology.tateOpcyclesIsoNegOne A).hom) ≫
          (Rep.coinvariantsFunctor R G).map f :=
  FiniteGroupTateCohomology.normSequence_first_naturality f

/-- The last endpoint commutes with coefficient maps. -/
theorem fourTerm_last_naturality {A B : Rep R G} (f : A ⟶ B) :
    ((FiniteGroupTateCohomology.tateCyclesIsoZero A).inv ≫
        (tateComplex A).homologyπ 0) ≫
          HomologicalComplex.homologyMap (tateComplex.map f) 0 =
      (Rep.invariantsFunctor R G).map f ≫
        ((FiniteGroupTateCohomology.tateCyclesIsoZero B).inv ≫
          (tateComplex B).homologyπ 0) :=
  FiniteGroupTateCohomology.normSequence_last_naturality f

/-- The kernel comparison is natural in the coefficient representation. -/
theorem negativeOne_naturality (A B : Rep R G) (f : A ⟶ B) :
    (tateCohomologyFunctor (R := R) (G := G) (-1)).map f ≫
        (FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm
          (R := R) (G := G)).hom.app B =
      (FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm
          (R := R) (G := G)).hom.app A ≫
        (FiniteGroupTateCohomology.normKernelFunctor (R := R) (G := G)).map f :=
  (FiniteGroupTateCohomology.tateCohomologyNegOneNatIsoKernelNorm
    (R := R) (G := G)).hom.naturality f

/-- The cokernel comparison is natural in the coefficient representation. -/
theorem zero_naturality (A B : Rep R G) (f : A ⟶ B) :
    (tateCohomologyFunctor (R := R) (G := G) 0).map f ≫
        (FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm
          (R := R) (G := G)).hom.app B =
      (FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm
          (R := R) (G := G)).hom.app A ≫
        (FiniteGroupTateCohomology.normCokernelFunctor (R := R) (G := G)).map f :=
  (FiniteGroupTateCohomology.tateCohomologyZeroNatIsoCokernelNorm
    (R := R) (G := G)).hom.naturality f

end Exceptional

section Models

universe u

variable {R G : Type u} [CommRing R] [CommGroup G] [Fintype G]

/-- An arbitrary chosen element defines an even short-complex coefficient functor. -/
theorem evenShortComplex_fixedElement (g : G) (A : Rep R G) :
    (FiniteGroupTateCohomology.Cyclic.normHomCompSubFunctor g).obj A =
      Rep.FiniteCyclicGroup.normHomCompSub A g :=
  rfl

/-- The odd model reverses the two differentials, without a generator proof. -/
theorem oddModel_fixedElement (g : G) (A : Rep R G) :
    (FiniteGroupTateCohomology.Cyclic.oddModelFunctor g).obj A =
      (Rep.FiniteCyclicGroup.subCompNormHom A g).homology :=
  FiniteGroupTateCohomology.Cyclic.oddModelFunctor_obj g A

/-- The first position of the even complex uses the underlying coefficient map. -/
theorem evenShortComplex_first (g : G) {A B : Rep R G} (f : A ⟶ B) :
    (FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g f).τ₁ = f.toModuleCatHom := by
  rfl

/-- The second position of the even complex uses the underlying coefficient map. -/
theorem evenShortComplex_second (g : G) {A B : Rep R G} (f : A ⟶ B) :
    (FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g f).τ₂ = f.toModuleCatHom := by
  rfl

/-- The third position of the even complex uses the underlying coefficient map. -/
theorem evenShortComplex_third (g : G) {A B : Rep R G} (f : A ⟶ B) :
    (FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g f).τ₃ = f.toModuleCatHom := by
  rfl

/-- The first position of the odd complex uses the underlying coefficient map. -/
theorem oddShortComplex_first (g : G) {A B : Rep R G} (f : A ⟶ B) :
    (FiniteGroupTateCohomology.Cyclic.subCompNormHomMap g f).τ₁ = f.toModuleCatHom := by
  rfl

/-- The second position of the odd complex uses the underlying coefficient map. -/
theorem oddShortComplex_second (g : G) {A B : Rep R G} (f : A ⟶ B) :
    (FiniteGroupTateCohomology.Cyclic.subCompNormHomMap g f).τ₂ = f.toModuleCatHom := by
  rfl

/-- The third position of the odd complex uses the underlying coefficient map. -/
theorem oddShortComplex_third (g : G) {A B : Rep R G} (f : A ⟶ B) :
    (FiniteGroupTateCohomology.Cyclic.subCompNormHomMap g f).τ₃ = f.toModuleCatHom := by
  rfl

/-- Identity coefficients give identity maps of even short complexes. -/
theorem evenShortComplex_id (g : G) (A : Rep R G) :
    FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g (𝟙 A) = 𝟙 _ :=
  FiniteGroupTateCohomology.Cyclic.normHomCompSubMap_id A g

/-- Identity coefficients give identity maps of odd short complexes. -/
theorem oddShortComplex_id (g : G) (A : Rep R G) :
    FiniteGroupTateCohomology.Cyclic.subCompNormHomMap g (𝟙 A) = 𝟙 _ :=
  FiniteGroupTateCohomology.Cyclic.subCompNormHomMap_id A g

/-- Identity coefficients give the identity map on even model homology. -/
theorem evenModel_id (g : G) (A : Rep R G) :
    FiniteGroupTateCohomology.Cyclic.evenModelMap g (𝟙 A) = 𝟙 _ :=
  FiniteGroupTateCohomology.Cyclic.evenModelMap_id A g

/-- Identity coefficients give the identity map on odd model homology. -/
theorem oddModel_id (g : G) (A : Rep R G) :
    FiniteGroupTateCohomology.Cyclic.oddModelMap g (𝟙 A) = 𝟙 _ :=
  FiniteGroupTateCohomology.Cyclic.oddModelMap_id A g

/-- Coefficient maps on the even short complexes respect composition. -/
theorem evenShortComplex_comp (g : G) {A B C : Rep R G}
    (f : A ⟶ B) (h : B ⟶ C) :
    FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g (f ≫ h) =
      FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g f ≫
        FiniteGroupTateCohomology.Cyclic.normHomCompSubMap g h :=
  FiniteGroupTateCohomology.Cyclic.normHomCompSubMap_comp g f h

/-- Homology maps of the even model respect arbitrary coefficient compositions. -/
theorem evenModel_comp (g : G) {A B C : Rep R G}
    (f : A ⟶ B) (h : B ⟶ C) :
    FiniteGroupTateCohomology.Cyclic.evenModelMap g (f ≫ h) =
      FiniteGroupTateCohomology.Cyclic.evenModelMap g f ≫
        FiniteGroupTateCohomology.Cyclic.evenModelMap g h :=
  FiniteGroupTateCohomology.Cyclic.evenModelMap_comp g f h

/-- Homology maps of the odd model respect arbitrary coefficient compositions. -/
theorem oddModel_comp (g : G) {A B C : Rep R G}
    (f : A ⟶ B) (h : B ⟶ C) :
    FiniteGroupTateCohomology.Cyclic.oddModelMap g (f ≫ h) =
      FiniteGroupTateCohomology.Cyclic.oddModelMap g f ≫
        FiniteGroupTateCohomology.Cyclic.oddModelMap g h :=
  FiniteGroupTateCohomology.Cyclic.oddModelMap_comp g f h

end Models

section Concrete

/-- A nonzero coefficient representation of the nontrivial cyclic group of order two. -/
abbrev cyclicRepresentation : Rep (ZMod 2) (Multiplicative (ZMod 2)) :=
  Rep.trivial (ZMod 2) (Multiplicative (ZMod 2)) (ZMod 2)

/-- The norm descends equivariantly for the whole nontrivial order-two group. -/
noncomputable def concreteQuotientNorm :
    cyclicRepresentation.quotientToCoinvariants (⊤ : Subgroup (Multiplicative (ZMod 2))) ⟶
      cyclicRepresentation.quotientToInvariants (⊤ : Subgroup (Multiplicative (ZMod 2))) :=
  by
    classical
    exact FiniteGroupTateCohomology.quotientNorm cyclicRepresentation ⊤

/-- The whole order-two subgroup supplies a nontrivial concrete component. -/
theorem concreteQuotientNorm_component
    [Fintype (⊤ : Subgroup (Multiplicative (ZMod 2)))] :
    (FiniteGroupTateCohomology.quotientNormNatTrans (R := ZMod 2)
        (⊤ : Subgroup (Multiplicative (ZMod 2)))).app cyclicRepresentation =
      FiniteGroupTateCohomology.quotientNorm cyclicRepresentation ⊤ := by
  classical
  exact FiniteGroupTateCohomology.quotientNormNatTrans_app _ _

/-- The component contract also applies to the trivial group and zero ring. -/
theorem degenerateNorm_component :
    (FiniteGroupTateCohomology.normNatTrans (R := PUnit) (G := PUnit)).app
        (Rep.trivial PUnit PUnit PUnit) =
      FiniteGroupTateCohomology.normFromCoinvariants (Rep.trivial PUnit PUnit PUnit) :=
  FiniteGroupTateCohomology.normNatTrans_app _

/-- The chosen nonidentity element really generates the cyclic group of order two. -/
theorem twoGenerator (x : Multiplicative (ZMod 2)) :
    x ∈ Subgroup.zpowers (Multiplicative.ofAdd (1 : ZMod 2)) := by
  have hcard : Nat.card (Multiplicative (ZMod 2)) = 2 := by
    simp only [Nat.card_eq_fintype_card, Fintype.card_multiplicative, ZMod.card]
  have hne : Multiplicative.ofAdd (1 : ZMod 2) ≠ 1 := by decide
  exact mem_zpowers_of_prime_card hcard hne

/-- The zero coefficient endomorphism is genuinely not the identity. -/
theorem zeroCoefficient_ne_id :
    (0 : cyclicRepresentation ⟶ cyclicRepresentation) ≠ 𝟙 cyclicRepresentation := by
  intro h
  have hvalue := congrArg
    (fun f : cyclicRepresentation ⟶ cyclicRepresentation => f.hom (1 : ZMod 2)) h
  norm_num at hvalue

/-- Nonidentity coefficient maps obey the even model's composition law. -/
theorem zeroCoefficient_even_comp :
    FiniteGroupTateCohomology.Cyclic.evenModelMap
        (Multiplicative.ofAdd (1 : ZMod 2))
        ((0 : cyclicRepresentation ⟶ cyclicRepresentation) ≫ 0) =
      FiniteGroupTateCohomology.Cyclic.evenModelMap
          (Multiplicative.ofAdd (1 : ZMod 2)) (0 : cyclicRepresentation ⟶ cyclicRepresentation) ≫
        FiniteGroupTateCohomology.Cyclic.evenModelMap
          (Multiplicative.ofAdd (1 : ZMod 2)) (0 : cyclicRepresentation ⟶ cyclicRepresentation) :=
  FiniteGroupTateCohomology.Cyclic.evenModelMap_comp _ 0 0

/-- The even comparison is usable in Tate degree minus two. -/
noncomputable def degreeNegTwo : tateCohomology cyclicRepresentation (-2) ≅
    FiniteGroupTateCohomology.Cyclic.evenModel cyclicRepresentation
      (Multiplicative.ofAdd (1 : ZMod 2)) :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoEven
    cyclicRepresentation _ twoGenerator (-2) (by decide)

/-- The odd comparison is usable in Tate degree minus one. -/
noncomputable def degreeNegOne : tateCohomology cyclicRepresentation (-1) ≅
    FiniteGroupTateCohomology.Cyclic.oddModel cyclicRepresentation
      (Multiplicative.ofAdd (1 : ZMod 2)) :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoOdd
    cyclicRepresentation _ twoGenerator (-1) (by decide)

/-- The even comparison is usable in Tate degree zero. -/
noncomputable def degreeZero : tateCohomology cyclicRepresentation 0 ≅
    FiniteGroupTateCohomology.Cyclic.evenModel cyclicRepresentation
      (Multiplicative.ofAdd (1 : ZMod 2)) :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoEven
    cyclicRepresentation _ twoGenerator 0 (by decide)

/-- The odd comparison is usable in Tate degree one. -/
noncomputable def degreeOne : tateCohomology cyclicRepresentation 1 ≅
    FiniteGroupTateCohomology.Cyclic.oddModel cyclicRepresentation
      (Multiplicative.ofAdd (1 : ZMod 2)) :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoOdd
    cyclicRepresentation _ twoGenerator 1 (by decide)

/-- The even comparison is usable in Tate degree two. -/
noncomputable def degreeTwo : tateCohomology cyclicRepresentation 2 ≅
    FiniteGroupTateCohomology.Cyclic.evenModel cyclicRepresentation
      (Multiplicative.ofAdd (1 : ZMod 2)) :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoEven
    cyclicRepresentation _ twoGenerator 2 (by decide)

/-- The chosen generator supplies period two at degree minus two. -/
noncomputable def periodNegTwo :
    tateCohomology cyclicRepresentation (-2) ≅
      tateCohomology cyclicRepresentation ((-2 : ℤ) + 2) :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity
    cyclicRepresentation _ twoGenerator (-2)

/-- The chosen generator supplies period two at degree minus one. -/
noncomputable def periodNegOne :
    tateCohomology cyclicRepresentation (-1) ≅
      tateCohomology cyclicRepresentation ((-1 : ℤ) + 2) :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity
    cyclicRepresentation _ twoGenerator (-1)

/-- The chosen generator supplies period two at degree zero. -/
noncomputable def periodZero :
    tateCohomology cyclicRepresentation 0 ≅
      tateCohomology cyclicRepresentation ((0 : ℤ) + 2) :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity
    cyclicRepresentation _ twoGenerator 0

/-- The chosen generator supplies period two at degree one. -/
noncomputable def periodOne :
    tateCohomology cyclicRepresentation 1 ≅
      tateCohomology cyclicRepresentation ((1 : ℤ) + 2) :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity
    cyclicRepresentation _ twoGenerator 1

/-- The chosen generator supplies period two at degree two. -/
noncomputable def periodTwo :
    tateCohomology cyclicRepresentation 2 ≅
      tateCohomology cyclicRepresentation ((2 : ℤ) + 2) :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity
    cyclicRepresentation _ twoGenerator 2

/-- The exceptional degree-zero comparison factors through the norm cokernel. -/
theorem degreeZero_cokernel :
    FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoEven
        cyclicRepresentation _ twoGenerator 0 (by decide) =
      FiniteGroupTateCohomology.tateCohomologyZeroIsoCokernelNorm cyclicRepresentation ≪≫
        (FiniteGroupTateCohomology.Cyclic.evenModelIsoCokernelNorm
          cyclicRepresentation _ twoGenerator).symm :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyIsoEven_zero
    cyclicRepresentation _ twoGenerator

/-- Two period-two steps telescope through the same chosen cyclic model. -/
theorem degreeZero_telescope :
    FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity
        cyclicRepresentation _ twoGenerator 0 ≪≫
      FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity
        cyclicRepresentation _ twoGenerator (0 + 2) =
      FiniteGroupTateCohomology.Cyclic.tateCohomologyParityIso
        cyclicRepresentation _ twoGenerator 0 ((0 + 2) + 2)
          (even_add_two.symm.trans even_add_two.symm) :=
  FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity_trans
    cyclicRepresentation _ twoGenerator 0

/-- A trivial group over a zero ring is admissible in the norm exact sequence. -/
theorem degenerateNormSequence :
    (FiniteGroupTateCohomology.normSequence (Rep.trivial PUnit PUnit PUnit)).Exact :=
  FiniteGroupTateCohomology.normSequence_exact _

/-- Degenerate coefficients and the trivial group also admit cyclic periodicity. -/
noncomputable def degeneratePeriodicity (n : ℤ) :
    tateCohomology (Rep.trivial PUnit PUnit PUnit) n ≅
      tateCohomology (Rep.trivial PUnit PUnit PUnit) (n + 2) := by
  have hgen : ∀ x : PUnit, x ∈ Subgroup.zpowers (1 : PUnit) := by
    intro x
    have hx : x = 1 := Subsingleton.elim _ _
    rw [hx]
    exact Subgroup.one_mem _
  exact FiniteGroupTateCohomology.Cyclic.tateCohomologyPeriodicity
    (Rep.trivial PUnit PUnit PUnit) 1 hgen n

end Concrete

end FiniteGroupTateCohomologyTests

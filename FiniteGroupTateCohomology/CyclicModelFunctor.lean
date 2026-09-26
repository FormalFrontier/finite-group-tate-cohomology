/-
Authors: Formal Frontier Agents
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib.RepresentationTheory.Homological.FiniteCyclic

/-!
# Coefficient functors for the alternating finite-cyclic models

Fix a commutative finite group `G`, a coefficient ring `R`, and an element
`g : G`.  This file makes the homology of the two alternating short complexes

* `A --N--> A --(g - 1)--> A`, and
* `A --(g - 1)--> A --N--> A`

functorial in the representation `A`.  A representation morphism is used in
all three positions of either short complex.  The two required squares are
exactly `Rep.norm_comm` and `Rep.applyAsHom_comm`; the induced maps on the
models are supplied by `ShortComplex.homologyFunctor`.

The element `g` is fixed by these functors.  This file does not compare models
for different generators and does not assert naturality of any finite-cyclic
group-(co)homology comparison isomorphism.
-/

public section

open CategoryTheory

namespace FiniteGroupTateCohomology.Cyclic

universe u

variable {R G : Type u} [CommRing R] [CommGroup G] [Fintype G]

private noncomputable abbrev underlyingMap {A B : Rep.{u} R G} (f : A ⟶ B) :
    ModuleCat.of R A.V ⟶ ModuleCat.of R B.V :=
  (forget₂ (Rep.{u} R G) (ModuleCat.{u} R)).map f

private lemma underlyingMap_norm {A B : Rep.{u} R G} (f : A ⟶ B) :
    underlyingMap f ≫ ModuleCat.ofHom B.norm.hom.toLinearMap =
      ModuleCat.ofHom A.norm.hom.toLinearMap ≫ underlyingMap f := by
  simpa [underlyingMap] using
    (forget₂ (Rep.{u} R G) (ModuleCat.{u} R)).congr_map (Rep.norm_comm f)

omit [Fintype G] in
private lemma underlyingMap_sub {A B : Rep.{u} R G} (f : A ⟶ B) (g : G) :
    underlyingMap f ≫ ModuleCat.ofHom (Rep.applyAsHom B g - 𝟙 B).hom.toLinearMap =
      ModuleCat.ofHom (Rep.applyAsHom A g - 𝟙 A).hom.toLinearMap ≫ underlyingMap f := by
  have h : f ≫ (Rep.applyAsHom B g - 𝟙 B) =
      (Rep.applyAsHom A g - 𝟙 A) ≫ f := by
    simp only [Preadditive.comp_sub, Preadditive.sub_comp, Category.comp_id,
      Category.id_comp, Rep.applyAsHom_comm]
  let F := forget₂ (Rep.{u} R G) (ModuleCat.{u} R)
  change F.map f ≫ F.map (Rep.applyAsHom B g - 𝟙 B) =
    F.map (Rep.applyAsHom A g - 𝟙 A) ≫ F.map f
  rw [← F.map_comp, ← F.map_comp, h]

/-- The canonical morphism between the short complexes
`A --N--> A --(g - 1)--> A` induced by a representation morphism. -/
@[expose]
noncomputable def normHomCompSubMap {A B : Rep.{u} R G} (g : G) (f : A ⟶ B) :
    Rep.FiniteCyclicGroup.normHomCompSub A g ⟶
      Rep.FiniteCyclicGroup.normHomCompSub B g where
  τ₁ := (forget₂ (Rep.{u} R G) (ModuleCat.{u} R)).map f
  τ₂ := (forget₂ (Rep.{u} R G) (ModuleCat.{u} R)).map f
  τ₃ := (forget₂ (Rep.{u} R G) (ModuleCat.{u} R)).map f
  comm₁₂ := by exact underlyingMap_norm f
  comm₂₃ := by exact underlyingMap_sub f g

/-- The canonical morphism between the short complexes
`A --(g - 1)--> A --N--> A` induced by a representation morphism. -/
@[expose]
noncomputable def subCompNormHomMap {A B : Rep.{u} R G} (g : G) (f : A ⟶ B) :
    Rep.FiniteCyclicGroup.subCompNormHom A g ⟶
      Rep.FiniteCyclicGroup.subCompNormHom B g where
  τ₁ := (forget₂ (Rep.{u} R G) (ModuleCat.{u} R)).map f
  τ₂ := (forget₂ (Rep.{u} R G) (ModuleCat.{u} R)).map f
  τ₃ := (forget₂ (Rep.{u} R G) (ModuleCat.{u} R)).map f
  comm₁₂ := by exact underlyingMap_sub f g
  comm₂₃ := by exact underlyingMap_norm f

@[simp]
lemma normHomCompSubMap_id (A : Rep.{u} R G) (g : G) :
    normHomCompSubMap g (𝟙 A) = 𝟙 _ := by
  ext <;> simp [normHomCompSubMap]

@[simp]
lemma normHomCompSubMap_comp {A B C : Rep.{u} R G} (g : G)
    (f : A ⟶ B) (h : B ⟶ C) :
    normHomCompSubMap g (f ≫ h) = normHomCompSubMap g f ≫ normHomCompSubMap g h := by
  ext <;> simp [normHomCompSubMap]

@[simp]
lemma subCompNormHomMap_id (A : Rep.{u} R G) (g : G) :
    subCompNormHomMap g (𝟙 A) = 𝟙 _ := by
  ext <;> simp [subCompNormHomMap]

@[simp]
lemma subCompNormHomMap_comp {A B C : Rep.{u} R G} (g : G)
    (f : A ⟶ B) (h : B ⟶ C) :
    subCompNormHomMap g (f ≫ h) = subCompNormHomMap g f ≫ subCompNormHomMap g h := by
  ext <;> simp [subCompNormHomMap]

/-- The fixed-`g` functor of short complexes
`A --N--> A --(g - 1)--> A`. -/
@[expose]
noncomputable def normHomCompSubFunctor (g : G) :
    Rep.{u} R G ⥤ ShortComplex (ModuleCat.{u} R) where
  obj A := Rep.FiniteCyclicGroup.normHomCompSub A g
  map f := normHomCompSubMap g f
  map_id A := normHomCompSubMap_id A g
  map_comp f h := normHomCompSubMap_comp g f h

/-- The fixed-`g` functor of short complexes
`A --(g - 1)--> A --N--> A`. -/
@[expose]
noncomputable def subCompNormHomFunctor (g : G) :
    Rep.{u} R G ⥤ ShortComplex (ModuleCat.{u} R) where
  obj A := Rep.FiniteCyclicGroup.subCompNormHom A g
  map f := subCompNormHomMap g f
  map_id A := subCompNormHomMap_id A g
  map_comp f h := subCompNormHomMap_comp g f h

/-- The coefficient functor obtained as the homology of
`A --N--> A --(g - 1)--> A`. -/
@[expose]
noncomputable def evenModelFunctor (g : G) : Rep.{u} R G ⥤ ModuleCat.{u} R :=
  normHomCompSubFunctor g ⋙ ShortComplex.homologyFunctor (ModuleCat.{u} R)

/-- The coefficient functor obtained as the homology of
`A --(g - 1)--> A --N--> A`. -/
@[expose]
noncomputable def oddModelFunctor (g : G) : Rep.{u} R G ⥤ ModuleCat.{u} R :=
  subCompNormHomFunctor g ⋙ ShortComplex.homologyFunctor (ModuleCat.{u} R)

@[simp]
lemma evenModelFunctor_obj (g : G) (A : Rep.{u} R G) :
    (evenModelFunctor g).obj A =
      (Rep.FiniteCyclicGroup.normHomCompSub A g).homology :=
  rfl

@[simp]
lemma evenModelFunctor_map (g : G) {A B : Rep.{u} R G} (f : A ⟶ B) :
    (evenModelFunctor g).map f = ShortComplex.homologyMap (normHomCompSubMap g f) :=
  rfl

@[simp]
lemma oddModelFunctor_obj (g : G) (A : Rep.{u} R G) :
    (oddModelFunctor g).obj A =
      (Rep.FiniteCyclicGroup.subCompNormHom A g).homology :=
  rfl

@[simp]
lemma oddModelFunctor_map (g : G) {A B : Rep.{u} R G} (f : A ⟶ B) :
    (oddModelFunctor g).map f = ShortComplex.homologyMap (subCompNormHomMap g f) :=
  rfl

/-- The canonical map on the even alternating model induced by a
representation morphism. -/
noncomputable abbrev evenModelMap {A B : Rep.{u} R G} (g : G) (f : A ⟶ B) :
    (Rep.FiniteCyclicGroup.normHomCompSub A g).homology ⟶
      (Rep.FiniteCyclicGroup.normHomCompSub B g).homology :=
  (evenModelFunctor g).map f

/-- The canonical map on the odd alternating model induced by a
representation morphism. -/
noncomputable abbrev oddModelMap {A B : Rep.{u} R G} (g : G) (f : A ⟶ B) :
    (Rep.FiniteCyclicGroup.subCompNormHom A g).homology ⟶
      (Rep.FiniteCyclicGroup.subCompNormHom B g).homology :=
  (oddModelFunctor g).map f

lemma evenModelMap_id (A : Rep.{u} R G) (g : G) :
    evenModelMap g (𝟙 A) = 𝟙 _ :=
  (evenModelFunctor g).map_id A

lemma evenModelMap_comp {A B C : Rep.{u} R G} (g : G)
    (f : A ⟶ B) (h : B ⟶ C) :
    evenModelMap g (f ≫ h) = evenModelMap g f ≫ evenModelMap g h :=
  (evenModelFunctor g).map_comp f h

lemma oddModelMap_id (A : Rep.{u} R G) (g : G) :
    oddModelMap g (𝟙 A) = 𝟙 _ :=
  (oddModelFunctor g).map_id A

lemma oddModelMap_comp {A B C : Rep.{u} R G} (g : G)
    (f : A ⟶ B) (h : B ⟶ C) :
    oddModelMap g (f ≫ h) = oddModelMap g f ≫ oddModelMap g h :=
  (oddModelFunctor g).map_comp f h

end FiniteGroupTateCohomology.Cyclic

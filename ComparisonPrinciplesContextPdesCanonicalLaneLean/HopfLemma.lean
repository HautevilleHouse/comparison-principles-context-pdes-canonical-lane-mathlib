import ComparisonPrinciplesContextPdesCanonicalLaneLean.GradientEstimate

/-!
# Hopf Lemma Package

This module formalizes the Hopf lemma for parabolic PDEs.
-/

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure HopfLemmaPackage {M : MaximumPrinciplePackage}
    {B : BarrierFunctionPackage M} {V : ViscositySolutionPackage B}
    {G : GradientEstimatePackage V} where
  domainSmoothBoundary : Prop
  subsolutionVanishes : Prop
  strictInequalityAtBoundary : Prop
  hopfConclusion : Prop

structure HopfLemmaEvidence {M : MaximumPrinciplePackage}
    {B : BarrierFunctionPackage M} {V : ViscositySolutionPackage B}
    {G : GradientEstimatePackage V} (H : HopfLemmaPackage G) where
  domainSmoothBoundaryClosed : H.domainSmoothBoundary
  subsolutionVanishesClosed : H.subsolutionVanishes
  strictInequalityAtBoundaryClosed : H.strictInequalityAtBoundary
  hopfConclusionClosed : H.hopfConclusion

def HopfLemmaClosed {M : MaximumPrinciplePackage}
    {B : BarrierFunctionPackage M} {V : ViscositySolutionPackage B}
    {G : GradientEstimatePackage V} (H : HopfLemmaPackage G) : Prop :=
  H.domainSmoothBoundary ∧ H.subsolutionVanishes ∧ H.strictInequalityAtBoundary ∧ H.hopfConclusion

theorem hopf_lemma_closed_from_evidence {M : MaximumPrinciplePackage}
    {B : BarrierFunctionPackage M} {V : ViscositySolutionPackage B}
    {G : GradientEstimatePackage V} (H : HopfLemmaPackage G)
    (E : HopfLemmaEvidence H) : HopfLemmaClosed H := by
  exact And.intro E.domainSmoothBoundaryClosed
    (And.intro E.subsolutionVanishesClosed
      (And.intro E.strictInequalityAtBoundaryClosed E.hopfConclusionClosed))

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse

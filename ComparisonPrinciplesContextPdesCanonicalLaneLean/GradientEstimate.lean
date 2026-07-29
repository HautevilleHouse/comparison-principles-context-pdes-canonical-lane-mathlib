import ComparisonPrinciplesContextPdesCanonicalLaneLean.ViscositySolution

/-!
# Gradient Estimate Package

This module formalizes gradient estimates used in comparison principles.
-/

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure GradientEstimatePackage {M : MaximumPrinciplePackage}
    {B : BarrierFunctionPackage M} {V : ViscositySolutionPackage B} where
  lipschitzEstimate : Prop
  interiorGradientBound : Prop
  boundaryGradientBound : Prop
  estimateUniform : Prop

structure GradientEstimateEvidence {M : MaximumPrinciplePackage}
    {B : BarrierFunctionPackage M} {V : ViscositySolutionPackage B}
    (G : GradientEstimatePackage V) where
  lipschitzEstimateClosed : G.lipschitzEstimate
  interiorGradientBoundClosed : G.interiorGradientBound
  boundaryGradientBoundClosed : G.boundaryGradientBound
  estimateUniformClosed : G.estimateUniform

def GradientEstimateClosed {M : MaximumPrinciplePackage}
    {B : BarrierFunctionPackage M} {V : ViscositySolutionPackage B}
    (G : GradientEstimatePackage V) : Prop :=
  G.lipschitzEstimate ∧ G.interiorGradientBound ∧ G.boundaryGradientBound ∧ G.estimateUniform

theorem gradient_estimate_closed_from_evidence {M : MaximumPrinciplePackage}
    {B : BarrierFunctionPackage M} {V : ViscositySolutionPackage B}
    (G : GradientEstimatePackage V) (E : GradientEstimateEvidence G) :
    GradientEstimateClosed G := by
  exact And.intro E.lipschitzEstimateClosed
    (And.intro E.interiorGradientBoundClosed
      (And.intro E.boundaryGradientBoundClosed E.estimateUniformClosed))

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse

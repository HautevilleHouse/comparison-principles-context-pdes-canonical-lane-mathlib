import ComparisonPrinciplesContextPdesCanonicalLaneLean.ComparisonFunction

/-!
# Uniqueness and Stability via Comparison
-/

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure UniquenessStabilityPackage
    {M : MaximumPrinciplePackage} {C : ComparisonFunctionPackage M} where
  solutionUniqueness : Prop
  continuousDependence : Prop
  lipschitzStability : Prop
  asymptoticStability : Prop

structure UniquenessStabilityEvidence
    {M : MaximumPrinciplePackage} {C : ComparisonFunctionPackage M}
    (U : UniquenessStabilityPackage M C) where
  solutionUniquenessClosed : U.solutionUniqueness
  continuousDependenceClosed : U.continuousDependence
  lipschitzStabilityClosed : U.lipschitzStability
  asymptoticStabilityClosed : U.asymptoticStability

def UniquenessStabilityClosed
    {M : MaximumPrinciplePackage} {C : ComparisonFunctionPackage M}
    (U : UniquenessStabilityPackage M C) : Prop :=
  U.solutionUniqueness ∧ U.continuousDependence ∧
  U.lipschitzStability ∧ U.asymptoticStability

theorem uniqueness_stability_closed_from_evidence
    {M : MaximumPrinciplePackage} {C : ComparisonFunctionPackage M}
    (U : UniquenessStabilityPackage M C)
    (E : UniquenessStabilityEvidence U) : UniquenessStabilityClosed U := by
  exact And.intro E.solutionUniquenessClosed
    (And.intro E.continuousDependenceClosed
      (And.intro E.lipschitzStabilityClosed E.asymptoticStabilityClosed))

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
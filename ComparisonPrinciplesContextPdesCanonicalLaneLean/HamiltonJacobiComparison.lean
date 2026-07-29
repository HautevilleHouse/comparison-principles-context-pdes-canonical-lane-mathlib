import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure HamiltonJacobiComparison {H : HamiltonJacobiPackage} where
  viscositySubsolution : Prop
  viscositySupersolution : Prop
  compatibilityCondition : Prop
  convexHamiltonian : Prop
  comparisonResult : Prop

structure HamiltonJacobiComparisonEvidence {H : HamiltonJacobiPackage} (HJ : HamiltonJacobiComparison H) where
  viscositySubsolutionClosed : HJ.viscositySubsolution
  viscositySupersolutionClosed : HJ.viscositySupersolution
  compatibilityConditionClosed : HJ.compatibilityCondition
  convexHamiltonianClosed : HJ.convexHamiltonian
  comparisonResultClosed : HJ.comparisonResult

def HamiltonJacobiComparisonClosed {H : HamiltonJacobiPackage} (HJ : HamiltonJacobiComparison H) : Prop :=
  HJ.viscositySubsolution ∧ HJ.viscositySupersolution ∧
  HJ.compatibilityCondition ∧ HJ.convexHamiltonian ∧ HJ.comparisonResult

theorem hamilton_jacobi_comparison_closed_from_evidence {H : HamiltonJacobiPackage}
    (HJ : HamiltonJacobiComparison H) (E : HamiltonJacobiComparisonEvidence HJ) :
    HamiltonJacobiComparisonClosed HJ := by
  exact And.intro E.viscositySubsolutionClosed
    (And.intro E.viscositySupersolutionClosed
      (And.intro E.compatibilityConditionClosed
        (And.intro E.convexHamiltonianClosed E.comparisonResultClosed)))

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
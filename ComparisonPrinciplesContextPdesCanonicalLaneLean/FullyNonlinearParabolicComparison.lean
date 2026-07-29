import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure FullyNonlinearParabolicComparison {P : ParabolicPackage} where
  parabolicSupersolution : Prop
  parabolicSubsolution : Prop
  degenerateEllipticity : Prop
  comparisonPrinciple : Prop
  boundaryCondition : Prop

structure FullyNonlinearParabolicComparisonEvidence {P : ParabolicPackage}
    (F : FullyNonlinearParabolicComparison P) where
  parabolicSupersolutionClosed : F.parabolicSupersolution
  parabolicSubsolutionClosed : F.parabolicSubsolution
  degenerateEllipticityClosed : F.degenerateEllipticity
  comparisonPrincipleClosed : F.comparisonPrinciple
  boundaryConditionClosed : F.boundaryCondition

def FullyNonlinearParabolicComparisonClosed {P : ParabolicPackage}
    (F : FullyNonlinearParabolicComparison P) : Prop :=
  F.parabolicSupersolution ∧ F.parabolicSubsolution ∧
  F.degenerateEllipticity ∧ F.comparisonPrinciple ∧ F.boundaryCondition

theorem fully_nonlinear_parabolic_comparison_closed_from_evidence {P : ParabolicPackage}
    (F : FullyNonlinearParabolicComparison P) (E : FullyNonlinearParabolicComparisonEvidence F) :
    FullyNonlinearParabolicComparisonClosed F := by
  exact And.intro E.parabolicSupersolutionClosed
    (And.intro E.parabolicSubsolutionClosed
      (And.intro E.degenerateEllipticityClosed
        (And.intro E.comparisonPrincipleClosed E.boundaryConditionClosed)))

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
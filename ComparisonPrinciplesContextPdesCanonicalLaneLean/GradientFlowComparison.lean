import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure GradientFlowComparison {G : GradientFlowPackage} where
  energyFunctional : Prop
  gradientFlowEquation : Prop
  comparisonAlongFlow : Prop
  convexPotential : Prop
  uniquenessOfFlow : Prop

structure GradientFlowComparisonEvidence {G : GradientFlowPackage} (GF : GradientFlowComparison G) where
  energyFunctionalClosed : GF.energyFunctional
  gradientFlowEquationClosed : GF.gradientFlowEquation
  comparisonAlongFlowClosed : GF.comparisonAlongFlow
  convexPotentialClosed : GF.convexPotential
  uniquenessOfFlowClosed : GF.uniquenessOfFlow

def GradientFlowComparisonClosed {G : GradientFlowPackage} (GF : GradientFlowComparison G) : Prop :=
  GF.energyFunctional ∧ GF.gradientFlowEquation ∧
  GF.comparisonAlongFlow ∧ GF.convexPotential ∧ GF.uniquenessOfFlow

theorem gradient_flow_comparison_closed_from_evidence {G : GradientFlowPackage}
    (GF : GradientFlowComparison G) (E : GradientFlowComparisonEvidence GF) :
    GradientFlowComparisonClosed GF := by
  exact And.intro E.energyFunctionalClosed
    (And.intro E.gradientFlowEquationClosed
      (And.intro E.comparisonAlongFlowClosed
        (And.intro E.convexPotentialClosed E.uniquenessOfFlowClosed)))

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
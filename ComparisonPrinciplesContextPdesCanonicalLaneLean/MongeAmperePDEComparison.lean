import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure MongeAmpereComparison {MA : MongeAmperePackage} where
  convexEnvelope : Prop
  dirichletCondition : Prop
  comparisonInequality : Prop
  uniquenessResult : Prop

structure MongeAmpereComparisonEvidence {MA : MongeAmperePackage} (MAComp : MongeAmpereComparison MA) where
  convexEnvelopeClosed : MAComp.convexEnvelope
  dirichletConditionClosed : MAComp.dirichletCondition
  comparisonInequalityClosed : MAComp.comparisonInequality
  uniquenessResultClosed : MAComp.uniquenessResult

def MongeAmpereComparisonClosed {MA : MongeAmperePackage} (MAComp : MongeAmpereComparison MA) : Prop :=
  MAComp.convexEnvelope ∧ MAComp.dirichletCondition ∧
  MAComp.comparisonInequality ∧ MAComp.uniquenessResult

theorem monge_ampere_comparison_closed_from_evidence {MA : MongeAmperePackage}
    (MAComp : MongeAmpereComparison MA) (E : MongeAmpereComparisonEvidence MAComp) :
    MongeAmpereComparisonClosed MAComp := by
  exact And.intro E.convexEnvelopeClosed
    (And.intro E.dirichletConditionClosed
      (And.intro E.comparisonInequalityClosed E.uniquenessResultClosed))

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
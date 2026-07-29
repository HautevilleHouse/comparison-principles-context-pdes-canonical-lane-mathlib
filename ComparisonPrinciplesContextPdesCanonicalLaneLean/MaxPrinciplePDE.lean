import canonicalLaneMathlib.AdmissibleClass
import ComparisonPrinciplesContextPdesCanonicalLaneLean.ComparisonAdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure MaxPrinciplePackage where
  parabolicOperator : Type u
  subsolutionClass : Type v
  maximumPrincipleStatement : Prop
  boundaryCondition : Prop
  holderRegularity : Prop

structure MaxPrincipleEvidence (M : MaxPrinciplePackage) where
  maximumPrincipleClosed : M.maximumPrincipleStatement
  boundaryConditionClosed : M.boundaryCondition
  holderRegularityClosed : M.holderRegularity

def MaxPrincipleClosed (M : MaxPrinciplePackage) : Prop :=
  M.maximumPrincipleStatement ∧ M.boundaryCondition ∧ M.holderRegularity

theorem max_principle_closed_from_evidence (M : MaxPrinciplePackage) (E : MaxPrincipleEvidence M) :
    MaxPrincipleClosed M := by
  exact And.intro E.maximumPrincipleClosed (And.intro E.boundaryConditionClosed E.holderRegularityClosed)

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
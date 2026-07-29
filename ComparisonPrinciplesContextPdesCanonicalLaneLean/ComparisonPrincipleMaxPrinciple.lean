import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure ComparisonPrincipleClass {F : PDEContextPackage} where
  supersolutionClass : Prop
  subsolutionClass : Prop
  comparisonInequality : Prop
  boundaryConditionCompatible : Prop

structure ComparisonPrincipleEvidence {F : PDEContextPackage} (C : ComparisonPrincipleClass F) where
  supersolutionClassClosed : C.supersolutionClass
  subsolutionClassClosed : C.subsolutionClass
  comparisonInequalityClosed : C.comparisonInequality
  boundaryConditionCompatibleClosed : C.boundaryConditionCompatible

def ComparisonPrincipleClosed {F : PDEContextPackage} (C : ComparisonPrincipleClass F) : Prop :=
  C.supersolutionClass ∧ C.subsolutionClass ∧
  C.comparisonInequality ∧ C.boundaryConditionCompatible

theorem comparison_principle_closed_from_evidence {F : PDEContextPackage}
    (C : ComparisonPrincipleClass F) (E : ComparisonPrincipleEvidence F) :
    ComparisonPrincipleClosed C := by
  exact And.intro E.supersolutionClassClosed
    (And.intro E.subsolutionClassClosed
      (And.intro E.comparisonInequalityClosed E.boundaryConditionCompatibleClosed))

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
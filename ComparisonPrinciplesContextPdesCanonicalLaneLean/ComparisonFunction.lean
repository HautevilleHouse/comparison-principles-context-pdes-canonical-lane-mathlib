import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure ComparisonFunctionPackage (M : Type u) [TopologicalSpace M] [PartialOrder M] where
  barrierFamily : M → (M → ℝ)
  supersolutionProperty : Prop
  comparisonPrinciple : Prop
  viscosityCharacterization : Prop

structure ComparisonFunctionEvidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ComparisonFunctionPackage M) where
  supersolutionPropertyClosed : Pkg.supersolutionProperty
  comparisonPrincipleClosed : Pkg.comparisonPrinciple
  viscosityCharacterizationClosed : Pkg.viscosityCharacterization

def ComparisonFunctionClosed (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ComparisonFunctionPackage M) : Prop :=
  Pkg.supersolutionProperty ∧ Pkg.comparisonPrinciple ∧ Pkg.viscosityCharacterization

theorem comparison_function_closed_from_evidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ComparisonFunctionPackage M) (E : ComparisonFunctionEvidence M Pkg) :
    ComparisonFunctionClosed M Pkg := by
  exact And.intro E.supersolutionPropertyClosed
    (And.intro E.comparisonPrincipleClosed E.viscosityCharacterizationClosed)

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
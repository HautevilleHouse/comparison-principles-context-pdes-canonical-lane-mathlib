import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure ParabolicComparisonPackage (M : Type u) [TopologicalSpace M] [PartialOrder M] where
  timeInterval : Set ℝ
  spaceDomain : Set M
  parabolicOperator : (M → ℝ) → (M → ℝ)
  initialCondition : M → ℝ
  boundaryCondition : M → ℝ
  parabolicComparisonPrinciple : Prop
  uniqueness : Prop

structure ParabolicComparisonEvidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ParabolicComparisonPackage M) where
  parabolicComparisonPrincipleClosed : Pkg.parabolicComparisonPrinciple
  uniquenessClosed : Pkg.uniqueness

def ParabolicComparisonClosed (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ParabolicComparisonPackage M) : Prop :=
  Pkg.parabolicComparisonPrinciple ∧ Pkg.uniqueness

theorem parabolic_comparison_closed_from_evidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ParabolicComparisonPackage M) (E : ParabolicComparisonEvidence M Pkg) :
    ParabolicComparisonClosed M Pkg := by
  exact And.intro E.parabolicComparisonPrincipleClosed E.uniquenessClosed

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
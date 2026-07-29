import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure ObstacleProblemPackage (M : Type u) [TopologicalSpace M] [PartialOrder M] where
  obstacle : M → ℝ
  differentialOperator : (M → ℝ) → (M → ℝ)
  comparisonPrinciple : Prop
  existence : Prop
  regularity : Prop

structure ObstacleProblemEvidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ObstacleProblemPackage M) where
  comparisonPrincipleClosed : Pkg.comparisonPrinciple
  existenceClosed : Pkg.existence
  regularityClosed : Pkg.regularity

def ObstacleProblemClosed (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ObstacleProblemPackage M) : Prop :=
  Pkg.comparisonPrinciple ∧ Pkg.existence ∧ Pkg.regularity

theorem obstacle_problem_closed_from_evidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ObstacleProblemPackage M) (E : ObstacleProblemEvidence M Pkg) :
    ObstacleProblemClosed M Pkg := by
  exact And.intro E.comparisonPrincipleClosed
    (And.intro E.existenceClosed E.regularityClosed)

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
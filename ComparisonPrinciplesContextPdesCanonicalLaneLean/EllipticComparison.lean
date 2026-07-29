import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure EllipticComparisonPackage (M : Type u) [TopologicalSpace M] [PartialOrder M] where
  domain : Set M
  ellipticOperator : (M → ℝ) → (M → ℝ)
  boundaryCondition : M → ℝ
  ellipticComparisonPrinciple : Prop
  strongMaximumPrinciple : Prop
  uniqueness : Prop

structure EllipticComparisonEvidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : EllipticComparisonPackage M) where
  ellipticComparisonPrincipleClosed : Pkg.ellipticComparisonPrinciple
  strongMaximumPrincipleClosed : Pkg.strongMaximumPrinciple
  uniquenessClosed : Pkg.uniqueness

def EllipticComparisonClosed (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : EllipticComparisonPackage M) : Prop :=
  Pkg.ellipticComparisonPrinciple ∧ Pkg.strongMaximumPrinciple ∧ Pkg.uniqueness

theorem elliptic_comparison_closed_from_evidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : EllipticComparisonPackage M) (E : EllipticComparisonEvidence M Pkg) :
    EllipticComparisonClosed M Pkg := by
  exact And.intro E.ellipticComparisonPrincipleClosed
    (And.intro E.strongMaximumPrincipleClosed E.uniquenessClosed)

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
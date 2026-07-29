import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure MaximumPrinciplePackage (M : Type u) [TopologicalSpace M] [PartialOrder M] where
  domain : Set M
  domainOpen : IsOpen domain
  domainConnected : ConnectedSpace domain
  parabolicOperator : (M → ℝ) → (M → ℝ)
  ellipticPart : Prop
  lowerOrderTerms : Prop
  maximumPrincipleHolds : Prop

structure MaximumPrincipleEvidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : MaximumPrinciplePackage M) where
  domainOpenClosed : Pkg.domainOpen
  domainConnectedClosed : Pkg.domainConnected
  maximumPrincipleHoldsClosed : Pkg.maximumPrincipleHolds

def MaximumPrincipleClosed (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : MaximumPrinciplePackage M) : Prop :=
  Pkg.maximumPrincipleHolds

theorem maximum_principle_closed_from_evidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : MaximumPrinciplePackage M) (E : MaximumPrincipleEvidence M Pkg) :
    MaximumPrincipleClosed M Pkg := by
  exact E.maximumPrincipleHoldsClosed

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
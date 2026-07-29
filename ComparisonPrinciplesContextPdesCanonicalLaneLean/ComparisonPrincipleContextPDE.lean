import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure ComparisonPrincipleContext where
  domain : Type u
  operator : Type v
  subsolution : Type w
  supersolution : Type x
  maximumPrincipleHolds : Prop
  hopfLemmaHolds : Prop
  strongMaximumPrincipleHolds : Prop

structure ComparisonPrincipleContextEvidence (C : ComparisonPrincipleContext) where
  maximumPrincipleHoldsClosed : C.maximumPrincipleHolds
  hopfLemmaHoldsClosed : C.hopfLemmaHolds
  strongMaximumPrincipleHoldsClosed : C.strongMaximumPrincipleHolds

def ComparisonPrincipleContextClosed (C : ComparisonPrincipleContext) : Prop :=
  C.maximumPrincipleHolds ∧ C.hopfLemmaHolds ∧ C.strongMaximumPrincipleHolds

theorem comparison_principle_context_closed_from_evidence (C : ComparisonPrincipleContext) (E : ComparisonPrincipleContextEvidence C) :
    ComparisonPrincipleContextClosed C := by
  exact And.intro E.maximumPrincipleHoldsClosed (And.intro E.hopfLemmaHoldsClosed E.strongMaximumPrincipleHoldsClosed)

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass
import ComparisonPrinciplesContextPdesCanonicalLaneLean.ComparisonFunction

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure PerronMethodPackage {M : MaxPrinciplePackage} {C : ComparisonFunctionPackage M} where
  subharmonicFamily : Type u
  perronSolution : Type v
  existenceResult : Prop
  regularityResult : Prop

structure PerronMethodEvidence {M : MaxPrinciplePackage} {C : ComparisonFunctionPackage M} (P : PerronMethodPackage M C) where
  existenceClosed : P.existenceResult
  regularityClosed : P.regularityResult

def PerronMethodClosed {M : MaxPrinciplePackage} {C : ComparisonFunctionPackage M} (P : PerronMethodPackage M C) : Prop :=
  P.existenceResult ∧ P.regularityResult

theorem perron_method_closed_from_evidence {M : MaxPrinciplePackage} {C : ComparisonFunctionPackage M} (P : PerronMethodPackage M C) (E : PerronMethodEvidence P) :
    PerronMethodClosed P := by
  exact And.intro E.existenceClosed E.regularityClosed

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
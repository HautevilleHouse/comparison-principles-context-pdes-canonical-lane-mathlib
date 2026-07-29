import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure AdmissibleClass where
  object : ComparisonAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  comparisonWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
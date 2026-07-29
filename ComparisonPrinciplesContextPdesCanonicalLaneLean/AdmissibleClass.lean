import ComparisonPrinciplesContextPdesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure AdmissibleClass where
  object : ComparisonAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ComparisonWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse

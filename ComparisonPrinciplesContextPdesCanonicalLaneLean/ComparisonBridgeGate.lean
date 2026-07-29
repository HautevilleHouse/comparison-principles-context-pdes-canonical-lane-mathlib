import canonicalLaneMathlib.AdmissibleClass
import ComparisonPrinciplesContextPdesCanonicalLaneLean.ComparisonAdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  comparisonWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
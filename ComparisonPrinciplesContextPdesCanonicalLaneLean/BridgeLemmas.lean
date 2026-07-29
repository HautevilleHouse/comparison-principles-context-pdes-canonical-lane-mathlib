import ComparisonPrinciplesContextPdesCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ComparisonWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse

import ComparisonPrinciplesContextPdesCanonicalLaneLean.ReviewerBridge

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  pdeConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

deriving Repr, DecidableEq

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
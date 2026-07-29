import ComparisonPrinciplesContextPdesCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ComparisonSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ComparisonAdmittedObject where
  space : ComparisonSpace
  parabolicDomain : Prop
  comparisonPrincipleHolds : Prop
  barrierConstruction : Prop
  conclusion : comparisonPrincipleHolds

structure ComparisonEndgameState where
  object : ComparisonAdmittedObject

def ComparisonWitnessClosed (O : ComparisonAdmittedObject) : Prop :=
  O.comparisonPrincipleHolds

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse

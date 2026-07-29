import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure BarrierFunction where
  domain : Type u
  operator : Type v
  barrierExists : Prop
  boundaryRegularity : Prop
  interiorRegularity : Prop
  perronMethodApplicable : Prop

structure BarrierFunctionEvidence (B : BarrierFunction) where
  barrierExistsClosed : B.barrierExists
  boundaryRegularityClosed : B.boundaryRegularity
  interiorRegularityClosed : B.interiorRegularity
  perronMethodApplicableClosed : B.perronMethodApplicable

def BarrierFunctionClosed (B : BarrierFunction) : Prop :=
  B.barrierExists ∧ B.boundaryRegularity ∧ B.interiorRegularity ∧ B.perronMethodApplicable

theorem barrier_function_closed_from_evidence (B : BarrierFunction) (E : BarrierFunctionEvidence B) :
    BarrierFunctionClosed B := by
  exact And.intro E.barrierExistsClosed (And.intro E.boundaryRegularityClosed (And.intro E.interiorRegularityClosed E.perronMethodApplicableClosed))

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse

import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ComparisonPrinciplesContextPdesCanonicalLaneLean

structure ViscositySolutionPackage (M : Type u) [TopologicalSpace M] [PartialOrder M] where
  equation : (M → ℝ) → (M → ℝ)
  continuousFunctions : Type
  viscositySubsolution : Prop
  viscositySupersolution : Prop
  solutionDefined : Prop

structure ViscositySolutionEvidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ViscositySolutionPackage M) where
  viscositySubsolutionClosed : Pkg.viscositySubsolution
  viscositySupersolutionClosed : Pkg.viscositySupersolution
  solutionDefinedClosed : Pkg.solutionDefined

def ViscositySolutionClosed (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ViscositySolutionPackage M) : Prop :=
  Pkg.viscositySubsolution ∧ Pkg.viscositySupersolution ∧ Pkg.solutionDefined

theorem viscosity_solution_closed_from_evidence (M : Type u) [TopologicalSpace M] [PartialOrder M]
    (Pkg : ViscositySolutionPackage M) (E : ViscositySolutionEvidence M Pkg) :
    ViscositySolutionClosed M Pkg := by
  exact And.intro E.viscositySubsolutionClosed
    (And.intro E.viscositySupersolutionClosed E.solutionDefinedClosed)

end ComparisonPrinciplesContextPdesCanonicalLaneLean
end HautevilleHouse
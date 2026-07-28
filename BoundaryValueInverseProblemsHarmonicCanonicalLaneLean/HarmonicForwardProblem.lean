import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure HarmonicForwardPackage where
  domain : Type u
  boundary : Type v
  harmonicFunction : Type w
  boundaryData : Type x
  laplaceEquation : Prop
  boundaryCondition : Prop
  wellPosedness : Prop

structure HarmonicForwardEvidence (P : HarmonicForwardPackage) where
  laplaceEquationClosed : P.laplaceEquation
  boundaryConditionClosed : P.boundaryCondition
  wellPosednessClosed : P.wellPosedness

def HarmonicForwardClosed (P : HarmonicForwardPackage) : Prop :=
  P.laplaceEquation ∧ P.boundaryCondition ∧ P.wellPosedness

theorem harmonic_forward_closed_from_evidence (P : HarmonicForwardPackage) (E : HarmonicForwardEvidence P) :
    HarmonicForwardClosed P := by
  exact And.intro E.laplaceEquationClosed (And.intro E.boundaryConditionClosed E.wellPosednessClosed)

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
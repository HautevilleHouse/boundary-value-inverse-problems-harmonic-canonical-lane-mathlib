import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.HarmonicBoundaryData

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure InversePotentialProblemPackage (C : CauchyDataPackage) where
  sourceTerm : Type u
  uniqueRecovery : Prop
  stabilityEstimate : Prop

structure InversePotentialEvidence {C : CauchyDataPackage} (P : InversePotentialProblemPackage C) where
  uniqueRecoveryClosed : P.uniqueRecovery
  stabilityEstimateClosed : P.stabilityEstimate

def InversePotentialClosed {C : CauchyDataPackage} (P : InversePotentialProblemPackage C) : Prop :=
  P.uniqueRecovery ∧ P.stabilityEstimate

theorem inverse_potential_closed_from_evidence {C : CauchyDataPackage} (P : InversePotentialProblemPackage C) (E : InversePotentialEvidence P) : InversePotentialClosed P :=
  And.intro E.uniqueRecoveryClosed E.stabilityEstimateClosed

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse

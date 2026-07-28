import canonicalLaneMathlib.GateLemmas
import HautevilleHouse.BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
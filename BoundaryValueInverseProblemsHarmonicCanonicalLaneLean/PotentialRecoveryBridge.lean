import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.DomainObjects
import HautevilleHouse.BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.InversePotentialProblem

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse

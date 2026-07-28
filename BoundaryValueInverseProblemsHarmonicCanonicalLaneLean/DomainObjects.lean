import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure HarmonicDomain where
  carrier : Type
  topology : TopologicalSpace carrier

structure AdmittedHarmonicObject where
  domain : HarmonicDomain
  boundaryCondition : Prop
  interiorData : Prop
  conclusion : boundaryCondition ∧ interiorData

structure AdmissibleClass where
  object : AdmittedHarmonicObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse

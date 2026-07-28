import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure HarmonicBoundaryData where
  domain : Type
  boundary : Type
  domainTopology : TopologicalSpace domain
  boundaryTopology : TopologicalSpace boundary
  laplacian : Prop
  boundaryValues : Prop

structure HarmonicAdmittedObject where
  data : HarmonicBoundaryData
  dirichletProblemSolvable : Prop
  neumannProblemSolvable : Prop
  inverseProblemWellPosed : Prop
  conclusion : dirichletProblemSolvable ∧ neumannProblemSolvable ∧ inverseProblemWellPosed

structure AdmissibleClass where
  object : HarmonicAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def HarmonicWitnessClosed (O : HarmonicAdmittedObject) : Prop :=
  O.conclusion

def admittedClosure (A : AdmissibleClass) : Prop :=
  HarmonicWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
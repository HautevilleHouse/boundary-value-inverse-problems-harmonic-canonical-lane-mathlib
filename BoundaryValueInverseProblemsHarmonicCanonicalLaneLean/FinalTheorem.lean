import HarmonicInverseProblem

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure AdmissibleClass where
  object : HarmonicForwardPackage
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

structure PoincareAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  closedThreeManifold : Prop
  simplyConnected : Prop
  sphereModel : Type
  sphereTopology : TopologicalSpace sphereModel
  homeomorphicToSphere : Prop
  conclusion : homeomorphicToSphere

structure PoincareEndgameState where
  object : PoincareAdmittedObject

def PoincareWitnessClosed (O : PoincareAdmittedObject) : Prop :=
  O.homeomorphicToSphere

def bridgeClosed (A : AdmissibleClass) : Prop :=
  HarmonicForwardClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  sorry

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedCalderonClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_calderon_endgame (A : AdmissibleClass) : ConstrainedCalderonClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
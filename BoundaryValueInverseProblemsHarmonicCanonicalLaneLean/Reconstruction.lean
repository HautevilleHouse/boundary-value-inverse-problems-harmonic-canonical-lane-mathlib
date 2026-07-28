import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure ReconstructionAlgorithm {Ω : Type*} [TopologicalSpace Ω] [CompactSpace Ω] [Manifold Ω 3] where
  inputData : Type
  outputConductivity : Type
  algorithmSteps : Prop
  convergenceProof : Prop
  implementationFeasible : Prop

def ReconstructionClosed (R : ReconstructionAlgorithm) : Prop :=
  R.convergenceProof ∧ R.implementationFeasible

theorem reconstruction_closed_from_proof (R : ReconstructionAlgorithm) (p : R.convergenceProof) (q : R.implementationFeasible) :
  ReconstructionClosed R := by
  exact And.intro p q

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
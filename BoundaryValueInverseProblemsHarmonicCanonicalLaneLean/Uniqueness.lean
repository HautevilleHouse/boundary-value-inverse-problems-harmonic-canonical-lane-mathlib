import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure UniquenessTheorem {Ω : Type*} [TopologicalSpace Ω] [CompactSpace Ω] [Manifold Ω 3] where
  targetConductivity : Set (Ω → ℝ)
  uniquenessCondition : Prop
  uniquenessStatement : Prop
  proofTerm : uniquenessStatement

def UniquenessClosed (U : UniquenessTheorem) : Prop :=
  U.uniquenessStatement

theorem uniqueness_closed_from_proof (U : UniquenessTheorem) : UniquenessClosed U := by
  exact U.proofTerm

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
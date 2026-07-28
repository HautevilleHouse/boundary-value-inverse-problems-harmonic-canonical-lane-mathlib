import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure StabilityEstimate {Ω : Type*} [TopologicalSpace Ω] [CompactSpace Ω] [Manifold Ω 3] where
  conductivitySpace : Set (Ω → ℝ)
  measurementSpace : Set (Ω → ℝ)
  modulsOfContinuity : (ℝ → ℝ) → Prop
  stabilityInequality : Prop
  proofTerm : stabilityInequality

def StabilityClosed (S : StabilityEstimate) : Prop :=
  S.stabilityInequality

theorem stability_closed_from_proof (S : StabilityEstimate) : StabilityClosed S := by
  exact S.proofTerm

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
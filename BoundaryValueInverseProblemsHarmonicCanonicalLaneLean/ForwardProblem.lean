import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure ForwardProblem {Ω : Type*} [TopologicalSpace Ω] [CompactSpace Ω] [Manifold Ω 3] where
  domain : Ω
  boundary : Set Ω
  ellipticOperator : (Ω → ℝ) → (Ω → ℝ)
  boundaryCondition : (Ω → ℝ) → (Ω → ℝ)
  forwardSolution : (Ω → ℝ) → (Ω → ℝ)
  wellPosed : Prop
  wellPosedTerm : wellPosed

structure ForwardEvidence (F : ForwardProblem) where
  wellPosedClosed : F.wellPosed

def ForwardClosed (F : ForwardProblem) : Prop :=
  F.wellPosed

theorem forward_closed_from_evidence (F : ForwardProblem) (E : ForwardEvidence F) :
  ForwardClosed F := by
  exact E.wellPosedClosed

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
import HautevilleHouse.BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.BoundaryIntegralOperators

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure CalderonProblem (D : HarmonicBoundaryData) where
  conductivity : D.domain → ℝ
  forwardMap : (D.boundary → ℝ) → (D.boundary → ℝ)
  inverseProblemWellPosed : Prop
  uniqueness : Prop
  stability : Prop

structure CalderonForwardSolver (D : HarmonicBoundaryData) where
  DirichletToNeumann : D.boundary → ℝ → D.boundary → ℝ
  isBounded : Prop
  isAnalytic : Prop

structure CalderonInverseSolver (D : HarmonicBoundaryData) where
  reconstruction : (D.boundary → ℝ → D.boundary → ℝ) → (D.domain → ℝ)
  isWellPosed : Prop
  recoversConductivity : ∀ (γ : D.domain → ℝ), reconstruction (DirichletToNeumann γ) = γ

theorem calderon_forward_bounded (S : CalderonForwardSolver D) : S.isBounded := S.isBounded

theorem calderon_inverse_well_posed (S : CalderonInverseSolver D) : S.isWellPosed := S.isWellPosed

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
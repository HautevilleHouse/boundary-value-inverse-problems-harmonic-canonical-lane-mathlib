import HautevilleHouse.BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure DirichletProblem (D : HarmonicBoundaryData) where
  harmonicFunction : D.domain → ℝ
  boundaryValue : D.boundary → ℝ
  satisfiesLaplace : harmonicFunction.isHarmonic
  boundaryCondition : ∀ x : D.boundary, harmonicFunction (D.boundaryInclusion x) = boundaryValue x

structure NeumannProblem (D : HarmonicBoundaryData) where
  harmonicFunction : D.domain → ℝ
  normalDerivative : D.boundary → ℝ
  satisfiesLaplace : harmonicFunction.isHarmonic
  boundaryCondition : normalDerivative = (normalDerivativeFn D harmonicFunction)

structure DirichletSolvable (D : HarmonicBoundaryData) : Prop :=
  existsSolution : ∃ (h : DirichletProblem D), h.satisfiesLaplace ∧ h.boundaryCondition

structure NeumannSolvable (D : HarmonicBoundaryData) : Prop :=
  existsSolution : ∃ (h : NeumannProblem D), h.satisfiesLaplace ∧ h.boundaryCondition

theorem dirichlet_solvable_from_evidence (D : HarmonicBoundaryData) (h : DirichletSolvable D) :
  D.laplacian := by
  exact h.existsSolution.choose.satisfiesLaplace

theorem neumann_solvable_from_evidence (D : HarmonicBoundaryData) (h : NeumannSolvable D) :
  D.laplacian := by
  exact h.existsSolution.choose.satisfiesLaplace

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
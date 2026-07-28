import HautevilleHouse.BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.HarmonicBoundaryData

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure InverseProblemPackage (D : HarmonicBoundaryData) where
  unknownParameter : Type u
  forwardMap : unknownParameter → D.domain → ℝ
  measuredBoundaryData : D.boundary → ℝ
  uniquenessOfInverse : Prop
  stabilityEstimate : Prop
  reconstructionAlgorithm : Prop

structure InverseProblemEvidence {D : HarmonicBoundaryData}
    (P : InverseProblemPackage D) where
  uniquenessOfInverseClosed : P.uniquenessOfInverse
  stabilityEstimateClosed : P.stabilityEstimate
  reconstructionAlgorithmClosed : P.reconstructionAlgorithm

def InverseProblemClosed {D : HarmonicBoundaryData}
    (P : InverseProblemPackage D) : Prop :=
  P.uniquenessOfInverse ∧ P.stabilityEstimate ∧ P.reconstructionAlgorithm

theorem inverse_problem_closed_from_evidence {D : HarmonicBoundaryData}
    (P : InverseProblemPackage D) (E : InverseProblemEvidence P) :
    InverseProblemClosed P := by
  exact And.intro E.uniquenessOfInverseClosed
    (And.intro E.stabilityEstimateClosed E.reconstructionAlgorithmClosed)

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
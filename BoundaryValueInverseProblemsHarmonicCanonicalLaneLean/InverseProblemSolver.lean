import BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.BoundaryMeasurement

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure InverseProblemSolverPackage {H : HarmonicInverseProblemPackage}
    {P : PotentialTheoryPackage H} {B : BoundaryMeasurementPackage P} where
  iterativeMethod : Prop
  convergenceAnalysis : Prop
  regularizationParameter : Prop
  reconstructionError : Prop

structure InverseProblemSolverEvidence {H : HarmonicInverseProblemPackage}
    {P : PotentialTheoryPackage H} {B : BoundaryMeasurementPackage P}
    (S : InverseProblemSolverPackage B) where
  iterativeMethodClosed : S.iterativeMethod
  convergenceAnalysisClosed : S.convergenceAnalysis
  regularizationParameterClosed : S.regularizationParameter
  reconstructionErrorClosed : S.reconstructionError

def InverseProblemSolverClosed {H : HarmonicInverseProblemPackage}
    {P : PotentialTheoryPackage H} {B : BoundaryMeasurementPackage P}
    (S : InverseProblemSolverPackage B) : Prop :=
  S.iterativeMethod ∧ S.convergenceAnalysis ∧ S.regularizationParameter ∧ S.reconstructionError

theorem inverse_problem_solver_closed_from_evidence
    {H : HarmonicInverseProblemPackage} {P : PotentialTheoryPackage H}
    {B : BoundaryMeasurementPackage P} (S : InverseProblemSolverPackage B)
    (E : InverseProblemSolverEvidence S) : InverseProblemSolverClosed S := by
  exact And.intro E.iterativeMethodClosed
    (And.intro E.convergenceAnalysisClosed
      (And.intro E.regularizationParameterClosed E.reconstructionErrorClosed))

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
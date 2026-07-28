import BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.PotentialTheory

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure BoundaryMeasurementPackage {H : HarmonicInverseProblemPackage}
    (P : PotentialTheoryPackage H) where
  dirichletToNeumann : Prop
  cauchyData : Prop
  measurementError : Prop
  regularization : Prop

structure BoundaryMeasurementEvidence {H : HarmonicInverseProblemPackage}
    {P : PotentialTheoryPackage H} (B : BoundaryMeasurementPackage P) where
  dirichletToNeumannClosed : B.dirichletToNeumann
  cauchyDataClosed : B.cauchyData
  measurementErrorClosed : B.measurementError
  regularizationClosed : B.regularization

def BoundaryMeasurementClosed {H : HarmonicInverseProblemPackage}
    {P : PotentialTheoryPackage H} (B : BoundaryMeasurementPackage P) : Prop :=
  B.dirichletToNeumann ∧ B.cauchyData ∧ B.measurementError ∧ B.regularization

theorem boundary_measurement_closed_from_evidence
    {H : HarmonicInverseProblemPackage} {P : PotentialTheoryPackage H}
    (B : BoundaryMeasurementPackage P) (E : BoundaryMeasurementEvidence B) :
    BoundaryMeasurementClosed B := by
  exact And.intro E.dirichletToNeumannClosed
    (And.intro E.cauchyDataClosed
      (And.intro E.measurementErrorClosed E.regularizationClosed))

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
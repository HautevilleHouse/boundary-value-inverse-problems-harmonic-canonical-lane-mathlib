import HautevilleHouse.BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.StabilityEstimates

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure ReconstructionPackage {D : HarmonicBoundaryData}
    {P : InverseProblemPackage D} (S : StabilityPackage P) where
  iterativeMethod : Prop
  regularizationStrategy : Prop
  convergenceRate : Prop
  numericalImplementation : Prop

structure ReconstructionEvidence {D : HarmonicBoundaryData}
    {P : InverseProblemPackage D} {S : StabilityPackage P}
    (R : ReconstructionPackage S) where
  iterativeMethodClosed : R.iterativeMethod
  regularizationStrategyClosed : R.regularizationStrategy
  convergenceRateClosed : R.convergenceRate
  numericalImplementationClosed : R.numericalImplementation

def ReconstructionClosed {D : HarmonicBoundaryData}
    {P : InverseProblemPackage D} {S : StabilityPackage P}
    (R : ReconstructionPackage S) : Prop :=
  R.iterativeMethod ∧ R.regularizationStrategy ∧
  R.convergenceRate ∧ R.numericalImplementation

theorem reconstruction_closed_from_evidence {D : HarmonicBoundaryData}
    {P : InverseProblemPackage D} {S : StabilityPackage P}
    (R : ReconstructionPackage S) (E : ReconstructionEvidence R) :
    ReconstructionClosed R := by
  exact And.intro E.iterativeMethodClosed
    (And.intro E.regularizationStrategyClosed
      (And.intro E.convergenceRateClosed E.numericalImplementationClosed))

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
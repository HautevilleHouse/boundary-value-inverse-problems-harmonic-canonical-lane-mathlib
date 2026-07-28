import HautevilleHouse.BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.InverseProblemStatement

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure StabilityPackage {D : HarmonicBoundaryData}
    (P : InverseProblemPackage D) where
  lipschitzEstimate : Prop
  logarithmicEstimate : Prop
  conditionalWellPosedness : Prop
  dataMisfitBound : Prop

structure StabilityEvidence {D : HarmonicBoundaryData}
    {P : InverseProblemPackage D} (S : StabilityPackage P) where
  lipschitzEstimateClosed : S.lipschitzEstimate
  logarithmicEstimateClosed : S.logarithmicEstimate
  conditionalWellPosednessClosed : S.conditionalWellPosedness
  dataMisfitBoundClosed : S.dataMisfitBound

def StabilityClosed {D : HarmonicBoundaryData}
    {P : InverseProblemPackage D} (S : StabilityPackage P) : Prop :=
  S.lipschitzEstimate ∧ S.logarithmicEstimate ∧
  S.conditionalWellPosedness ∧ S.dataMisfitBound

theorem stability_closed_from_evidence {D : HarmonicBoundaryData}
    {P : InverseProblemPackage D} (S : StabilityPackage P)
    (E : StabilityEvidence S) : StabilityClosed S := by
  exact And.intro E.lipschitzEstimateClosed
    (And.intro E.logarithmicEstimateClosed
      (And.intro E.conditionalWellPosednessClosed E.dataMisfitBoundClosed))

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
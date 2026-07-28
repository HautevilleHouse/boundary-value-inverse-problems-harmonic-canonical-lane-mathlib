import BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.HarmonicInverseProblem

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure PotentialTheoryPackage (H : HarmonicInverseProblemPackage) where
  greenFunction : Prop
  layerPotentials : Prop
  integralEquations : Prop
  singularities : Prop

structure PotentialTheoryEvidence {H : HarmonicInverseProblemPackage}
    (P : PotentialTheoryPackage H) where
  greenFunctionClosed : P.greenFunction
  layerPotentialsClosed : P.layerPotentials
  integralEquationsClosed : P.integralEquations
  singularitiesClosed : P.singularities

def PotentialTheoryClosed {H : HarmonicInverseProblemPackage}
    (P : PotentialTheoryPackage H) : Prop :=
  P.greenFunction ∧ P.layerPotentials ∧ P.integralEquations ∧ P.singularities

theorem potential_theory_closed_from_evidence
    {H : HarmonicInverseProblemPackage} (P : PotentialTheoryPackage H)
    (E : PotentialTheoryEvidence P) : PotentialTheoryClosed P := by
  exact And.intro E.greenFunctionClosed
    (And.intro E.layerPotentialsClosed
      (And.intro E.integralEquationsClosed E.singularitiesClosed))

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
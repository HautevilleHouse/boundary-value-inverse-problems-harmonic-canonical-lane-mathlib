import BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.HarmonicForwardProblem

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure HarmonicInversePackage (P : HarmonicForwardPackage) where
  unknownCoefficient : Type x
  cauchyData : Type y
  uniqueness : Prop
  stability : Prop
  reconstruction : Prop

structure HarmonicInverseEvidence {P : HarmonicForwardPackage} (Q : HarmonicInversePackage P) where
  uniquenessClosed : Q.uniqueness
  stabilityClosed : Q.stability
  reconstructionClosed : Q.reconstruction

def HarmonicInverseClosed {P : HarmonicForwardPackage} (Q : HarmonicInversePackage P) : Prop :=
  Q.uniqueness ∧ Q.stability ∧ Q.reconstruction

theorem harmonic_inverse_closed_from_evidence {P : HarmonicForwardPackage} (Q : HarmonicInversePackage P) (E : HarmonicInverseEvidence Q) :
    HarmonicInverseClosed Q := by
  exact And.intro E.uniquenessClosed (And.intro E.stabilityClosed E.reconstructionClosed)

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
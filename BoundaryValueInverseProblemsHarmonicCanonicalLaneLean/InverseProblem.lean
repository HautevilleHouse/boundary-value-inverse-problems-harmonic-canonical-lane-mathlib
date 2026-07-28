import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure InverseProblem {Ω : Type*} [TopologicalSpace Ω] [CompactSpace Ω] [Manifold Ω 3] where
  forward : ForwardProblem
  dirichletToNeumannMap : (Ω → ℝ) → (Ω → ℝ) → Prop
  measuredData : Prop
  unknownConductivity : Prop
  inverseSolvability : Prop

structure InverseEvidence (I : InverseProblem) where
  dirichletToNeumannMapClosed : I.dirichletToNeumannMap
  measuredDataClosed : I.measuredData
  unknownConductivityClosed : I.unknownConductivity
  inverseSolvabilityClosed : I.inverseSolvability

def InverseClosed (I : InverseProblem) : Prop :=
  I.dirichletToNeumannMap ∧ I.measuredData ∧ I.unknownConductivity ∧ I.inverseSolvability

theorem inverse_closed_from_evidence (I : InverseProblem) (E : InverseEvidence I) :
  InverseClosed I := by
  exact And.intro E.dirichletToNeumannMapClosed
    (And.intro E.measuredDataClosed
      (And.intro E.unknownConductivityClosed E.inverseSolvabilityClosed))

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
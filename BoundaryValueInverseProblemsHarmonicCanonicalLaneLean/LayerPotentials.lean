import HautevilleHouse.BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure SingleLayerPotential (D : HarmonicBoundaryData) where
  density : D.boundary → ℝ
  potential : D.domain → ℝ
  integralRep : potential = (λ x => ∫ y in D.boundary, GreenFunction D.domain x y * density y ∂ D.boundaryMeasure)
  harmonicProperty : potential.isHarmonic

structure DoubleLayerPotential (D : HarmonicBoundaryData) where
  density : D.boundary → ℝ
  potential : D.domain → ℝ
  integralRep : potential = (λ x => ∫ y in D.boundary, (∂_n GreenFunction D.domain x y) * density y ∂ D.boundaryMeasure)
  harmonicProperty : potential.isHarmonic

structure LayerPotentialMapping (D : HarmonicBoundaryData) where
  singleLayer : SingleLayerPotential D
  doubleLayer : DoubleLayerPotential D
  jumpRelation : Prop

theorem single_layer_harmonic (S : SingleLayerPotential D) : S.potential.isHarmonic := S.harmonicProperty

theorem double_layer_harmonic (D : DoubleLayerPotential D) : D.potential.isHarmonic := D.harmonicProperty

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
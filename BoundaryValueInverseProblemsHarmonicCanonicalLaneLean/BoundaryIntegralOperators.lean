import HautevilleHouse.BoundaryValueInverseProblemsHarmonicCanonicalLaneLean.LayerPotentials

namespace HautevilleHouse
namespace BoundaryValueInverseProblemsHarmonicCanonicalLaneLean

structure BoundaryIntegralOperator (D : HarmonicBoundaryData) where
  domain : D.boundary → ℝ
  codomain : D.boundary → ℝ
  isLinear : Prop
  isCompact : Prop
  isInjective : Prop
  mappingProperty : Prop

structure SingleLayerOperator (D : HarmonicBoundaryData) extends BoundaryIntegralOperator D where
  kernel : D.boundary × D.boundary → ℝ
  kernelIsGreen : kernel = GreenFunction D.domain boundary
  spectralProperties : Prop

structure DoubleLayerOperator (D : HarmonicBoundaryData) extends BoundaryIntegralOperator D where
  kernel : D.boundary × D.boundary → ℝ
  kernelIsNormalDerivative : kernel = (∂_n GreenFunction D.domain boundary)
  spectralProperties : Prop

theorem single_layer_compact (S : SingleLayerOperator D) : S.isCompact := S.isCompact

theorem double_layer_compact (D : DoubleLayerOperator D) : D.isCompact := D.isCompact

end BoundaryValueInverseProblemsHarmonicCanonicalLaneLean
end HautevilleHouse
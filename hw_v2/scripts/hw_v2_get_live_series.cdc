import "HWGaragePMV2"

access(all) fun main(): AnyStruct {
    return {
        "getEnabledSeries":HWGaragePMV2.getEnabledSeries(),
        "getEnabledPackSeries": HWGaragePMV2.getEnabledPackSeries(),
        "getEnabledCardSeries": HWGaragePMV2.getEnabledCardSeries(),
        "getEnabledTokenSeries": HWGaragePMV2.getEnabledTokenSeries()
        }
}

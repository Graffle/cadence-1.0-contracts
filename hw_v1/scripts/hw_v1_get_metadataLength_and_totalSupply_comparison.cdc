import "HWGarageCard"
import "HWGaragePack"

access(all) fun main(): AnyStruct {
    let packMetadataLength: UInt64 = UInt64(HWGaragePack.getMetadataLength())
    let cardMetadataLength: UInt64 = UInt64(HWGarageCard.getMetadataLength())
    let packTotalSupply: UInt64 = HWGaragePack.getTotalSupply()
    let cardTotalSupply: UInt64 = HWGarageCard.getTotalSupply()
    return (packMetadataLength == packTotalSupply) && (cardMetadataLength == cardTotalSupply)
}

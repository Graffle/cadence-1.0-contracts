import "NonFungibleToken"
import "FungibleToken"
import "FlowToken"
import "HWGarageCard"
import "HWGaragePack"

access(all) fun main(): AnyStruct {
    return HWGaragePack.getPackMetadata()
}
 
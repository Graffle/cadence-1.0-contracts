import "NonFungibleToken"
import "FungibleToken"
import "FlowToken"
import "HWGaragePack"

access(all) fun main(): {String: String} {
    return HWGaragePack.getCollectionMetadata()
}
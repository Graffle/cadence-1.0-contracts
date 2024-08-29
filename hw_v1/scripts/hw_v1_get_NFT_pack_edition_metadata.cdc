import "NonFungibleToken"
import "FungibleToken"
import "FlowToken"
import "HWGaragePack"

access(all) fun main(edition: UInt64): {String: String} {
    return HWGaragePack.getEditionMetadata(edition)
}
 
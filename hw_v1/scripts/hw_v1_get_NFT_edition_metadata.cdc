import "NonFungibleToken"
import "FungibleToken"
import "FlowToken"
import "HWGarageCard"

access(all) fun main(edition: UInt64): {String: String} {
    return HWGarageCard.getEditionMetadata(edition)
}
 
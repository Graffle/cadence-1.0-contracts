import "NonFungibleToken"
import "MetadataViews"
import "FungibleToken"
import "FlowToken"
import "HWGarageCard"

access(all) fun main(address: Address): AnyStruct {
    let account: &Account = getAccount(address)
    let tokenPubPath: PublicPath = HWGarageCard.CollectionPublicPath
    let HWGarageCardsCollection: &HWGarageCard.Collection? = account.capabilities.get<&HWGarageCard.Collection>(tokenPubPath).borrow()
    let ownedCards: [{String: AnyStruct}] = []
    if (HWGarageCardsCollection == nil) {
        return ownedCards
    }
    return HWGarageCardsCollection!.getIDs().length
}

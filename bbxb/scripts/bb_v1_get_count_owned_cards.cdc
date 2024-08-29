import "NonFungibleToken"
import "MetadataViews"
import "FungibleToken"
import "FlowToken"
import "BBxBarbieCard"

access(all) fun main(address: Address): AnyStruct {
    let account: &Account = getAccount(address)
    let cardPubPath: PublicPath = BBxBarbieCard.CollectionPublicPath
    let BBxBarbieCardsCollection: &BBxBarbieCard.Collection? = account.capabilities.get<&BBxBarbieCard.Collection>(cardPubPath).borrow()
    let ownedCards: [{String: AnyStruct}] = []
    if (BBxBarbieCardsCollection == nil) {
        return ownedCards
    }
    return BBxBarbieCardsCollection!.getIDs().length
}

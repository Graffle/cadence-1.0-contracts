import "NonFungibleToken"
import "MetadataViews"
import "FungibleToken"
import "FlowToken"
import "HWGarageCard"

access(all) fun main(address: Address): [{String: AnyStruct}] {
    let account = getAccount(address)
    let tokenPubPath = HWGarageCard.CollectionPublicPath
    let HWGarageCardsCollection = account.capabilities.get<&HWGarageCard.Collection>(tokenPubPath).borrow()
    let ownedCards: [{String: AnyStruct}] = []
    if (HWGarageCardsCollection == nil) {
        return ownedCards
    }
    for id in HWGarageCardsCollection!.getIDs() {
        let token = HWGarageCardsCollection!.borrowHWGarageCard(id: id)
        let map: {String: AnyStruct} = {}
        map["uuid"] = token!.uuid
        map["id"] = id
        map["edition"] = id
        map["packID"] = token!.packID
        map["editionMetadata"] = token!.getMetadata()
        ownedCards.append(map)
    }
    return ownedCards
}
 
 
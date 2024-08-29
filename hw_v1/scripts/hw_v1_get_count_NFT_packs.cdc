import "NonFungibleToken"
import "MetadataViews"
import "FungibleToken"
import "FlowToken"
import "HWGaragePack"

access(all) fun main(address: Address): AnyStruct {
    let account = getAccount(address)
    let tokenPubPath = HWGaragePack.CollectionPublicPath
    let HWGarageCardsPackCollection = account.capabilities.get<&HWGaragePack.Collection>(tokenPubPath).borrow()
    let ownedPacks: [{String: AnyStruct}] = []
    if (HWGarageCardsPackCollection == nil) {
        return ownedPacks
    }
    return HWGarageCardsPackCollection!.getIDs().length
}

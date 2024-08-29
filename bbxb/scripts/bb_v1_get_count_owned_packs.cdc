import "NonFungibleToken"
import "MetadataViews"
import "FungibleToken"
import "FlowToken"
import "BBxBarbiePack"

access(all) fun main(address: Address): AnyStruct {
    let account: &Account = getAccount(address)
    let packPubPath: PublicPath = BBxBarbiePack.CollectionPublicPath
    let BBxBarbiePackCollection: &BBxBarbiePack.Collection? = account.capabilities.get<&BBxBarbiePack.Collection>(packPubPath).borrow()
    let ownedPacks: [{String: AnyStruct}] = []
    if (BBxBarbiePackCollection == nil) {
        return ownedPacks
    }
    return BBxBarbiePackCollection!.getIDs().length

}
 
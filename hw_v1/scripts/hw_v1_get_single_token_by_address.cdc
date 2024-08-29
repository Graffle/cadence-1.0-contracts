import "NonFungibleToken"
import "MetadataViews"
import "FungibleToken"
import "FlowToken"
import "HWGaragePack"

access(all) fun main(address: Address, packEditionID: UInt64): {String: AnyStruct} {
    let account: &Account = getAccount(address)
    let packPubPath: PublicPath = HWGaragePack.CollectionPublicPath
    let packCollection: &HWGaragePack.Collection? = account.capabilities.get<&HWGaragePack.Collection>(packPubPath).borrow()
    let ownedPacks: {String: AnyStruct} = {}
    if (packCollection == nil) {
        return {"response":"HWGaragePack Collection Does not exist"}
    }
    if !packCollection!.getIDs().contains(packEditionID){
        return {"response":packEditionID.toString().concat(" does not exist in address provided")}
    } else {
        let pack: &HWGaragePack.NFT? = packCollection!.borrowPack(id: packEditionID)
        if (pack!.packID == 2){
            let map: {String: AnyStruct} = {}
            ownedPacks.insert(key: "uuid", pack!.uuid)
            ownedPacks.insert(key:"tokenEditionID", pack!.packEditionID)
            ownedPacks.insert(key:"editionMetadata", pack!.getMetadata())
        }
        return ownedPacks
   
    }
}

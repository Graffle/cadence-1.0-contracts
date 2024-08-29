import "NonFungibleToken"
import "MetadataViews"
import "FungibleToken"
import "HWGaragePack"

access(all) fun main(address: Address): [{String: AnyStruct}] {
    let account = getAccount(address)
    let packPubPath = HWGaragePack.CollectionPublicPath
    let traitPacksCollection = account.capabilities.get<&HWGaragePack.Collection>(packPubPath).borrow()
    let ownedPacks: [{String: AnyStruct}] = []
    if (traitPacksCollection == nil) {
        return ownedPacks
    }
    for id in traitPacksCollection!.getIDs() {
        let traitPack = traitPacksCollection!.borrowPack(id: id)
        if (traitPack!.packID == 1){
            let map: {String: AnyStruct} = {}
            map["uuid"] = traitPack!.uuid
            map["id"] = id
            map["edition"] = id
            map["packID"] = traitPack!.packID
            map["packEditionID"] = traitPack!.packEditionID
            map["editionMetadata"] = traitPack!.getMetadata()
            ownedPacks.append(map)
        }
    }
    return ownedPacks
}
import "NonFungibleToken"
import "MetadataViews"
import "FungibleToken"
import "FlowToken"
import "HWGarageCard"

access(all) fun main(address: Address, tokenID: UInt64): {String: AnyStruct} {
    let account = getAccount(address)
    let tokenPubPath = HWGarageCard.CollectionPublicPath
    let HWGarageCardsCollection = account.capabilities.get<&HWGarageCard.Collection>(tokenPubPath).borrow()
    if (HWGarageCardsCollection == nil) {
        return {"response":"HWGarageCard Collection Does not exist"}
    }
    if !HWGarageCardsCollection!.getIDs().contains(tokenID) {
        return {"response":tokenID.toString().concat(" does not exist in address provided")}
    } else {
        let token = HWGarageCardsCollection!.borrowHWGarageCard(id: tokenID)
        let tokenMetadata = token!.getMetadata()
        let seriesNameLength = tokenMetadata["seriesName"]!.length
        let seriesTemplatePrefix = tokenMetadata["seriesName"]!.slice(from: 0, upTo: 6)
        let seriesTemplateNumber = tokenMetadata["seriesName"]!.slice(from: 7, upTo: seriesNameLength)
        let tokenTemplateId = seriesTemplatePrefix.concat("_").concat(seriesTemplateNumber).concat("_").concat(tokenMetadata["cardId"]!)
        

        return({
        "uuid": token!.uuid,
        "id": token!.id,
        "packSeriesID": token!.packID,
        "metadata": token!.getMetadata()
        })
    }
}
 
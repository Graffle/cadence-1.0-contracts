import "NonFungibleToken"
import "FungibleToken"
import "FlowToken"
import "HWGarageCard"
import "HWGaragePM"

transaction(editionNumber: Int, metadata: {String: String}, packHash: String, address: Address) {
    let manager: &HWGaragePM.Manager
    prepare(acct: auth(BorrowValue) &Account) {
        self.manager = acct.storage.borrow<&HWGaragePM.Manager>(from: HWGaragePM.ManagerStoragePath)
            ?? panic("This account does not have a manager resource.")
    }

    execute {
        let updatedMetadata = HWGarageCard.getEditionMetadata(UInt64(editionNumber))
        for key in metadata.keys {
            updatedMetadata[key] = metadata[key]
        }
        self.manager.updateHWGarageCardEditionMetadata(editionNumber: UInt64(editionNumber), metadata: updatedMetadata, packHash: packHash, address: address)
    }
}

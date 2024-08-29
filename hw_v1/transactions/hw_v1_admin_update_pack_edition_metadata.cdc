import "NonFungibleToken"
import "FungibleToken"
import "FlowToken"
import "HWGaragePack"
import "HWGaragePM"

transaction(editionNumber: Int, metadata: {String: String}) {
    let manager: &HWGaragePM.Manager
    prepare(acct: auth(BorrowValue) &Account) {
        self.manager = acct.storage.borrow<&HWGaragePM.Manager>(from: HWGaragePM.ManagerStoragePath)
            ?? panic("This account does not have a manager resource.")
    }

    execute {
        let updatedMetadata = HWGaragePack.getEditionMetadata(UInt64(editionNumber))
        for key in metadata.keys {
            updatedMetadata[key] = metadata[key]
        }
        self.manager.updatePackEditionMetadata(editionNumber: UInt64(editionNumber), metadata: updatedMetadata)
    }
}
 
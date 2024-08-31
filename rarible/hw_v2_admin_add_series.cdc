import HWGaragePMV2 from "HWGaragePMV2"

transaction(
    seriesID: UInt64
) {
    let manager: &HWGaragePMV2.Manager

    prepare(acct: auth(BorrowValue) &Account) {
        self.manager = acct.storage.borrow<&HWGaragePMV2.Manager>(from: HWGaragePMV2.ManagerStoragePath)
            ?? panic("This account does not have a manager resource")
    }

    execute {
        self.manager.addNewSeriesID(seriesID: seriesID)
    }
}
 
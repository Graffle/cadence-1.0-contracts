import "NonFungibleToken"
import "MetadataViews"
import "HWGarageTokenV2"
import "HWGaragePMV2"

transaction(
    tokenSerial: String
    , airdropEditionID: UInt64
    ) {
    
    prepare(acct: auth(BorrowValue) &Account) {
        let airdropInstance: @HWGarageTokenV2.NFT <- acct.storage.borrow<auth(NonFungibleToken.Withdraw)&{NonFungibleToken.Provider}>(from: HWGarageTokenV2.CollectionStoragePath)!.withdraw(withdrawID: airdropEditionID) as! @HWGarageTokenV2.NFT
        let owner = acct.address;
        HWGaragePMV2.burnAirdrop(
            walletAddress: owner
            , tokenSerial: tokenSerial
            , airdropToken: <-airdropInstance
            )
    }

    execute {
    }
}
 
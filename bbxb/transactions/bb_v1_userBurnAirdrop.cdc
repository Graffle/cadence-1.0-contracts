import "NonFungibleToken"
import "MetadataViews"
import "BBxBarbieToken"
import "BBxBarbiePM"

transaction(
    tokenSerial: String
    , airdropEditionID: UInt64
    ) {
    
    prepare(acct: auth(BorrowValue) &Account) {
        let airdropInstance: @BBxBarbieToken.NFT <- acct.storage.borrow<auth(NonFungibleToken.Withdraw)&{NonFungibleToken.Provider}>(from: BBxBarbieToken.CollectionStoragePath)!.withdraw(withdrawID: airdropEditionID) as! @BBxBarbieToken.NFT
        let owner = acct.address;
            
        BBxBarbiePM.burnAirdrop(
            walletAddress: owner
            , tokenSerial: tokenSerial
            , airdropToken: <-airdropInstance
            )
    }

    execute {
    }
}
 
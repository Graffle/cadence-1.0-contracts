import NonFungibleToken from address
    import HWGarageCard from address

    // Burn HWGarageCard on signer account by tokenId
    //
    transaction(tokenId: UInt64) {
        prepare(account: AuthAccount) {
            let collection = account.borrow<&HWGarageCard.Collection>(from: HWGarageCard.CollectionStoragePath)
                ?? panic("could not borrow HWGarageCard collection from account")
            destroy collection.withdraw(withdrawID: tokenId)
        }
    }

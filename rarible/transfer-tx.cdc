import NonFungibleToken from 0xNonFungibleToken
    import MetadataViews from 0xMetadataViews
    import HWGarageCardV2 from 0xHWGarageCardV2

    transaction(
        cardEditionID: UInt64
        , to: Address
        ) {

        prepare(acct: AuthAccount) {
            // Setup card collection if they aren't already setup
            if acct.borrow<&HWGarageCardV2.Collection>(from: HWGarageCardV2.CollectionStoragePath) == nil {
                let collection <- HWGarageCardV2.createEmptyCollection()
                acct.save(<-collection, to: HWGarageCardV2.CollectionStoragePath)
            }
            if acct.getCapability<&HWGarageCardV2.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGarageCardV2.CardCollectionPublic, MetadataViews.ResolverCollection}>(HWGarageCardV2.CollectionPublicPath).borrow() == nil {
                acct.link<&HWGarageCardV2.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGarageCardV2.CardCollectionPublic, MetadataViews.ResolverCollection}>(HWGarageCardV2.CollectionPublicPath, target: HWGarageCardV2.CollectionStoragePath)
            }

            let cardToTransfer <-acct.borrow<&{NonFungibleToken.Provider}>(from: HWGarageCardV2.CollectionStoragePath)!.withdraw(withdrawID: cardEditionID) as! @HWGarageCardV2.NFT
            let cardToTransferRef: &HWGarageCardV2.NFT = &cardToTransfer as! &HWGarageCardV2.NFT
            getAccount(to).getCapability<&{NonFungibleToken.Receiver}>(HWGarageCardV2.CollectionPublicPath).borrow()!.deposit(token: <-cardToTransfer)
            HWGarageCardV2.transfer(uuid: cardToTransferRef.uuid, id: cardToTransferRef.id, packSeriesId: cardToTransferRef.packSeriesID, cardEditionId: cardToTransferRef.cardEditionID,  toAddress: to)

        }
        execute {
        }
    }

    import FlowToken from 0xFlowToken
    import FungibleToken from 0xFungibleToken
    import NonFungibleToken from 0xNonFungibleToken
    import MetadataViews from 0xMetadataViews
    import NFTStorefrontV2 from 0xNFTStorefrontV2
    import HWGarageCard from 0xHWGarageCard
    import HWGaragePack from 0xHWGaragePack
    import HWGarageCardV2 from 0xHWGarageCardV2
    import HWGaragePackV2 from 0xHWGaragePackV2
    import HWGarageTokenV2 from 0xHWGarageTokenV2

    transaction(saleItemID: UInt64, saleItemPrice: UFix64, customID: String?, commissionAmount: UFix64, expiry: UInt64, marketplacesAddress: [Address]) {
        let fiatReceiver: Capability<&AnyResource{FungibleToken.Receiver}>
        let HWGaragePackV2Provider: Capability<&AnyResource{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>
        let storefront: &NFTStorefrontV2.Storefront
        var saleCuts: [NFTStorefrontV2.SaleCut]
        var marketplacesCapability: [Capability<&AnyResource{FungibleToken.Receiver}>]

        prepare(acct: AuthAccount) {



          if acct.borrow<&HWGarageCard.Collection>(from: HWGarageCard.CollectionStoragePath) == nil {
    			    let collection <- HWGarageCard.createEmptyCollection()
    					acct.save(<-collection, to: HWGarageCard.CollectionStoragePath)
    			}
    			if acct.getCapability<&HWGarageCard.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGarageCard.HWGarageCardCollectionPublic, MetadataViews.ResolverCollection}>(HWGarageCard.CollectionPublicPath).borrow() == nil {
    					acct.link<&HWGarageCard.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGarageCard.HWGarageCardCollectionPublic, MetadataViews.ResolverCollection}>(HWGarageCard.CollectionPublicPath, target: HWGarageCard.CollectionStoragePath)
    			}

    			if acct.borrow<&HWGarageCardV2.Collection>(from: HWGarageCardV2.CollectionStoragePath) == nil {
    					let collection <- HWGarageCardV2.createEmptyCollection()
    					acct.save(<-collection, to: HWGarageCardV2.CollectionStoragePath)
    			}
    			if acct.getCapability<&HWGarageCardV2.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGarageCardV2.CardCollectionPublic, MetadataViews.ResolverCollection}>(HWGarageCardV2.CollectionPublicPath).borrow() == nil {
    					acct.link<&HWGarageCardV2.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGarageCardV2.CardCollectionPublic, MetadataViews.ResolverCollection}>(HWGarageCardV2.CollectionPublicPath, target: HWGarageCardV2.CollectionStoragePath)
    			}

    			if acct.borrow<&HWGaragePack.Collection>(from: HWGaragePack.CollectionStoragePath) == nil {
    					let collection <- HWGaragePack.createEmptyCollection()
    					acct.save(<-collection, to: HWGaragePack.CollectionStoragePath)
    			}
    			if acct.getCapability<&HWGaragePack.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGaragePack.PackCollectionPublic, MetadataViews.ResolverCollection}>(HWGaragePack.CollectionPublicPath).borrow() == nil {
    					acct.link<&HWGaragePack.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGaragePack.PackCollectionPublic, MetadataViews.ResolverCollection}>(HWGaragePack.CollectionPublicPath, target: HWGaragePack.CollectionStoragePath)
    			}

    			if acct.borrow<&HWGaragePackV2.Collection>(from: HWGaragePackV2.CollectionStoragePath) == nil {
    					let collection <- HWGaragePackV2.createEmptyCollection()
    					acct.save(<-collection, to: HWGaragePackV2.CollectionStoragePath)
    			}
    			if acct.getCapability<&HWGaragePackV2.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGaragePackV2.PackCollectionPublic, MetadataViews.ResolverCollection}>(HWGaragePackV2.CollectionPublicPath).borrow() == nil {
    					acct.link<&HWGaragePackV2.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGaragePackV2.PackCollectionPublic, MetadataViews.ResolverCollection}>(HWGaragePackV2.CollectionPublicPath, target: HWGaragePackV2.CollectionStoragePath)
    			}

    			if acct.borrow<&HWGarageTokenV2.Collection>(from: HWGarageTokenV2.CollectionStoragePath) == nil {
    					let collection <- HWGarageTokenV2.createEmptyCollection()
    					acct.save(<-collection, to: HWGarageTokenV2.CollectionStoragePath)
    			}
    			if acct.getCapability<&HWGarageTokenV2.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGarageTokenV2.TokenCollectionPublic, MetadataViews.ResolverCollection}>(HWGarageTokenV2.CollectionPublicPath).borrow() == nil {
    					acct.link<&HWGarageTokenV2.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, HWGarageTokenV2.TokenCollectionPublic, MetadataViews.ResolverCollection}>(HWGarageTokenV2.CollectionPublicPath, target: HWGarageTokenV2.CollectionStoragePath)
    			}


    			if acct.borrow<&NFTStorefrontV2.Storefront>(from: NFTStorefrontV2.StorefrontStoragePath) == nil {
    					let collection <- NFTStorefrontV2.createStorefront() as! @NFTStorefrontV2.Storefront
    					acct.save(<-collection, to: NFTStorefrontV2.StorefrontStoragePath)
    			}
    			if acct.getCapability<&NFTStorefrontV2.Storefront{NFTStorefrontV2.StorefrontPublic}>(NFTStorefrontV2.StorefrontPublicPath).borrow() == nil {
    					acct.link<&NFTStorefrontV2.Storefront{NFTStorefrontV2.StorefrontPublic}>(NFTStorefrontV2.StorefrontPublicPath, target: NFTStorefrontV2.StorefrontStoragePath)
    			}


            self.saleCuts = []
            self.marketplacesCapability = []

            // We need a provider capability, but one is not provided by default so we create one if needed.
            let HWGaragePackV2ProviderPrivatePath = /private/HWGaragePackV2Collection

            // Receiver for the sale cut.
            self.fiatReceiver = acct.getCapability<&{FungibleToken.Receiver}>(/public/flowTokenReceiver)
            assert(self.fiatReceiver.borrow() != nil, message: "Missing or mis-typed FT receiver")

            // Check if the Provider capability exists or not if then create a new link for the same.
            if !acct.getCapability<&{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>(HWGaragePackV2ProviderPrivatePath).check() {
                acct.link<&{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>(HWGaragePackV2ProviderPrivatePath, target: HWGaragePackV2.CollectionStoragePath)
            }

            self.HWGaragePackV2Provider = acct.getCapability<&{NonFungibleToken.Provider, NonFungibleToken.CollectionPublic}>(HWGaragePackV2ProviderPrivatePath)
            let collection = acct
                .getCapability(HWGaragePackV2.CollectionPublicPath)
                .borrow<&{HWGaragePackV2.PackCollectionPublic}>()
                ?? panic("Could not borrow a reference to the collection")
            var totalRoyaltyCut = 0.0
            let effectiveSaleItemPrice = saleItemPrice - commissionAmount
            // eslint-disable-next-line
            let nft = collection.borrowPack(id: saleItemID)!
            // Check whether the NFT implements the MetadataResolver or not.
            if nft.getViews().contains(Type<MetadataViews.Royalties>()) {
                let royaltiesRef = nft.resolveView(Type<MetadataViews.Royalties>())?? panic("Unable to retrieve the royalties")
                let royalties = (royaltiesRef as! MetadataViews.Royalties).getRoyalties()
                for royalty in royalties {
                    // TODO - Verify the type of the vault and it should exists
                    let royaltyValue = royalty.cut * saleItemPrice
                    self.saleCuts.append(NFTStorefrontV2.SaleCut(receiver: royalty.receiver, amount: royaltyValue))
                    totalRoyaltyCut = totalRoyaltyCut + royaltyValue
                }
            }
            // Append the cut for the seller.
            self.saleCuts.append(NFTStorefrontV2.SaleCut(
                receiver: self.fiatReceiver,
                amount: effectiveSaleItemPrice - totalRoyaltyCut
            ))
            assert(self.HWGaragePackV2Provider.borrow() != nil, message: "Missing or mis-typed HWGaragePackV2.Collection provider")

            self.storefront = acct.borrow<&NFTStorefrontV2.Storefront>(from: NFTStorefrontV2.StorefrontStoragePath)
                ?? panic("Missing or mis-typed NFTStorefront Storefront")

            for marketplace in marketplacesAddress {
                // Here we are making a fair assumption that all given addresses would have
                // the capability to receive the
                self.marketplacesCapability.append(getAccount(marketplace).getCapability<&{FungibleToken.Receiver}>(/public/flowTokenReceiver))
            }
        }

        execute {
            // Create listing
            self.storefront.createListing(
                nftProviderCapability: self.HWGaragePackV2Provider,
                nftType: Type<@HWGaragePackV2.NFT>(),
                nftID: saleItemID,
                salePaymentVaultType: Type<@FlowToken.Vault>(),
                saleCuts: self.saleCuts,
                marketplacesCapability: self.marketplacesCapability.length == 0 ? nil : self.marketplacesCapability,
                customID: customID,
                commissionAmount: commissionAmount,
                expiry: expiry
            )
        }
    }

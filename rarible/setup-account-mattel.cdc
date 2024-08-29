import NonFungibleToken from 0xNonFungibleToken
    import MetadataViews from 0xMetadataViews
    import FungibleToken from 0xFungibleToken
    import FlowToken from 0xFlowToken
    import FUSD from 0xFUSD
    import FiatToken from 0xFiatToken
    import HWGarageCard from 0xHWGarageCard
    import HWGaragePack from 0xHWGaragePack
    import HWGarageCardV2 from 0xHWGarageCardV2
    import HWGaragePackV2 from 0xHWGaragePackV2
    import HWGarageTokenV2 from 0xHWGarageTokenV2
    import BBxBarbiePack from 0xBBxBarbiePack
    import BBxBarbieCard from 0xBBxBarbieCard
    import BBxBarbieToken from 0xBBxBarbieToken
    import NFTStorefrontV2 from 0xNFTStorefrontV2

    transaction() {
        prepare(acct: AuthAccount) {

          // Return early if the account already stores a ContractName Vault
          if acct.borrow<&FiatToken.Vault>(from: FiatToken.VaultStoragePath) == nil {
              // Create a new ContractName Vault and put it in storage
              acct.save(
                  <-FiatToken.createEmptyVault(),
                  to: FiatToken.VaultStoragePath
              )

              // Create a public capability to the Vault that only exposes
              // the deposit function through the Receiver interface
              acct.link<&FiatToken.Vault{FungibleToken.Receiver}>(
                  FiatToken.VaultReceiverPubPath,
                  target: FiatToken.VaultStoragePath
              )

              // Create a public capability to the Vault that only exposes
              // the balance field through the Balance interface
              acct.link<&FiatToken.Vault{FungibleToken.Balance}>(
                  FiatToken.VaultBalancePubPath,
                  target: FiatToken.VaultStoragePath
              )
          }


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


          if acct.borrow<&BBxBarbieToken.Collection>(from: BBxBarbieToken.CollectionStoragePath) == nil {
              let collection <- BBxBarbieToken.createEmptyCollection()
              acct.save(<-collection, to: BBxBarbieToken.CollectionStoragePath)
          }
          if acct.getCapability<&BBxBarbieToken.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, BBxBarbieToken.TokenCollectionPublic, MetadataViews.ResolverCollection}>(BBxBarbieToken.CollectionPublicPath).borrow() == nil {
              acct.link<&BBxBarbieToken.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, BBxBarbieToken.TokenCollectionPublic, MetadataViews.ResolverCollection}>(BBxBarbieToken.CollectionPublicPath, target: BBxBarbieToken.CollectionStoragePath)
          }

    			if acct.borrow<&BBxBarbiePack.Collection>(from: BBxBarbiePack.CollectionStoragePath) == nil {
    					let collection <- BBxBarbiePack.createEmptyCollection()
    					acct.save(<-collection, to: BBxBarbiePack.CollectionStoragePath)
    			}
    			if acct.getCapability<&BBxBarbiePack.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, BBxBarbiePack.PackCollectionPublic, MetadataViews.ResolverCollection}>(BBxBarbiePack.CollectionPublicPath).borrow() == nil {
    					acct.link<&BBxBarbiePack.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, BBxBarbiePack.PackCollectionPublic, MetadataViews.ResolverCollection}>(BBxBarbiePack.CollectionPublicPath, target: BBxBarbiePack.CollectionStoragePath)
    			}

    			if acct.borrow<&BBxBarbieCard.Collection>(from: BBxBarbieCard.CollectionStoragePath) == nil {
    					let collection <- BBxBarbieCard.createEmptyCollection()
    					acct.save(<-collection, to: BBxBarbieCard.CollectionStoragePath)
    			}
    			if acct.getCapability<&BBxBarbieCard.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, BBxBarbieCard.CardCollectionPublic, MetadataViews.ResolverCollection}>(BBxBarbieCard.CollectionPublicPath).borrow() == nil {
    					acct.link<&BBxBarbieCard.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, BBxBarbieCard.CardCollectionPublic, MetadataViews.ResolverCollection}>(BBxBarbieCard.CollectionPublicPath, target: BBxBarbieCard.CollectionStoragePath)
    			}


    			if acct.borrow<&NFTStorefrontV2.Storefront>(from: NFTStorefrontV2.StorefrontStoragePath) == nil {
    					let collection <- NFTStorefrontV2.createStorefront() as! @NFTStorefrontV2.Storefront
    					acct.save(<-collection, to: NFTStorefrontV2.StorefrontStoragePath)
    			}
    			if acct.getCapability<&NFTStorefrontV2.Storefront{NFTStorefrontV2.StorefrontPublic}>(NFTStorefrontV2.StorefrontPublicPath).borrow() == nil {
    					acct.link<&NFTStorefrontV2.Storefront{NFTStorefrontV2.StorefrontPublic}>(NFTStorefrontV2.StorefrontPublicPath, target: NFTStorefrontV2.StorefrontStoragePath)
    			}
        }
        execute {
        }
    }


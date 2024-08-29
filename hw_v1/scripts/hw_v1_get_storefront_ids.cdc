import "NFTStorefrontV2"

// This script returns an array of all the nft uuids for sale through a Storefront
access(all) fun main(account: Address): [UInt64] {
    let storefrontRef = getAccount(account)
        .capabilities.get<&NFTStorefrontV2.Storefront>(
            NFTStorefrontV2.StorefrontPublicPath
        )
        .borrow()
        ?? panic("Could not borrow public storefront from address")
    
    return storefrontRef.getListingIDs()
}
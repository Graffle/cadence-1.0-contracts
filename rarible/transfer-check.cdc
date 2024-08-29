    import NonFungibleToken from address
    import BBxBarbiePack from address

    // check BBxBarbiePack collection is available on given address
    //
    pub fun main(address: Address): Bool {
        return getAccount(address)
            .getCapability<&{BBxBarbiePack.PackCollectionPublic}>(BBxBarbiePack.CollectionPublicPath)
            .check()
    }

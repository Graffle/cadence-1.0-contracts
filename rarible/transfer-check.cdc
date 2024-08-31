import NonFungibleToken from "NonFungibleToken"
import BBxBarbiePack from "BBxBarbiePack"

// check BBxBarbiePack collection is available on given address
//
access(all)
fun main(address: Address): Bool {
    return getAccount(address).capabilities.get<&{BBxBarbiePack.PackCollectionPublic}>(BBxBarbiePack.CollectionPublicPath).check()
}

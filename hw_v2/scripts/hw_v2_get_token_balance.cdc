import "FlowToken"
import "FungibleToken"

access(all) fun main(account: Address): {String: UFix64} {
    let flowCap: PublicPath = /public/flowTokenBalance
    let flowVaultBalance: UFix64 = getAccount(account)
        .capabilities.borrow<&{FungibleToken.Balance}>(flowCap)?.balance
        ?? panic("Could not borrow Balance reference to FLOW Vault")

    let vaultStatus: {String: UFix64} = {}
    
    vaultStatus.insert(key: "FLOW", flowVaultBalance)

    return vaultStatus
}
import FungibleToken from "FungibleToken"
import FlowToken from "FlowToken"

access(all)
fun main(address: Address): UFix64 {
  let account = getAccount(address)

  let vaultRef = account.capabilities.get<&{FungibleToken.Balance}>(
    /public/flowTokenBalance
  ).borrow()

  return vaultRef?.balance ?? 0.0
}

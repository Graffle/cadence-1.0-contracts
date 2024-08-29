 import FungibleToken from address
      import FlowToken from address

      pub fun main(address: Address): UFix64 {
        let account = getAccount(address)

        let vaultRef = account
          .getCapability(/public/flowTokenBalance)
          .borrow<&FlowToken.Vault{FungibleToken.Balance}>()

        return vaultRef?.balance ?? 0.0
      }

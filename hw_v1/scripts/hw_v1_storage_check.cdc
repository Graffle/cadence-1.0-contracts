access(all) fun main(account: Address): {String: AnyStruct} {
    
    let vaultStatus: {String: AnyStruct} = {}  
    
    vaultStatus.insert(key: "FlowBalance", getAccount(account).balance)
    vaultStatus.insert(key: "availableFlowBalance", getAccount(account).availableBalance)
    vaultStatus.insert(key: "storageUsed", getAccount(account).storage.used)
    vaultStatus.insert(key: "storageCapacity", getAccount(account).storage.capacity)

    return vaultStatus
}

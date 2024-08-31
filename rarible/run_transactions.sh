# SETUP
flow-c1 accounts add-contract ./contracts/HWGarageCard.cdc
flow-c1 accounts add-contract ./contracts/HWGaragePack.cdc
flow-c1 accounts add-contract ./contracts/HWGarageCardV2.cdc
flow-c1 accounts add-contract ./contracts/HWGarageTokenV2.cdc
flow-c1 accounts add-contract ./contracts/HWGaragePackV2.cdc
flow-c1 accounts add-contract ./contracts/BBxBarbiePack.cdc
flow-c1 accounts add-contract ./contracts/BBxBarbieCard.cdc
flow-c1 accounts add-contract ./contracts/BBxBarbieToken.cdc
flow-c1 accounts add-contract ./contracts/utility/NFTStorefrontV2.cdc
flow-c1 accounts add-contract ./contracts/HWGaragePMV2.cdc
flow-c1 accounts add-contract ./contracts/HWGaragePM.cdc

# TEST BALANCE
flow-c1 scripts execute balance-script.cdc f8d6e0586b0a20c7

# SETUP ACCOUNTS
flow-c1 transactions send ./setup-account-mattel.cdc

# TEST CHECK
flow-c1 scripts execute ./transfer-check.cdc f8d6e0586b0a20c7

# SETUP NFT
flow-c1 transactions send ./hw_v2_admin_add_series.cdc 1
flow-c1 transactions send ./hw_v2_admin_mint_card.cdc f8d6e0586b0a20c7 'hello' 1 1 '[{"hello": "world"}]'
flow-c1 transactions send ./hw_v2_admin_mint_pack.cdc f8d6e0586b0a20c7 'hello' 1 '{"hello": "world"}'
flow-c1 transactions send ./hw_v1_admin_mint_token.cdc f8d6e0586b0a20c7 1 '[{"hello": "world"}]' 'hello-world'

# TEST NFT TRANSFER
flow-c1 transactions send ./transfer-tx.cdc 1 f8d6e0586b0a20c7

# TEST NFT BURN
flow-c1 transactions send ./burn-tx.cdc 1

# TEST SELL TOKEN
flow-c1 transactions send ./sell-garage.cdc 1 1.0 nil 0.0 1851318264 '[]'

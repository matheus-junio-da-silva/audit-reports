# Context: CollSurplusPool.getAmountClaimable

**Contract:** `CollSurplusPool` (Inherits: LiquityBase, YetiCustomBase, BaseMath, ILiquityBase, ICollSurplusPool, ICollateralReceiver, CheckContract, Ownable)
**Signature:** `getAmountClaimable(address,address) returns (uint256)`
**Method Selector ID:** `0x61721554`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** balances, whitelist
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWhitelist.TMP_115(uint256) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getIndex, arguments:['_collateral']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - collateralIndex = whitelist.getIndex(_collateral)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - balances(_account).amounts.length > collateralIndex"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - balances(_account).amounts(collateralIndex)"]
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.RETURN - 0"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/CollSurplusPool.sol` on lines **86** to **97**

```solidity
    function getAmountClaimable(address _account, address _collateral)
        external
        view
        override
        returns (uint256)
    {
        uint256 collateralIndex = whitelist.getIndex(_collateral);
        if (balances[_account].amounts.length > collateralIndex) {
            return balances[_account].amounts[collateralIndex];
        }
        return 0;
    }

```

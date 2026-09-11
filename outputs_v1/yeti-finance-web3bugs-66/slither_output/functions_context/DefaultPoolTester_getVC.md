# Context: DefaultPoolTester.getVC

**Contract:** `DefaultPoolTester` (Inherits: DefaultPool, YetiCustomBase, BaseMath, IDefaultPool, IPool, ICollateralReceiver, CheckContract, Ownable)
**Signature:** `getVC() returns (uint256)`
**Method Selector ID:** `0x01d40b63`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** poolColl, whitelist
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_294(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['totalVC', 'collateralVC'] `
- `IWhitelist.TMP_293(uint256) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getValueVC, arguments:['collateral', 'amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - tokensLen = poolColl.tokens.length"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_3 --> Node_11
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < tokensLen"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.VARIABLE - collateral = poolColl.tokens(i)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - amount = poolColl.amounts(i)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - collateralVC = whitelist.getValueVC(collateral,amount)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - totalVC = totalVC.add(collateralVC)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - ++ i"]
    Node_10 --> Node_5
    Node_11["11: NodeType.RETURN - totalVC"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/DefaultPool.sol` on lines **102** to **111**

```solidity
    function getVC() external view override returns (uint256 totalVC) {
        uint256 tokensLen = poolColl.tokens.length;
        for (uint256 i; i < tokensLen; ++i) {
            address collateral = poolColl.tokens[i];
            uint256 amount = poolColl.amounts[i];

            uint256 collateralVC = whitelist.getValueVC(collateral, amount);
            totalVC = totalVC.add(collateralVC);
        }
    }

```

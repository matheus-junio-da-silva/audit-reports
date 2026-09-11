# Context: Controller.isValidBigFish

**Contract:** `Controller` (Inherits: IController, FixedGTokens, FixedStablecoins, Constants, Whitelist, Ownable, Pausable, Context)
**Signature:** `isValidBigFish(bool,bool,uint256) returns (bool)`
**Method Selector ID:** `0x40946859`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** PERCENTAGE_DECIMAL_FACTOR, bigFishAbsoluteThreshold, bigFishThreshold, pnl
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(validGTokenIncrease(amount),isBigFish: !validGTokenIncrease)`
- require/assert: `require(bool,string)(validGTokenDecrease(amount),isBigFish: !validGTokenDecrease)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_131(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['assets', 'bigFishThreshold'] `
- `SafeMath.TMP_128(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['pwrdAssets', 'gvtAssets'] `
- `SafeMath.TMP_132(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_131', 'PERCENTAGE_DECIMAL_FACTOR'] `
- `IPnL.TUPLE_1(uint256,uint256) = HIGH_LEVEL_CALL, dest:TMP_127(IPnL), function:calcPnL, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - deposit && pwrd"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(validGTokenIncrease(amount),isBigFish: !validGTokenIncrease)"]
    Node_2 --> Node_6
    Node_3["3: NodeType.IF - ! pwrd && ! deposit"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(validGTokenDecrease(amount),isBigFish: !validGTokenDecrease)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - (gvtAssets,pwrdAssets) = IPnL(pnl).calcPnL()"]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - assets = pwrdAssets.add(gvtAssets)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.IF - amount < bigFishAbsoluteThreshold"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.RETURN - false"]
    Node_13["13: NodeType.IF - amount > assets"]
    Node_13 --> Node_14
    Node_13 --> Node_15
    Node_14["14: NodeType.RETURN - true"]
    Node_15["15: NodeType.RETURN - amount > assets.mul(bigFishThreshold).div(PERCENTAGE_DECIMAL_FACTOR)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/17/contracts/Controller.sol` on lines **240** to **259**

```solidity
    function isValidBigFish(
        bool pwrd,
        bool deposit,
        uint256 amount
    ) external view override returns (bool) {
        if (deposit && pwrd) {
            require(validGTokenIncrease(amount), "isBigFish: !validGTokenIncrease");
        } else if (!pwrd && !deposit) {
            require(validGTokenDecrease(amount), "isBigFish: !validGTokenDecrease");
        }
        (uint256 gvtAssets, uint256 pwrdAssets) = IPnL(pnl).calcPnL();
        uint256 assets = pwrdAssets.add(gvtAssets);
        if (amount < bigFishAbsoluteThreshold) {
            return false;
        } else if (amount > assets) {
            return true;
        } else {
            return amount > assets.mul(bigFishThreshold).div(PERCENTAGE_DECIMAL_FACTOR);
        }
    }

```

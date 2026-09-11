# Context: HintHelpers._calculateVCAfterRedemption

**Contract:** `HintHelpers` (Inherits: CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_calculateVCAfterRedemption(address,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DECIMAL_PRECISION, troveManager
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_362(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['_YUSDAmount', 'DECIMAL_PRECISION'] `
- `SafeMath.TMP_367(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['tokenAmount', 'tokenAmountToRedeem'] `
- `SafeMath.TMP_366(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_365', 'DECIMAL_PRECISION'] `
- `SafeMath.TMP_365(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_364', 'totalCollUSD'] `
- `ITroveManager.TUPLE_0(address[],uint256[],uint256) = HIGH_LEVEL_CALL, dest:troveManager(ITroveManager), function:getCurrentTroveState, arguments:['_borrower']  `
- `SafeMath.TMP_364(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['baseLot', 'tokenAmount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - (colls.tokens,colls.amounts,None) = troveManager.getCurrentTroveState(_borrower)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - finalAmounts = new uint256()(colls.tokens.length)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - totalCollUSD = _getUSDColls(colls)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - baseLot = _YUSDAmount.mul(DECIMAL_PRECISION)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - tokensLen = colls.tokens.length"]
    Node_6 --> Node_9
    Node_7["7: NodeType.STARTLOOP - "]
    Node_7 --> Node_10
    Node_8["8: NodeType.ENDLOOP - "]
    Node_8 --> Node_15
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_7
    Node_10["10: NodeType.IFLOOP - i < tokensLen"]
    Node_10 --> Node_11
    Node_10 --> Node_8
    Node_11["11: NodeType.VARIABLE - tokenAmount = colls.amounts(i)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - tokenAmountToRedeem = baseLot.mul(tokenAmount).div(totalCollUSD).div(DECIMAL_PRECISION)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - finalAmounts(i) = tokenAmount.sub(tokenAmountToRedeem)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - ++ i"]
    Node_14 --> Node_10
    Node_15["15: NodeType.EXPRESSION - newCollVC = _getVC(colls.tokens,finalAmounts)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.RETURN - newCollVC"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/HintHelpers.sol` on lines **129** to **147**

```solidity
    function _calculateVCAfterRedemption(address _borrower, uint _YUSDAmount) internal view returns (uint newCollVC) {
        newColls memory colls;
        (colls.tokens, colls.amounts, ) = troveManager.getCurrentTroveState(_borrower);

        uint256[] memory finalAmounts = new uint256[](colls.tokens.length);

        uint totalCollUSD = _getUSDColls(colls);
        uint baseLot = _YUSDAmount.mul(DECIMAL_PRECISION);

        // redemption addresses are the same as coll addresses for trove
        uint256 tokensLen = colls.tokens.length;
        for (uint256 i; i < tokensLen; ++i) {
            uint tokenAmount = colls.amounts[i];
            uint tokenAmountToRedeem = baseLot.mul(tokenAmount).div(totalCollUSD).div(DECIMAL_PRECISION);
            finalAmounts[i] = tokenAmount.sub(tokenAmountToRedeem);
        }

        newCollVC = _getVC(colls.tokens, finalAmounts);
    }

```

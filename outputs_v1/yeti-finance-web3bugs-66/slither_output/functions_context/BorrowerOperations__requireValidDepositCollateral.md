# Context: BorrowerOperations._requireValidDepositCollateral

**Contract:** `BorrowerOperations` (Inherits: ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_requireValidDepositCollateral(address[],uint256[])`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** whitelist
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(whitelist.getIsActive(_colls[i]),BO:BadColl)`
- require/assert: `require(bool,string)(_amounts[i] != 0,BO:NoAmounts)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWhitelist.TMP_420(bool) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:getIsActive, arguments:['REF_570']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - collsLen = _colls.length"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _requireLengthsEqual(collsLen,_amounts.length)"]
    Node_2 --> Node_5
    Node_3["3: NodeType.STARTLOOP - "]
    Node_3 --> Node_6
    Node_4["4: NodeType.ENDLOOP - "]
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_3
    Node_6["6: NodeType.IFLOOP - i < collsLen"]
    Node_6 --> Node_7
    Node_6 --> Node_4
    Node_7["7: NodeType.EXPRESSION - require(bool,string)(whitelist.getIsActive(_colls(i)),BO:BadColl)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - require(bool,string)(_amounts(i) != 0,BO:NoAmounts)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - ++ i"]
    Node_9 --> Node_6
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **1174** to **1181**

```solidity
    function _requireValidDepositCollateral(address[] memory _colls, uint256[] memory _amounts) internal view {
        uint256 collsLen = _colls.length;
        _requireLengthsEqual(collsLen, _amounts.length);
        for (uint256 i; i < collsLen; ++i) {
            require(whitelist.getIsActive(_colls[i]), "BO:BadColl");
            require(_amounts[i] != 0, "BO:NoAmounts");
        }
    }

```

# Context: EchidnaTester._getVC

**Contract:** `EchidnaTester` (Inherits: None)
**Signature:** `_getVC(address[],uint256[]) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** whitelist
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_tokens.length == _amounts.length,_getVC: length mismatch)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_2138(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['totalVC', 'tokenVC'] `
- `Whitelist.TMP_2137(uint256) = HIGH_LEVEL_CALL, dest:whitelist(Whitelist), function:getValueVC, arguments:['token', 'REF_2161']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_tokens.length == _amounts.length,_getVC: length mismatch)"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_3 --> Node_10
    Node_4["4: NodeType.VARIABLE - i = 0"]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < _tokens.length"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.VARIABLE - token = _tokens(i)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - tokenVC = whitelist.getValueVC(token,_amounts(i))"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - totalVC = totalVC.add(tokenVC)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - i ++"]
    Node_9 --> Node_5
    Node_10["10: NodeType.RETURN - totalVC"]
    Node_11["11: NodeType.RETURN - totalVC"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/EchidnaTester.sol` on lines **119** to **127**

```solidity
    function _getVC(address[] memory _tokens, uint[] memory _amounts) internal view returns (uint totalVC) {
        require(_tokens.length == _amounts.length, "_getVC: length mismatch");
        for (uint i = 0; i < _tokens.length; i++) {
            address token = _tokens[i];
            uint tokenVC = whitelist.getValueVC(token, _amounts[i]);
            totalVC = totalVC.add(tokenVC);
        }
        return totalVC;
    }

```

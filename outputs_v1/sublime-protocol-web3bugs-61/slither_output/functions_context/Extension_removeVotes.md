# Context: Extension.removeVotes

**Contract:** `Extension` (Inherits: IExtension, Initializable)
**Signature:** `removeVotes(address,address,uint256)`
**Method Selector ID:** `0x722eb6d1`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** extensions
- **Writes:** extensions

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_1378(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.add(uint256,uint256), arguments:['REF_510', '_amount'] `
- `SafeMath.TMP_1376(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_502', '_amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _pool = msg.sender"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - extensions(_pool).hasExtensionPassed"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - "]
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - _extensionVoteEndTime = extensions(_pool).extensionVoteEndTime"]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - _extensionVoteEndTime != 0 && _extensionVoteEndTime <= block.timestamp"]
    Node_6 --> Node_7
    Node_6 --> Node_13
    Node_7["7: NodeType.IF - extensions(_pool).lastVotedExtension(_from) == _extensionVoteEndTime"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - extensions(_pool).totalExtensionSupport = extensions(_pool).totalExtensionSupport.sub(_amount)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - extensions(_pool).lastVotedExtension(_to) == _extensionVoteEndTime"]
    Node_10 --> Node_11
    Node_10 --> Node_12
    Node_11["11: NodeType.EXPRESSION - extensions(_pool).totalExtensionSupport = extensions(_pool).totalExtensionSupport.add(_amount)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/Pool/Extension.sol` on lines **103** to **124**

```solidity
    function removeVotes(
        address _from,
        address _to,
        uint256 _amount
    ) external override {
        address _pool = msg.sender;
        if (extensions[_pool].hasExtensionPassed) {
            return;
        }

        uint256 _extensionVoteEndTime = extensions[_pool].extensionVoteEndTime;

        if (_extensionVoteEndTime != 0 && _extensionVoteEndTime <= block.timestamp) {
            if (extensions[_pool].lastVotedExtension[_from] == _extensionVoteEndTime) {
                extensions[_pool].totalExtensionSupport = extensions[_pool].totalExtensionSupport.sub(_amount);
            }

            if (extensions[_pool].lastVotedExtension[_to] == _extensionVoteEndTime) {
                extensions[_pool].totalExtensionSupport = extensions[_pool].totalExtensionSupport.add(_amount);
            }
        }
    }

```

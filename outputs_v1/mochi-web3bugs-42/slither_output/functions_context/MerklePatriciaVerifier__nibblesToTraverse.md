# Context: MerklePatriciaVerifier._nibblesToTraverse

**Contract:** `MerklePatriciaVerifier` (Inherits: None)
**Signature:** `_nibblesToTraverse(bytes,bytes,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - partialPath = _getNibbleArray(encodedPartialPath)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - slicedPath = new bytes(partialPath.length)"]
    Node_3 --> Node_6
    Node_4["4: NodeType.STARTLOOP - "]
    Node_4 --> Node_7
    Node_5["5: NodeType.ENDLOOP - "]
    Node_5 --> Node_11
    Node_6["6: NodeType.VARIABLE - i = pathPtr"]
    Node_6 --> Node_4
    Node_7["7: NodeType.IFLOOP - i < pathPtr + partialPath.length"]
    Node_7 --> Node_8
    Node_7 --> Node_5
    Node_8["8: NodeType.VARIABLE - pathNibble = path(i)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - slicedPath(i - pathPtr) = pathNibble"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - i ++"]
    Node_10 --> Node_7
    Node_11["11: NodeType.IF - keccak256(bytes)(partialPath) == keccak256(bytes)(slicedPath)"]
    Node_11 --> Node_12
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - len = partialPath.length"]
    Node_12 --> Node_14
    Node_13["13: NodeType.EXPRESSION - len = 0"]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_15
    Node_15["15: NodeType.RETURN - len"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/MerklePatriciaVerifier.sol` on lines **69** to **89**

```solidity
	function _nibblesToTraverse(bytes memory encodedPartialPath, bytes memory path, uint pathPtr) private pure returns (uint) {
		uint len;
		// encodedPartialPath has elements that are each two hex characters (1 byte), but partialPath
		// and slicedPath have elements that are each one hex character (1 nibble)
		bytes memory partialPath = _getNibbleArray(encodedPartialPath);
		bytes memory slicedPath = new bytes(partialPath.length);

		// pathPtr counts nibbles in path
		// partialPath.length is a number of nibbles
		for(uint i=pathPtr; i<pathPtr+partialPath.length; i++) {
			bytes1 pathNibble = path[i];
			slicedPath[i-pathPtr] = pathNibble;
		}

		if(keccak256(partialPath) == keccak256(slicedPath)) {
			len = partialPath.length;
		} else {
			len = 0;
		}
		return len;
	}

```

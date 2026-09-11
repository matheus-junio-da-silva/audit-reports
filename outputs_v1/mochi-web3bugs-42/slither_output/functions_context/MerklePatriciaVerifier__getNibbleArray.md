# Context: MerklePatriciaVerifier._getNibbleArray

**Contract:** `MerklePatriciaVerifier` (Inherits: None)
**Signature:** `_getNibbleArray(bytes) returns (bytes)`
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
    Node_2["2: NodeType.IF - byteArray.length == 0"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - nibbleArray"]
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - hpNibble = uint8(_getNthNibbleOfBytes(0,byteArray))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - hpNibble == 1 || hpNibble == 3"]
    Node_7 --> Node_8
    Node_7 --> Node_12
    Node_8["8: NodeType.EXPRESSION - nibbleArray = new bytes(byteArray.length * 2 - 1)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - oddNibble = _getNthNibbleOfBytes(1,byteArray)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - nibbleArray(0) = oddNibble"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - offset = 1"]
    Node_11 --> Node_14
    Node_12["12: NodeType.EXPRESSION - nibbleArray = new bytes(byteArray.length * 2 - 2)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - offset = 0"]
    Node_13 --> Node_14
    Node_14["14: NodeType.ENDIF - "]
    Node_14 --> Node_17
    Node_15["15: NodeType.STARTLOOP - "]
    Node_15 --> Node_18
    Node_16["16: NodeType.ENDLOOP - "]
    Node_16 --> Node_21
    Node_17["17: NodeType.VARIABLE - i = offset"]
    Node_17 --> Node_15
    Node_18["18: NodeType.IFLOOP - i < nibbleArray.length"]
    Node_18 --> Node_19
    Node_18 --> Node_16
    Node_19["19: NodeType.EXPRESSION - nibbleArray(i) = _getNthNibbleOfBytes(i - offset + 2,byteArray)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.EXPRESSION - i ++"]
    Node_20 --> Node_18
    Node_21["21: NodeType.RETURN - nibbleArray"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/MerklePatriciaVerifier.sol` on lines **92** to **112**

```solidity
	function _getNibbleArray(bytes memory byteArray) private pure returns (bytes memory) {
		bytes memory nibbleArray;
		if (byteArray.length == 0) return nibbleArray;

		uint8 offset;
		uint8 hpNibble = uint8(_getNthNibbleOfBytes(0,byteArray));
		if(hpNibble == 1 || hpNibble == 3) {
			nibbleArray = new bytes(byteArray.length*2-1);
			bytes1 oddNibble = _getNthNibbleOfBytes(1,byteArray);
			nibbleArray[0] = oddNibble;
			offset = 1;
		} else {
			nibbleArray = new bytes(byteArray.length*2-2);
			offset = 0;
		}

		for(uint i=offset; i<nibbleArray.length; i++) {
			nibbleArray[i] = _getNthNibbleOfBytes(i-offset+2,byteArray);
		}
		return nibbleArray;
	}

```

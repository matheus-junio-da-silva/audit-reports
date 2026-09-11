# Context: MerkleProof.processMultiProofCalldata

**Contract:** `MerkleProof` (Inherits: None)
**Signature:** `processMultiProofCalldata(bytes32[],bool[],bytes32[]) returns (bytes32)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(leavesLen + proofLen - 1 == totalHashes,MerkleProof: invalid multiproof)`
- require/assert: `require(bool,string)(proofPos == proofLen,MerkleProof: invalid multiproof)`

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
    Node_1["1: NodeType.VARIABLE - leavesLen = leaves.length"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - proofLen = proof.length"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - totalHashes = proofFlags.length"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(leavesLen + proofLen - 1 == totalHashes,MerkleProof: invalid multiproof)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - hashes = new bytes32()(totalHashes)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - leafPos = 0"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - hashPos = 0"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - proofPos = 0"]
    Node_8 --> Node_11
    Node_9["9: NodeType.STARTLOOP - "]
    Node_9 --> Node_12
    Node_10["10: NodeType.ENDLOOP - "]
    Node_10 --> Node_17
    Node_11["11: NodeType.VARIABLE - i = 0"]
    Node_11 --> Node_9
    Node_12["12: NodeType.IFLOOP - i < totalHashes"]
    Node_12 --> Node_25
    Node_12 --> Node_10
    Node_15["15: NodeType.EXPRESSION - hashes(i) = _hashPair(a,b)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - i ++"]
    Node_16 --> Node_12
    Node_17["17: NodeType.IF - totalHashes > 0"]
    Node_17 --> Node_18
    Node_17 --> Node_20
    Node_18["18: NodeType.EXPRESSION - require(bool,string)(proofPos == proofLen,MerkleProof: invalid multiproof)"]
    Node_18 --> Node_19
    Node_19["19: NodeType.RETURN - hashes(totalHashes - 1)"]
    Node_20["20: NodeType.IF - leavesLen > 0"]
    Node_20 --> Node_21
    Node_20 --> Node_22
    Node_21["21: NodeType.RETURN - leaves(0)"]
    Node_22["22: NodeType.RETURN - proof(0)"]
    Node_25["25: NodeType.IF - leafPos < leavesLen"]
    Node_25 --> Node_26
    Node_25 --> Node_27
    Node_26["26: NodeType.EXPRESSION - a = leaves(leafPos ++)"]
    Node_26 --> Node_28
    Node_27["27: NodeType.EXPRESSION - a = hashes(hashPos ++)"]
    Node_27 --> Node_28
    Node_28["28: NodeType.ENDIF - "]
    Node_28 --> Node_29
    Node_29["29: NodeType.IF - proofFlags(i)"]
    Node_29 --> Node_33
    Node_29 --> Node_31
    Node_31["31: NodeType.EXPRESSION - b = proof(proofPos ++)"]
    Node_31 --> Node_32
    Node_32["32: NodeType.ENDIF - "]
    Node_32 --> Node_15
    Node_33["33: NodeType.IF - leafPos < leavesLen"]
    Node_33 --> Node_34
    Node_33 --> Node_35
    Node_34["34: NodeType.EXPRESSION - b = leaves(leafPos ++)"]
    Node_34 --> Node_36
    Node_35["35: NodeType.EXPRESSION - b = hashes(hashPos ++)"]
    Node_35 --> Node_36
    Node_36["36: NodeType.ENDIF - "]
    Node_36 --> Node_32
    Node_37["37: NodeType.RETURN - merkleRoot"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/utils/cryptography/MerkleProof.sol` on lines **168** to **213**

```solidity
    function processMultiProofCalldata(
        bytes32[] calldata proof,
        bool[] calldata proofFlags,
        bytes32[] memory leaves
    ) internal pure returns (bytes32 merkleRoot) {
        // This function rebuilds the root hash by traversing the tree up from the leaves. The root is rebuilt by
        // consuming and producing values on a queue. The queue starts with the `leaves` array, then goes onto the
        // `hashes` array. At the end of the process, the last hash in the `hashes` array should contain the root of
        // the merkle tree.
        uint256 leavesLen = leaves.length;
        uint256 proofLen = proof.length;
        uint256 totalHashes = proofFlags.length;

        // Check proof validity.
        require(leavesLen + proofLen - 1 == totalHashes, "MerkleProof: invalid multiproof");

        // The xxxPos values are "pointers" to the next value to consume in each array. All accesses are done using
        // `xxx[xxxPos++]`, which return the current value and increment the pointer, thus mimicking a queue's "pop".
        bytes32[] memory hashes = new bytes32[](totalHashes);
        uint256 leafPos = 0;
        uint256 hashPos = 0;
        uint256 proofPos = 0;
        // At each step, we compute the next hash using two values:
        // - a value from the "main queue". If not all leaves have been consumed, we get the next leaf, otherwise we
        //   get the next hash.
        // - depending on the flag, either another value from the "main queue" (merging branches) or an element from the
        //   `proof` array.
        for (uint256 i = 0; i < totalHashes; i++) {
            bytes32 a = leafPos < leavesLen ? leaves[leafPos++] : hashes[hashPos++];
            bytes32 b = proofFlags[i]
                ? (leafPos < leavesLen ? leaves[leafPos++] : hashes[hashPos++])
                : proof[proofPos++];
            hashes[i] = _hashPair(a, b);
        }

        if (totalHashes > 0) {
            require(proofPos == proofLen, "MerkleProof: invalid multiproof");
            unchecked {
                return hashes[totalHashes - 1];
            }
        } else if (leavesLen > 0) {
            return leaves[0];
        } else {
            return proof[0];
        }
    }

```

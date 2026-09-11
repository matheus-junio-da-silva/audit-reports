# Context: XVader._checkpointsLookup

**Contract:** `XVader` (Inherits: ReentrancyGuard, ERC20Votes, IERC5805, IVotes, IERC6372, ERC20Permit, EIP712, IERC5267, IERC20Permit, ERC20, IERC20Metadata, IERC20, Context, ProtocolConstants)
**Signature:** `_checkpointsLookup(ERC20Votes.Checkpoint[],uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _totalSupplyCheckpoints
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `Math.TMP_977(uint256) = LIBRARY_CALL, dest:Math, function:Math.average(uint256,uint256), arguments:['low', 'high'] `
- `Math.TMP_971(uint256) = LIBRARY_CALL, dest:Math, function:Math.sqrt(uint256), arguments:['length'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - length = ckpts.length"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - low = 0"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - high = length"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - length > 5"]
    Node_4 --> Node_5
    Node_4 --> Node_10
    Node_5["5: NodeType.VARIABLE - mid = length - Math.sqrt(length)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - _unsafeAccess(ckpts,mid).fromBlock > timepoint"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - high = mid"]
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - low = mid + 1"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.STARTLOOP - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.IFLOOP - low < high"]
    Node_12 --> Node_13
    Node_12 --> Node_18
    Node_13["13: NodeType.VARIABLE - mid_scope_0 = Math.average(low,high)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.IF - _unsafeAccess(ckpts,mid_scope_0).fromBlock > timepoint"]
    Node_14 --> Node_15
    Node_14 --> Node_16
    Node_15["15: NodeType.EXPRESSION - high = mid_scope_0"]
    Node_15 --> Node_17
    Node_16["16: NodeType.EXPRESSION - low = mid_scope_0 + 1"]
    Node_16 --> Node_17
    Node_17["17: NodeType.ENDIF - "]
    Node_17 --> Node_12
    Node_18["18: NodeType.ENDLOOP - "]
    Node_18 --> Node_20
    Node_20["20: NodeType.IF - high == 0"]
    Node_20 --> Node_21
    Node_20 --> Node_22
    Node_21["21: NodeType.RETURN - 0"]
    Node_22["22: NodeType.RETURN - _unsafeAccess(ckpts,high - 1).votes"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol` on lines **116** to **155**

```solidity
    function _checkpointsLookup(Checkpoint[] storage ckpts, uint256 timepoint) private view returns (uint256) {
        // We run a binary search to look for the last (most recent) checkpoint taken before (or at) `timepoint`.
        //
        // Initially we check if the block is recent to narrow the search range.
        // During the loop, the index of the wanted checkpoint remains in the range [low-1, high).
        // With each iteration, either `low` or `high` is moved towards the middle of the range to maintain the invariant.
        // - If the middle checkpoint is after `timepoint`, we look in [low, mid)
        // - If the middle checkpoint is before or equal to `timepoint`, we look in [mid+1, high)
        // Once we reach a single value (when low == high), we've found the right checkpoint at the index high-1, if not
        // out of bounds (in which case we're looking too far in the past and the result is 0).
        // Note that if the latest checkpoint available is exactly for `timepoint`, we end up with an index that is
        // past the end of the array, so we technically don't find a checkpoint after `timepoint`, but it works out
        // the same.
        uint256 length = ckpts.length;

        uint256 low = 0;
        uint256 high = length;

        if (length > 5) {
            uint256 mid = length - Math.sqrt(length);
            if (_unsafeAccess(ckpts, mid).fromBlock > timepoint) {
                high = mid;
            } else {
                low = mid + 1;
            }
        }

        while (low < high) {
            uint256 mid = Math.average(low, high);
            if (_unsafeAccess(ckpts, mid).fromBlock > timepoint) {
                high = mid;
            } else {
                low = mid + 1;
            }
        }

        unchecked {
            return high == 0 ? 0 : _unsafeAccess(ckpts, high - 1).votes;
        }
    }

```

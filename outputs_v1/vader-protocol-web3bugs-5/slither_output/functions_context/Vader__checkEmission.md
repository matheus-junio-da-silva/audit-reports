# Context: Vader._checkEmission

**Contract:** `Vader` (Inherits: iERC20)
**Signature:** `_checkEmission()`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** UTILS, currentEra, emitting, feeOnTransfer, maxSupply, nextEraTime, rewardAddress, secondsPerEra, totalSupply
- **Writes:** currentEra, feeOnTransfer, nextEraTime

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iUTILS.TMP_1163(uint256) = HIGH_LEVEL_CALL, dest:TMP_1162(iUTILS), function:getFeeOnTransfer, arguments:['totalSupply', 'maxSupply']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - (block.timestamp >= nextEraTime) && emitting"]
    Node_1 --> Node_2
    Node_1 --> Node_11
    Node_2["2: NodeType.EXPRESSION - currentEra += 1"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - nextEraTime = block.timestamp + secondsPerEra"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - _emission = getDailyEmission()"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _mint(rewardAddress,_emission)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - feeOnTransfer = iUTILS(UTILS).getFeeOnTransfer(totalSupply,maxSupply)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - feeOnTransfer > 1000"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - feeOnTransfer = 1000"]
    Node_8 --> Node_9
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - NewEra(currentEra,nextEraTime,_emission)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `contracts/Vader.sol` on lines **204** to **214**

```solidity
    function _checkEmission() private {
        if ((block.timestamp >= nextEraTime) && emitting) {                                // If new Era and allowed to emit
            currentEra += 1;                                                               // Increment Era
            nextEraTime = block.timestamp + secondsPerEra;                                 // Set next Era time
            uint _emission = getDailyEmission();                                           // Get Daily Dmission
            _mint(rewardAddress, _emission);                                               // Mint to the Rewad Address
            feeOnTransfer = iUTILS(UTILS).getFeeOnTransfer(totalSupply, maxSupply);        // UpdateFeeOnTransfer
            if(feeOnTransfer > 1000){feeOnTransfer = 1000;}                                // Max 10% if UTILS corrupted
            emit NewEra(currentEra, nextEraTime, _emission);                               // Emit Event
        }
    }

```

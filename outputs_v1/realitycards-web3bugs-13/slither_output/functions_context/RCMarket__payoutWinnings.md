# Context: RCMarket._payoutWinnings

**Contract:** `RCMarket` (Inherits: IRCMarket, NativeMetaTransaction, Initializable)
**Signature:** `_payoutWinnings()`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** affiliateCut, artistCut, cardAffiliateCut, creatorCut, longestOwner, mode, rentCollectedPerCard, rentCollectedPerUserPerCard, timeHeld, totalRentCollected, totalTimeHeld, winnerCut, winningOutcome
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_winningsToTransfer > 0,Not a winner)`

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
    Node_1["1: NodeType.VARIABLE - _winningsToTransfer = 0"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _remainingCut = ((((uint256(1000) - artistCut) - affiliateCut) - cardAffiliateCut) - winnerCut) - creatorCut"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - longestOwner(winningOutcome) == msgSender() && winnerCut > 0"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.EXPRESSION - _winningsToTransfer = (totalRentCollected * winnerCut) / (1000)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - _remainingPot = 0"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - mode == Mode.SAFE_MODE"]
    Node_7 --> Node_8
    Node_7 --> Node_10
    Node_8["8: NodeType.EXPRESSION - _remainingPot = ((totalRentCollected - rentCollectedPerCard(winningOutcome)) * _remainingCut) / (1000)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _winningsToTransfer += rentCollectedPerUserPerCard(msgSender())(winningOutcome)"]
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - _remainingPot = (totalRentCollected * _remainingCut) / (1000)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - _winnersTimeHeld = timeHeld(winningOutcome)(msgSender())"]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - _numerator = _remainingPot * _winnersTimeHeld"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - _winningsToTransfer = _winningsToTransfer + (_numerator / totalTimeHeld(winningOutcome))"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - require(bool,string)(_winningsToTransfer > 0,Not a winner)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - _payout(msgSender(),_winningsToTransfer)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - LogWinningsPaid(msgSender(),_winningsToTransfer)"]
```

### Source Mapping
Declared in: `contracts/RCMarket.sol` on lines **503** to **534**

```solidity
    function _payoutWinnings() internal {
        uint256 _winningsToTransfer = 0;
        uint256 _remainingCut =
            ((((uint256(1000) - artistCut) - affiliateCut) - cardAffiliateCut) -
                winnerCut) - creatorCut;
        // calculate longest owner's extra winnings, if relevant
        if (longestOwner[winningOutcome] == msgSender() && winnerCut > 0) {
            _winningsToTransfer = (totalRentCollected * winnerCut) / (1000);
        }
        uint256 _remainingPot = 0;
        if (mode == Mode.SAFE_MODE) {
            // return all rent paid on winning card
            _remainingPot =
                ((totalRentCollected - rentCollectedPerCard[winningOutcome]) *
                    _remainingCut) /
                (1000);
            _winningsToTransfer += rentCollectedPerUserPerCard[msgSender()][
                winningOutcome
            ];
        } else {
            // calculate normal winnings, if any
            _remainingPot = (totalRentCollected * _remainingCut) / (1000);
        }
        uint256 _winnersTimeHeld = timeHeld[winningOutcome][msgSender()];
        uint256 _numerator = _remainingPot * _winnersTimeHeld;
        _winningsToTransfer =
            _winningsToTransfer +
            (_numerator / totalTimeHeld[winningOutcome]);
        require(_winningsToTransfer > 0, "Not a winner");
        _payout(msgSender(), _winningsToTransfer);
        emit LogWinningsPaid(msgSender(), _winningsToTransfer);
    }

```

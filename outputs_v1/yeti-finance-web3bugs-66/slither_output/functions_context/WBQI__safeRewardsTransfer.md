# Context: WBQI._safeRewardsTransfer

**Contract:** `WBQI` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `_safeRewardsTransfer(address,uint256,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** QI, globalAVAXRewardPending, globalQIRewardPending
- **Writes:** globalAVAXRewardPending, globalQIRewardPending

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20.TMP_123(uint256) = HIGH_LEVEL_CALL, dest:QI(IERC20), function:balanceOf, arguments:['TMP_122']  `
- `low-level-call`
- `IERC20.TMP_129(bool) = HIGH_LEVEL_CALL, dest:QI(IERC20), function:transfer, arguments:['_to', 'QIBalance']  `
- `IERC20.TMP_131(bool) = HIGH_LEVEL_CALL, dest:QI(IERC20), function:transfer, arguments:['_to', 'QIToSend']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - AVAXBalance = address(this).balance"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - QIBalance = QI.balanceOf(address(this))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - AVAXToSend > AVAXBalance"]
    Node_3 --> Node_4
    Node_3 --> Node_8
    Node_4["4: NodeType.EXPRESSION - globalAVAXRewardPending = globalAVAXRewardPending - AVAXBalance"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - (sent,data) = _to.call(value: AVAXBalance)()"]
    Node_7 --> Node_12
    Node_8["8: NodeType.EXPRESSION - globalAVAXRewardPending = globalAVAXRewardPending - AVAXToSend"]
    Node_8 --> Node_9
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.VARIABLE - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - (sent_scope_0,data_scope_1) = _to.call(value: AVAXToSend)()"]
    Node_11 --> Node_12
    Node_12["12: NodeType.ENDIF - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.IF - QIToSend > QIBalance"]
    Node_13 --> Node_14
    Node_13 --> Node_16
    Node_14["14: NodeType.EXPRESSION - globalQIRewardPending = globalQIRewardPending - QIBalance"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - QI.transfer(_to,QIBalance)"]
    Node_15 --> Node_18
    Node_16["16: NodeType.EXPRESSION - globalQIRewardPending = globalQIRewardPending - QIToSend"]
    Node_16 --> Node_17
    Node_17["17: NodeType.EXPRESSION - QI.transfer(_to,QIToSend)"]
    Node_17 --> Node_18
    Node_18["18: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WBQI.sol` on lines **248** to **266**

```solidity
    function _safeRewardsTransfer(address _to, uint256 AVAXToSend, uint256 QIToSend) internal {
        uint256 AVAXBalance = address(this).balance;
        uint256 QIBalance = QI.balanceOf(address(this));
       
        if (AVAXToSend > AVAXBalance) {
            globalAVAXRewardPending=globalAVAXRewardPending-AVAXBalance;
            (bool sent, bytes memory data) = _to.call{value: AVAXBalance}("");
        } else {
            globalAVAXRewardPending=globalAVAXRewardPending-AVAXToSend;
            (bool sent, bytes memory data) = _to.call{value: AVAXToSend}("");
        }
        if (QIToSend > QIBalance) {
            globalQIRewardPending=globalQIRewardPending-QIBalance;
            QI.transfer(_to, QIBalance);
        } else {
            globalQIRewardPending=globalQIRewardPending-QIToSend;
            QI.transfer(_to, QIToSend);
        }
    }

```

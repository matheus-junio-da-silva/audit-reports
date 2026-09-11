# Context: MochiProfileV0.changeCreditCap

**Contract:** `MochiProfileV0` (Inherits: IMochiProfile)
**Signature:** `changeCreditCap(address[],uint256[])`
**Method Selector ID:** `0x02d7edd8`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyGov`
  ```solidity
  modifier onlyGov() {
          require(msg.sender == engine.governance(), "!gov");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** creditCap

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
    Node_0 --> Node_7
    Node_1["1: NodeType.STARTLOOP - "]
    Node_1 --> Node_4
    Node_2["2: NodeType.ENDLOOP - "]
    Node_3["3: NodeType.VARIABLE - i = 0"]
    Node_3 --> Node_1
    Node_4["4: NodeType.IFLOOP - i < _assets.length"]
    Node_4 --> Node_5
    Node_4 --> Node_2
    Node_5["5: NodeType.EXPRESSION - creditCap(_assets(i)) = _caps(i)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - i ++"]
    Node_6 --> Node_4
    Node_7["7: NodeType.EXPRESSION - onlyGov()"]
    Node_7 --> Node_3
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/profile/MochiProfileV0.sol` on lines **91** to **98**

```solidity
    function changeCreditCap(
        address[] calldata _assets,
        uint256[] calldata _caps
    ) external onlyGov {
        for (uint256 i = 0; i < _assets.length; i++) {
            creditCap[_assets[i]] = _caps[i];
        }
    }

```

# Context: MochiCSSRv0.removeBluechip

**Contract:** `MochiCSSRv0` (Inherits: ICSSRRouter)
**Signature:** `removeBluechip(address[])`
**Method Selector ID:** `0x2af9a6c5`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyGov`
  ```solidity
  modifier onlyGov() {
          require(msg.sender == owned.governance(), "!gov");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** blueChip

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
    Node_5["5: NodeType.EXPRESSION - blueChip(_assets(i)) = false"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - i ++"]
    Node_6 --> Node_4
    Node_7["7: NodeType.EXPRESSION - onlyGov()"]
    Node_7 --> Node_3
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-cssr/contracts/MochiCSSRv0.sol` on lines **46** to **50**

```solidity
    function removeBluechip(address[] calldata _assets) external onlyGov {
        for(uint256 i = 0; i<_assets.length; i++){
            blueChip[_assets[i]] = false;
        }
    }

```

# Context: MochiProfileV0.changeAssetClass

**Contract:** `MochiProfileV0` (Inherits: IMochiProfile)
**Signature:** `changeAssetClass(address[],AssetClass[])`
**Method Selector ID:** `0x1f7709d9`
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
- **Writes:** _assetClass

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
    Node_5["5: NodeType.EXPRESSION - _assetClass(_assets(i)) = _classes(i)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - i ++"]
    Node_6 --> Node_4
    Node_7["7: NodeType.EXPRESSION - onlyGov()"]
    Node_7 --> Node_3
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/profile/MochiProfileV0.sol` on lines **82** to **89**

```solidity
    function changeAssetClass(
        address[] calldata _assets,
        AssetClass[] calldata _classes
    ) external override onlyGov {
        for (uint256 i = 0; i < _assets.length; i++) {
            _assetClass[_assets[i]] = _classes[i];
        }
    }

```

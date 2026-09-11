# Context: MochiProfileV0.registerAssetByGov

**Contract:** `MochiProfileV0` (Inherits: IMochiProfile)
**Signature:** `registerAssetByGov(address[],AssetClass[])`
**Method Selector ID:** `0x957853a9`
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
- **Reads:** engine
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IMochiVaultFactory.TMP_10(IMochiVault) = HIGH_LEVEL_CALL, dest:TMP_9(IMochiVaultFactory), function:deployVault, arguments:['REF_9']  `
- `IMochiEngine.TMP_9(IMochiVaultFactory) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:vaultFactory, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_8
    Node_1["1: NodeType.STARTLOOP - "]
    Node_1 --> Node_4
    Node_2["2: NodeType.ENDLOOP - "]
    Node_3["3: NodeType.VARIABLE - i = 0"]
    Node_3 --> Node_1
    Node_4["4: NodeType.IFLOOP - i < _asset.length"]
    Node_4 --> Node_5
    Node_4 --> Node_2
    Node_5["5: NodeType.EXPRESSION - _register(_asset(i),_classes(i))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - engine.vaultFactory().deployVault(_asset(i))"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - i ++"]
    Node_7 --> Node_4
    Node_8["8: NodeType.EXPRESSION - onlyGov()"]
    Node_8 --> Node_3
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/profile/MochiProfileV0.sol` on lines **64** to **72**

```solidity
    function registerAssetByGov(
        address[] calldata _asset,
        AssetClass[] calldata _classes
    ) external onlyGov {
        for (uint256 i = 0; i < _asset.length; i++) {
            _register(_asset[i], _classes[i]);
            engine.vaultFactory().deployVault(_asset[i]);
        }
    }

```

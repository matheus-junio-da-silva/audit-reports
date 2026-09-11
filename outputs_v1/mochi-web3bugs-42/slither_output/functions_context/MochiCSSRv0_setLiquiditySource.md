# Context: MochiCSSRv0.setLiquiditySource

**Contract:** `MochiCSSRv0` (Inherits: ICSSRRouter)
**Signature:** `setLiquiditySource(address,address[])`
**Method Selector ID:** `0xc4b73015`
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
- **Reads:** adapter
- **Writes:** liquiditySource

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(adapter[_adapter],!listed)`
- require/assert: `require(bool,string)(ICSSRAdapter(_adapter).support(_assets[i]),!supported)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ICSSRAdapter.TMP_21(bool) = HIGH_LEVEL_CALL, dest:TMP_20(ICSSRAdapter), function:support, arguments:['REF_17']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_9
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(adapter(_adapter),!listed)"]
    Node_1 --> Node_4
    Node_2["2: NodeType.STARTLOOP - "]
    Node_2 --> Node_5
    Node_3["3: NodeType.ENDLOOP - "]
    Node_4["4: NodeType.VARIABLE - i = 0"]
    Node_4 --> Node_2
    Node_5["5: NodeType.IFLOOP - i < _assets.length"]
    Node_5 --> Node_6
    Node_5 --> Node_3
    Node_6["6: NodeType.EXPRESSION - require(bool,string)(ICSSRAdapter(_adapter).support(_assets(i)),!supported)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - liquiditySource(_assets(i)) = _adapter"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - i ++"]
    Node_8 --> Node_5
    Node_9["9: NodeType.EXPRESSION - onlyGov()"]
    Node_9 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-cssr/contracts/MochiCSSRv0.sol` on lines **72** to **81**

```solidity
    function setLiquiditySource(address _adapter, address[] calldata _assets)
        external
        onlyGov
    {
        require(adapter[_adapter], "!listed");
        for(uint256 i = 0; i<_assets.length; i++){
            require(ICSSRAdapter(_adapter).support(_assets[i]), "!supported");
            liquiditySource[_assets[i]] = _adapter;
        }
    }

```

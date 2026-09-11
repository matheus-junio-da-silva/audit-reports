# Context: WAAVE.setAddresses

**Contract:** `WAAVE` (Inherits: IWAsset, ERC20_8, IERC20)
**Signature:** `setAddresses(address,address,address,address,address,address)`
**Method Selector ID:** `0x6cfb6bf9`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** addressesSet
- **Writes:** TML, TMR, YetiFinanceTreasury, activePool, addressesSet, defaultPool, stabilityPool

### Assertion Checks & Business Requirements
- require/assert: `require(bool)(! addressesSet)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool)(! addressesSet)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - activePool = _activePool"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - TML = _TML"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - TMR = _TMR"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - defaultPool = _defaultPool"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - stabilityPool = _stabilityPool"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - YetiFinanceTreasury = _YetiFinanceTreasury"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - addressesSet = true"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/AssetWrappers/WAAVE.sol` on lines **58** to **73**

```solidity
    function setAddresses(
        address _activePool,
        address _TML,
        address _TMR,
        address _defaultPool,
        address _stabilityPool,
        address _YetiFinanceTreasury) external {
        require(!addressesSet);
        activePool = _activePool;
        TML = _TML;
        TMR = _TMR;
        defaultPool = _defaultPool;
        stabilityPool = _stabilityPool;
        YetiFinanceTreasury = _YetiFinanceTreasury;
        addressesSet = true;
    }

```

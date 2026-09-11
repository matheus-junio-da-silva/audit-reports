# Context: Whitelist.setAddresses

**Contract:** `Whitelist` (Inherits: CheckContract, IBaseOracle, IWhitelist, Ownable)
**Signature:** `setAddresses(address,address,address,address,address)`
**Method Selector ID:** `0x5dd68acd`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(isOwner(), "CallerNotOwner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** addressesSet
- **Writes:** activePool, addressesSet, borrowerOperationsAddress, collSurplusPool, defaultPool, stabilityPool

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(! addressesSet,addresses already set)`

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
    Node_0 --> Node_13
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(! addressesSet,addresses already set)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - checkContract(_activePoolAddress)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - checkContract(_defaultPoolAddress)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - checkContract(_stabilityPoolAddress)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - checkContract(_collSurplusPoolAddress)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - checkContract(_borrowerOperationsAddress)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - activePool = IActivePool(_activePoolAddress)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - defaultPool = IDefaultPool(_defaultPoolAddress)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - stabilityPool = IStabilityPool(_stabilityPoolAddress)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - collSurplusPool = ICollSurplusPool(_collSurplusPoolAddress)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - borrowerOperationsAddress = _borrowerOperationsAddress"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - addressesSet = true"]
    Node_13["13: NodeType.EXPRESSION - onlyOwner()"]
    Node_13 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/Whitelist.sol` on lines **80** to **100**

```solidity
    function setAddresses(
        address _activePoolAddress,
        address _defaultPoolAddress,
        address _stabilityPoolAddress,
        address _collSurplusPoolAddress,
        address _borrowerOperationsAddress
    ) external override onlyOwner {
        require(!addressesSet, "addresses already set");
        checkContract(_activePoolAddress);
        checkContract(_defaultPoolAddress);
        checkContract(_stabilityPoolAddress);
        checkContract(_collSurplusPoolAddress);
        checkContract(_borrowerOperationsAddress);

        activePool = IActivePool(_activePoolAddress);
        defaultPool = IDefaultPool(_defaultPoolAddress);
        stabilityPool = IStabilityPool(_stabilityPoolAddress);
        collSurplusPool = ICollSurplusPool(_collSurplusPoolAddress);
        borrowerOperationsAddress = _borrowerOperationsAddress;
        addressesSet = true;
    }

```

# Context: CollSurplusPool.setAddresses

**Contract:** `CollSurplusPool` (Inherits: LiquityBase, YetiCustomBase, BaseMath, ILiquityBase, ICollSurplusPool, ICollateralReceiver, CheckContract, Ownable)
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
- **Reads:** None
- **Writes:** activePoolAddress, borrowerOperationsAddress, troveManagerAddress, troveManagerRedemptionsAddress, whitelist

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
    Node_0 --> Node_15
    Node_1["1: NodeType.EXPRESSION - checkContract(_borrowerOperationsAddress)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - checkContract(_troveManagerAddress)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - checkContract(_troveManagerRedemptionsAddress)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - checkContract(_activePoolAddress)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - checkContract(_whitelistAddress)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - borrowerOperationsAddress = _borrowerOperationsAddress"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - troveManagerAddress = _troveManagerAddress"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - troveManagerRedemptionsAddress = _troveManagerRedemptionsAddress"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - activePoolAddress = _activePoolAddress"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - whitelist = IWhitelist(_whitelistAddress)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - BorrowerOperationsAddressChanged(_borrowerOperationsAddress)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - TroveManagerAddressChanged(_troveManagerAddress)"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - ActivePoolAddressChanged(_activePoolAddress)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - _renounceOwnership()"]
    Node_15["15: NodeType.EXPRESSION - onlyOwner()"]
    Node_15 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/CollSurplusPool.sol` on lines **45** to **69**

```solidity
    function setAddresses(
        address _borrowerOperationsAddress,
        address _troveManagerAddress,
        address _troveManagerRedemptionsAddress,
        address _activePoolAddress,
        address _whitelistAddress
    ) external override onlyOwner {
        checkContract(_borrowerOperationsAddress);
        checkContract(_troveManagerAddress);
        checkContract(_troveManagerRedemptionsAddress);
        checkContract(_activePoolAddress);
        checkContract(_whitelistAddress);

        borrowerOperationsAddress = _borrowerOperationsAddress;
        troveManagerAddress = _troveManagerAddress;
        troveManagerRedemptionsAddress = _troveManagerRedemptionsAddress;
        activePoolAddress = _activePoolAddress;
        whitelist = IWhitelist(_whitelistAddress);

        emit BorrowerOperationsAddressChanged(_borrowerOperationsAddress);
        emit TroveManagerAddressChanged(_troveManagerAddress);
        emit ActivePoolAddressChanged(_activePoolAddress);

        _renounceOwnership();
    }

```

# Context: SortedTroves.setParams

**Contract:** `SortedTroves` (Inherits: ISortedTroves, CheckContract, Ownable)
**Signature:** `setParams(uint256,address,address,address)`
**Method Selector ID:** `0x2cf404dc`
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
- **Reads:** data
- **Writes:** borrowerOperationsAddress, data, troveManagerAddress, troveManagerRedemptionsAddress

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_size != 0,SortedTroves: Size can’t be zero)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(_size != 0,SortedTroves: Size can’t be zero)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - checkContract(_troveManagerAddress)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - checkContract(_borrowerOperationsAddress)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - checkContract(_troveManagerRedemptionsAddress)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - data.maxSize = _size"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - troveManagerAddress = _troveManagerAddress"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - borrowerOperationsAddress = _borrowerOperationsAddress"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - troveManagerRedemptionsAddress = _troveManagerRedemptionsAddress"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - TroveManagerAddressChanged(_troveManagerAddress)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - BorrowerOperationsAddressChanged(_borrowerOperationsAddress)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - TroveManagerRedemptionsAddressChanged(_troveManagerRedemptionsAddress)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - _renounceOwnership()"]
    Node_13["13: NodeType.EXPRESSION - onlyOwner()"]
    Node_13 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/SortedTroves.sol` on lines **87** to **108**

```solidity
    function setParams(uint256 _size, 
        address _troveManagerAddress, 
        address _borrowerOperationsAddress,
        address _troveManagerRedemptionsAddress) 
        external override onlyOwner {
        require(_size != 0, "SortedTroves: Size can’t be zero");
        checkContract(_troveManagerAddress);
        checkContract(_borrowerOperationsAddress);
        checkContract(_troveManagerRedemptionsAddress);

        data.maxSize = _size;

        troveManagerAddress = _troveManagerAddress;
        borrowerOperationsAddress = _borrowerOperationsAddress;
        troveManagerRedemptionsAddress = _troveManagerRedemptionsAddress;

        emit TroveManagerAddressChanged(_troveManagerAddress);
        emit BorrowerOperationsAddressChanged(_borrowerOperationsAddress);
        emit TroveManagerRedemptionsAddressChanged(_troveManagerRedemptionsAddress);

        _renounceOwnership();
    }

```

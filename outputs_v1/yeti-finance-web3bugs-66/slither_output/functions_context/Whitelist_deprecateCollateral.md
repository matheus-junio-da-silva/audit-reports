# Context: Whitelist.deprecateCollateral

**Contract:** `Whitelist` (Inherits: CheckContract, IBaseOracle, IWhitelist, Ownable)
**Signature:** `deprecateCollateral(address)`
**Method Selector ID:** `0xc3b7f9fb`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `exists`
  ```solidity
  modifier exists(address _collateral) {
          _exists(_collateral);
          _;
      }
  ```
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(isOwner(), "CallerNotOwner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** collateralParams
- **Writes:** collateralParams

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(collateralParams[_collateral].active,collateral already deprecated)`

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
    Node_0 --> Node_5
    Node_1["1: NodeType.EXPRESSION - checkContract(_collateral)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(collateralParams(_collateral).active,collateral already deprecated)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - collateralParams(_collateral).active = false"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - CollateralDeprecated(_collateral)"]
    Node_5["5: NodeType.EXPRESSION - exists(_collateral)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - onlyOwner()"]
    Node_6 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/Whitelist.sol` on lines **148** to **157**

```solidity
    function deprecateCollateral(address _collateral) external exists(_collateral) onlyOwner {
        checkContract(_collateral);

        require(collateralParams[_collateral].active, "collateral already deprecated");

        collateralParams[_collateral].active = false;

        // throw event
        emit CollateralDeprecated(_collateral);
    }

```

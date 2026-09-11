# Context: Vader.claimGrant

**Contract:** `Vader` (Inherits: Ownable, ERC20, IERC20Metadata, IERC20, Context, ProtocolConstants, IVader)
**Signature:** `claimGrant(address,uint256)`
**Method Selector ID:** `0xe9ba3184`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyDAO`
  ```solidity
  modifier onlyDAO() {
          _onlyDAO();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(amount != 0,Vader::claimGrant: Non-Zero Amount Required)`

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
    Node_0 --> Node_4
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(amount != 0,Vader::claimGrant: Non-Zero Amount Required)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - GrantClaimed(beneficiary,amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - ERC20._transfer(address(this),beneficiary,amount)"]
    Node_4["4: NodeType.EXPRESSION - onlyDAO()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/tokens/Vader.sol` on lines **200** to **204**

```solidity
    function claimGrant(address beneficiary, uint256 amount) external onlyDAO {
        require(amount != 0, "Vader::claimGrant: Non-Zero Amount Required");
        emit GrantClaimed(beneficiary, amount);
        ERC20._transfer(address(this), beneficiary, amount);
    }

```

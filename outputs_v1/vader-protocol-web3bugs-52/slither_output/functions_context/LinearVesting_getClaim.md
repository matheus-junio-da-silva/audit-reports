# Context: LinearVesting.getClaim

**Contract:** `LinearVesting` (Inherits: Ownable, Context, ProtocolConstants, ILinearVesting)
**Signature:** `getClaim() returns (uint256)`
**Method Selector ID:** `0x844a8c69`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `hasStarted`
  ```solidity
  modifier hasStarted() {
          _hasStarted();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** vest
- **Writes:** None

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
    Node_0 --> Node_3
    Node_1["1: NodeType.VARIABLE - vester = vest(msg.sender)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.RETURN - _getClaim(vester.amount,vester.lastClaim)"]
    Node_3["3: NodeType.EXPRESSION - hasStarted()"]
    Node_3 --> Node_1
    Node_4["4: NodeType.RETURN - vestedAmount"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/tokens/vesting/LinearVesting.sol` on lines **96** to **105**

```solidity
    function getClaim()
        external
        view
        override
        hasStarted
        returns (uint256 vestedAmount)
    {
        Vester memory vester = vest[msg.sender];
        return _getClaim(vester.amount, vester.lastClaim);
    }

```

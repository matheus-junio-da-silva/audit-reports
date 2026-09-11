# Context: SavingsAccount.decreaseAllowance

**Contract:** `SavingsAccount` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, ISavingsAccount)
**Signature:** `decreaseAllowance(uint256,address,address)`
**Method Selector ID:** `0x7851a2d8`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** allowance
- **Writes:** allowance

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_2651(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['REF_1230', '_amount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _updatedAllowance = allowance(msg.sender)(_token)(_to).sub(_amount)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - allowance(msg.sender)(_token)(_to) = _updatedAllowance"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - Approved(_token,msg.sender,_to,_updatedAllowance)"]
```

### Source Mapping
Declared in: `contracts/SavingsAccount/SavingsAccount.sol` on lines **359** to **368**

```solidity
    function decreaseAllowance(
        uint256 _amount,
        address _token,
        address _to
    ) external override {
        uint256 _updatedAllowance = allowance[msg.sender][_token][_to].sub(_amount);
        allowance[msg.sender][_token][_to] = _updatedAllowance;

        emit Approved(_token, msg.sender, _to, _updatedAllowance);
    }

```

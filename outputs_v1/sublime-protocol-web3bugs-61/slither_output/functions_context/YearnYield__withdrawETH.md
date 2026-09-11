# Context: YearnYield._withdrawETH

**Contract:** `YearnYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `_withdrawETH(address,uint256) returns (uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IyVault.HIGH_LEVEL_CALL, dest:TMP_4026(IyVault), function:withdrawETH, arguments:['amount']  `
- `SafeMath.TMP_4030(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['TMP_4029', 'ethBalance'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - ethBalance = address(this).balance"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - IyVault(vault).withdrawETH(amount)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - received = address(this).balance.sub(ethBalance)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - received"]
```

### Source Mapping
Declared in: `contracts/yield/YearnYield.sol` on lines **217** to **223**

```solidity
    function _withdrawETH(address vault, uint256 amount) internal returns (uint256 received) {
        uint256 ethBalance = address(this).balance;

        IyVault(vault).withdrawETH(amount);

        received = address(this).balance.sub(ethBalance);
    }

```

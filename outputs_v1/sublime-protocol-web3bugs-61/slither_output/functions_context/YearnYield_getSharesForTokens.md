# Context: YearnYield.getSharesForTokens

**Contract:** `YearnYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `getSharesForTokens(uint256,address) returns (uint256)`
**Method Selector ID:** `0x934a5252`
**Visibility:** `external`
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
- `SafeMath.TMP_3999(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['amount', '1000000000000000000'] `
- `SafeMath.TMP_4001(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_3999', 'TMP_4000'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - shares = (amount.mul(1e18)).div(getTokensForShares(1e18,asset))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.RETURN - shares"]
```

### Source Mapping
Declared in: `contracts/yield/YearnYield.sol` on lines **189** to **191**

```solidity
    function getSharesForTokens(uint256 amount, address asset) external view override returns (uint256 shares) {
        shares = (amount.mul(1e18)).div(getTokensForShares(1e18, asset));
    }

```

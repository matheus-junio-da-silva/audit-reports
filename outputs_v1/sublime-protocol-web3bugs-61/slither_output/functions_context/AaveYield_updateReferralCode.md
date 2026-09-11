# Context: AaveYield.updateReferralCode

**Contract:** `AaveYield` (Inherits: ReentrancyGuard, OwnableUpgradeable, ContextUpgradeable, Initializable, IYield)
**Signature:** `updateReferralCode(uint16)`
**Method Selector ID:** `0x059bd0e7`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(owner() == _msgSender(), "Ownable: caller is not the owner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** None
- **Writes:** referralCode

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
    Node_1["1: NodeType.EXPRESSION - referralCode = _referralCode"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - ReferralCodeUpdated(_referralCode)"]
    Node_3["3: NodeType.EXPRESSION - onlyOwner()"]
    Node_3 --> Node_1
```

### Source Mapping
Declared in: `contracts/yield/AaveYield.sol` on lines **160** to **163**

```solidity
    function updateReferralCode(uint16 _referralCode) external onlyOwner {
        referralCode = _referralCode;
        emit ReferralCodeUpdated(_referralCode);
    }

```

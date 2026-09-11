# Context: Verification.removeVerifier

**Contract:** `Verification` (Inherits: OwnableUpgradeable, ContextUpgradeable, IVerification, Initializable)
**Signature:** `removeVerifier(address)`
**Method Selector ID:** `0xca2dfd0a`
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
- **Reads:** verifiers
- **Writes:** verifiers

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(verifiers[_verifier],V:AV-Verifier doesnt exist)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(verifiers(_verifier),V:AV-Verifier doesnt exist)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - delete verifiers(_verifier)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - VerifierRemoved(_verifier)"]
    Node_4["4: NodeType.EXPRESSION - onlyOwner()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `contracts/Verification/Verification.sol` on lines **78** to **82**

```solidity
    function removeVerifier(address _verifier) external onlyOwner {
        require(verifiers[_verifier], 'V:AV-Verifier doesnt exist');
        delete verifiers[_verifier];
        emit VerifierRemoved(_verifier);
    }

```

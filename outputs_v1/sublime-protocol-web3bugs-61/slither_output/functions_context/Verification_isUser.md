# Context: Verification.isUser

**Contract:** `Verification` (Inherits: OwnableUpgradeable, ContextUpgradeable, IVerification, Initializable)
**Signature:** `isUser(address,address) returns (bool)`
**Method Selector ID:** `0x02d43dc8`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** linkedAddresses, masterAddresses
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
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _linkedAddress = linkedAddresses(_user)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _masterActivatesAt = masterAddresses(_linkedAddress.masterAddress)(_verifier)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - _linkedAddress.masterAddress == address(0) || _linkedAddress.activatesAt > block.timestamp || _masterActivatesAt == 0 || _masterActivatesAt > block.timestamp"]
    Node_3 --> Node_4
    Node_3 --> Node_5
    Node_4["4: NodeType.RETURN - false"]
    Node_5["5: NodeType.ENDIF - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - true"]
```

### Source Mapping
Declared in: `contracts/Verification/Verification.sol` on lines **161** to **173**

```solidity
    function isUser(address _user, address _verifier) external view override returns (bool) {
        LinkedAddress memory _linkedAddress = linkedAddresses[_user];
        uint256 _masterActivatesAt = masterAddresses[_linkedAddress.masterAddress][_verifier];
        if (
            _linkedAddress.masterAddress == address(0) ||
            _linkedAddress.activatesAt > block.timestamp ||
            _masterActivatesAt == 0 ||
            _masterActivatesAt > block.timestamp
        ) {
            return false;
        }
        return true;
    }

```

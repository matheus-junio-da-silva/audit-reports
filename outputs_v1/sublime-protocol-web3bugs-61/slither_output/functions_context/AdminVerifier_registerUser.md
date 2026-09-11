# Context: AdminVerifier.registerUser

**Contract:** `AdminVerifier` (Inherits: OwnableUpgradeable, ContextUpgradeable, IVerifier, Initializable)
**Signature:** `registerUser(address,string,bool)`
**Method Selector ID:** `0x16596d7f`
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
- **Reads:** userData, verification
- **Writes:** userData

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(bytes(userData[_user]).length == 0,User already exists)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IVerification.HIGH_LEVEL_CALL, dest:verification(IVerification), function:registerMasterAddress, arguments:['_user', '_isMasterLinked']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_5
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(bytes(userData(_user)).length == 0,User already exists)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - verification.registerMasterAddress(_user,_isMasterLinked)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - userData(_user) = _metadata"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - UserRegistered(_user,_isMasterLinked,_metadata)"]
    Node_5["5: NodeType.EXPRESSION - onlyOwner()"]
    Node_5 --> Node_1
```

### Source Mapping
Declared in: `contracts/Verification/adminVerifier.sol` on lines **41** to **50**

```solidity
    function registerUser(
        address _user,
        string memory _metadata,
        bool _isMasterLinked
    ) external onlyOwner {
        require(bytes(userData[_user]).length == 0, 'User already exists');
        verification.registerMasterAddress(_user, _isMasterLinked);
        userData[_user] = _metadata;
        emit UserRegistered(_user, _isMasterLinked, _metadata);
    }

```

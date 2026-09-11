# Context: Verification.registerMasterAddress

**Contract:** `Verification` (Inherits: OwnableUpgradeable, ContextUpgradeable, IVerification, Initializable)
**Signature:** `registerMasterAddress(address,bool)`
**Method Selector ID:** `0xa94413a1`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyVerifier`
  ```solidity
  modifier onlyVerifier() {
          require(verifiers[msg.sender], 'Invalid verifier');
          _;
      }
  ```

### State Variables Interaction
- **Reads:** activationDelay, masterAddresses
- **Writes:** masterAddresses

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(masterAddresses[_masterAddress][msg.sender] == 0,V:RMA-Already registered)`

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
    Node_0 --> Node_8
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(masterAddresses(_masterAddress)(msg.sender) == 0,V:RMA-Already registered)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _masterAddressActivatesAt = block.timestamp + activationDelay"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - masterAddresses(_masterAddress)(msg.sender) = _masterAddressActivatesAt"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - UserRegistered(_masterAddress,msg.sender,_masterAddressActivatesAt)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.IF - _isMasterLinked"]
    Node_5 --> Node_6
    Node_5 --> Node_7
    Node_6["6: NodeType.EXPRESSION - _linkAddress(_masterAddress,_masterAddress)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.ENDIF - "]
    Node_8["8: NodeType.EXPRESSION - onlyVerifier()"]
    Node_8 --> Node_1
```

### Source Mapping
Declared in: `contracts/Verification/Verification.sol` on lines **89** to **98**

```solidity
    function registerMasterAddress(address _masterAddress, bool _isMasterLinked) external override onlyVerifier {
        require(masterAddresses[_masterAddress][msg.sender] == 0, 'V:RMA-Already registered');
        uint256 _masterAddressActivatesAt = block.timestamp + activationDelay;
        masterAddresses[_masterAddress][msg.sender] = _masterAddressActivatesAt;
        emit UserRegistered(_masterAddress, msg.sender, _masterAddressActivatesAt);

        if (_isMasterLinked) {
            _linkAddress(_masterAddress, _masterAddress);
        }
    }

```

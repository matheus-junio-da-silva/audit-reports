# Context: RCNftHubL1._checkRole

**Contract:** `RCNftHubL1` (Inherits: IRCNftHubL1, NativeMetaTransaction, AccessControl, ERC721URIStorage, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, IAccessControl, Ownable, Context)
**Signature:** `_checkRole(bytes32,address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(string)(string(abi.encodePacked(AccessControl: account ,Strings.toHexString(uint160(account),20), is missing role ,Strings.toHexString(uint256(role),32))))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `Strings.TMP_1868(string) = LIBRARY_CALL, dest:Strings, function:Strings.toHexString(uint256,uint256), arguments:['TMP_1867', '32'] `
- `Strings.TMP_1866(string) = LIBRARY_CALL, dest:Strings, function:Strings.toHexString(uint256,uint256), arguments:['TMP_1865', '20'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - ! hasRole(role,account)"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - revert(string)(string(abi.encodePacked(AccessControl: account ,Strings.toHexString(uint160(account),20), is missing role ,Strings.toHexString(uint256(role),32))))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `node_modules/@openzeppelin/contracts/access/AccessControl.sol` on lines **132** to **141**

```solidity
    function _checkRole(bytes32 role, address account) internal view {
        if(!hasRole(role, account)) {
            revert(string(abi.encodePacked(
                "AccessControl: account ",
                Strings.toHexString(uint160(account), 20),
                " is missing role ",
                Strings.toHexString(uint256(role), 32)
            )));
        }
    }

```

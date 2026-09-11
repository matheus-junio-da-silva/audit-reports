# Context: RCNftHubL2.deposit

**Contract:** `RCNftHubL2` (Inherits: IRCNftHubL2, NativeMetaTransaction, AccessControl, ERC721URIStorage, ERC721, IERC721Metadata, IERC721, ERC165, IERC165, IAccessControl, Ownable, Context)
**Signature:** `deposit(address,bytes)`
**Method Selector ID:** `0xcf2c52cb`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyRole`
  ```solidity
  modifier onlyRole(bytes32 role) {
          _checkRole(role, _msgSender());
          _;
      }
  ```

### State Variables Interaction
- **Reads:** DEPOSITOR_ROLE
- **Writes:** withdrawnTokens

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
    Node_0 --> Node_15
    Node_1["1: NodeType.IF - depositData.length == 32"]
    Node_1 --> Node_2
    Node_1 --> Node_5
    Node_2["2: NodeType.VARIABLE - tokenId = abi.decode(depositData,(uint256))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - withdrawnTokens(tokenId) = false"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - _mint(user,tokenId)"]
    Node_4 --> Node_14
    Node_5["5: NodeType.VARIABLE - tokenIds = abi.decode(depositData,(uint256()))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - length = tokenIds.length"]
    Node_6 --> Node_9
    Node_7["7: NodeType.STARTLOOP - "]
    Node_7 --> Node_10
    Node_8["8: NodeType.ENDLOOP - "]
    Node_8 --> Node_14
    Node_9["9: NodeType.VARIABLE - "]
    Node_9 --> Node_7
    Node_10["10: NodeType.IFLOOP - i < length"]
    Node_10 --> Node_11
    Node_10 --> Node_8
    Node_11["11: NodeType.EXPRESSION - withdrawnTokens(tokenIds(i)) = false"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - _mint(user,tokenIds(i))"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - i ++"]
    Node_13 --> Node_10
    Node_14["14: NodeType.ENDIF - "]
    Node_15["15: NodeType.EXPRESSION - onlyRole(DEPOSITOR_ROLE)"]
    Node_15 --> Node_1
```

### Source Mapping
Declared in: `contracts/nfthubs/RCNftHubL2.sol` on lines **135** to **155**

```solidity
    function deposit(address user, bytes calldata depositData)
        external
        override
        onlyRole(DEPOSITOR_ROLE)
    {
        // deposit single
        if (depositData.length == 32) {
            uint256 tokenId = abi.decode(depositData, (uint256));
            withdrawnTokens[tokenId] = false;
            _mint(user, tokenId);

            // deposit batch
        } else {
            uint256[] memory tokenIds = abi.decode(depositData, (uint256[]));
            uint256 length = tokenIds.length;
            for (uint256 i; i < length; i++) {
                withdrawnTokens[tokenIds[i]] = false;
                _mint(user, tokenIds[i]);
            }
        }
    }

```

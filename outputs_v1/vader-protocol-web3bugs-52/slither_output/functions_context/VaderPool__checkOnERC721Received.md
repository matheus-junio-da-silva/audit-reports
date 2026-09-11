# Context: VaderPool._checkOnERC721Received

**Contract:** `VaderPool` (Inherits: BasePool, ReentrancyGuard, Ownable, ERC721, IERC721Metadata, IVaderPool, IERC721, ERC165, IERC165, Context, GasThrottle, ProtocolConstants, IBasePool)
**Signature:** `_checkOnERC721Received(address,address,uint256,bytes) returns (bool)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `private`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(string)(ERC721: transfer to non ERC721Receiver implementer)`
- revert: `revert(uint256,uint256)(32 + reason,mload(uint256)(reason))`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC721Receiver.TMP_1013(bytes4) = HIGH_LEVEL_CALL, dest:TMP_1011(IERC721Receiver), function:onERC721Received, arguments:['TMP_1012', 'from', 'tokenId', 'data']  `
- `Address.TMP_1010(bool) = LIBRARY_CALL, dest:Address, function:Address.isContract(address), arguments:['to'] `
- `TMP_1016(None) = SOLIDITY_CALL revert(string)(ERC721: transfer to non ERC721Receiver implementer)`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - to.isContract()"]
    Node_1 --> Node_2
    Node_1 --> Node_12
    Node_2["2: NodeType.TRY - retval = IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,data)"]
    Node_2 --> Node_3
    Node_2 --> Node_5
    Node_2 --> Node_13
    Node_3["3: NodeType.CATCH - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.RETURN - retval == IERC721Receiver.onERC721Received.selector"]
    Node_5["5: NodeType.CATCH - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - reason.length == 0"]
    Node_6 --> Node_7
    Node_6 --> Node_8
    Node_7["7: NodeType.EXPRESSION - revert(string)(ERC721: transfer to non ERC721Receiver implementer)"]
    Node_7 --> Node_11
    Node_8["8: NodeType.ASSEMBLY - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - revert(uint256,uint256)(32 + reason,mload(uint256)(reason))"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDASSEMBLY - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_13
    Node_12["12: NodeType.RETURN - true"]
    Node_13["13: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol` on lines **399** to **421**

```solidity
    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) private returns (bool) {
        if (to.isContract()) {
            try IERC721Receiver(to).onERC721Received(_msgSender(), from, tokenId, data) returns (bytes4 retval) {
                return retval == IERC721Receiver.onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert("ERC721: transfer to non ERC721Receiver implementer");
                } else {
                    /// @solidity memory-safe-assembly
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true;
        }
    }

```

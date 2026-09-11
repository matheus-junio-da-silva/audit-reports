# Context: PriceOracle.getDecimals

**Contract:** `PriceOracle` (Inherits: IPriceOracle, OwnableUpgradeable, ContextUpgradeable, Initializable)
**Signature:** `getDecimals(address) returns (uint8)`
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
- `ERC20.TMP_2401(uint8) = HIGH_LEVEL_CALL, dest:TMP_2400(ERC20), function:decimals, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - _token == address(0)"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.RETURN - 18"]
    Node_3["3: NodeType.ENDIF - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.TRY - v = ERC20(_token).decimals()"]
    Node_4 --> Node_5
    Node_4 --> Node_7
    Node_4 --> Node_9
    Node_5["5: NodeType.CATCH - "]
    Node_5 --> Node_6
    Node_6["6: NodeType.RETURN - v"]
    Node_7["7: NodeType.CATCH - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - 0"]
    Node_9["9: NodeType.CATCH - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.RETURN - 0"]
```

### Source Mapping
Declared in: `contracts/PriceOracle.sol` on lines **101** to **113**

```solidity
    function getDecimals(address _token) internal view returns (uint8) {
        if (_token == address(0)) {
            return 18;
        }

        try ERC20(_token).decimals() returns (uint8 v) {
            return v;
        } catch Error(string memory) {
            return 0;
        } catch (bytes memory) {
            return 0;
        }
    }

```

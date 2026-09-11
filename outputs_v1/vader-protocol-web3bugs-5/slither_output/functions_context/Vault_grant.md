# Context: Vault.grant

**Contract:** `Vault` (Inherits: None)
**Signature:** `grant(address,uint256)`
**Method Selector ID:** `0x6370920e`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyDAO`
  ```solidity
  modifier onlyDAO() {
          require(msg.sender == DAO(), "Not DAO");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** USDV, lastGranted, minGrantTime
- **Writes:** lastGranted

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)((block.timestamp - lastGranted) >= minGrantTime,not too fast)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `iERC20.TMP_1198(bool) = HIGH_LEVEL_CALL, dest:TMP_1197(iERC20), function:transfer, arguments:['recipient', 'amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_4
    Node_1["1: NodeType.EXPRESSION - require(bool,string)((block.timestamp - lastGranted) >= minGrantTime,not too fast)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - lastGranted = block.timestamp"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - iERC20(USDV).transfer(recipient,amount)"]
    Node_4["4: NodeType.EXPRESSION - onlyDAO()"]
    Node_4 --> Node_1
```

### Source Mapping
Declared in: `contracts/Vault.sol` on lines **68** to **72**

```solidity
    function grant(address recipient, uint amount) public onlyDAO {
        require((block.timestamp - lastGranted) >= minGrantTime, "not too fast");
        lastGranted = block.timestamp;
        iERC20(USDV).transfer(recipient, amount); 
    }

```

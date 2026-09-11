# Context: XVader.enter

**Contract:** `XVader` (Inherits: ReentrancyGuard, ERC20Votes, IERC5805, IVotes, IERC6372, ERC20Permit, EIP712, IERC5267, IERC20Permit, ERC20, IERC20Metadata, IERC20, Context, ProtocolConstants)
**Signature:** `enter(uint256)`
**Method Selector ID:** `0xa59f3e0c`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `nonReentrant`
  ```solidity
  modifier nonReentrant() {
          _nonReentrantBefore();
          _;
          _nonReentrantAfter();
      }
  ```

### State Variables Interaction
- **Reads:** vader
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IERC20.TMP_1159(bool) = HIGH_LEVEL_CALL, dest:vader(IERC20), function:transferFrom, arguments:['msg.sender', 'TMP_1158', '_amount']  `
- `IERC20.TMP_1155(uint256) = HIGH_LEVEL_CALL, dest:vader(IERC20), function:balanceOf, arguments:['TMP_1154']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_6
    Node_1["1: NodeType.VARIABLE - totalVader = vader.balanceOf(address(this))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - totalShares = totalSupply()"]
    Node_2 --> Node_7
    Node_4["4: NodeType.EXPRESSION - _mint(msg.sender,xVADERToMint)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - vader.transferFrom(msg.sender,address(this),_amount)"]
    Node_6["6: NodeType.EXPRESSION - nonReentrant()"]
    Node_6 --> Node_1
    Node_7["7: NodeType.IF - totalShares == 0 || totalVader == 0"]
    Node_7 --> Node_8
    Node_7 --> Node_9
    Node_8["8: NodeType.EXPRESSION - xVADERToMint = _amount"]
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - xVADERToMint = (_amount * totalShares) / totalVader"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_4
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/x-vader/XVader.sol` on lines **29** to **47**

```solidity
    function enter(uint256 _amount) external nonReentrant {
        // Gets the amount of vader locked in the contract
        uint256 totalVader = vader.balanceOf(address(this));
        // Gets the amount of xVader in existence
        uint256 totalShares = totalSupply();

        uint256 xVADERToMint = totalShares == 0 || totalVader == 0
            // If no xVader exists, mint it 1:1 to the amount put in
            ? _amount
            // Calculate and mint the amount of xVader the vader is worth.
            // The ratio will change overtime, as xVader is burned/minted and
            // vader deposited + gained from fees / withdrawn.
            : (_amount * totalShares) / totalVader;

        _mint(msg.sender, xVADERToMint);

        // Lock the vader in the contract
        vader.transferFrom(msg.sender, address(this), _amount);
    }

```

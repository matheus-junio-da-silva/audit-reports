# Context: LinearVesting.claim

**Contract:** `LinearVesting` (Inherits: Ownable, Context, ProtocolConstants, ILinearVesting)
**Signature:** `claim() returns (uint256)`
**Method Selector ID:** `0x4e71d92d`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `hasStarted`
  ```solidity
  modifier hasStarted() {
          _hasStarted();
          _;
      }
  ```

### State Variables Interaction
- **Reads:** vader, vest
- **Writes:** vest

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(vester.start == 0,LinearVesting::claim: Incorrect Vesting Type)`
- require/assert: `require(bool,string)(vestedAmount != 0,LinearVesting::claim: Nothing to claim)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['vader', 'msg.sender', 'vestedAmount'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_10
    Node_1["1: NodeType.VARIABLE - vester = vest(msg.sender)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(vester.start == 0,LinearVesting::claim: Incorrect Vesting Type)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - vestedAmount = _getClaim(vester.amount,vester.lastClaim)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(vestedAmount != 0,LinearVesting::claim: Nothing to claim)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - vester.amount -= uint192(vestedAmount)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - vester.lastClaim = uint64(block.timestamp)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - vest(msg.sender) = vester"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - Vested(msg.sender,vestedAmount)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - vader.safeTransfer(msg.sender,vestedAmount)"]
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - hasStarted()"]
    Node_10 --> Node_1
    Node_11["11: NodeType.RETURN - vestedAmount"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/tokens/vesting/LinearVesting.sol` on lines **120** to **145**

```solidity
    function claim()
        external
        override
        hasStarted
        returns (uint256 vestedAmount)
    {
        Vester memory vester = vest[msg.sender];

        require(
            vester.start == 0,
            "LinearVesting::claim: Incorrect Vesting Type"
        );

        vestedAmount = _getClaim(vester.amount, vester.lastClaim);

        require(vestedAmount != 0, "LinearVesting::claim: Nothing to claim");

        vester.amount -= uint192(vestedAmount);
        vester.lastClaim = uint64(block.timestamp);

        vest[msg.sender] = vester;

        emit Vested(msg.sender, vestedAmount);

        vader.safeTransfer(msg.sender, vestedAmount);
    }

```

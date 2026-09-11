# Context: Pool.requestMarginCall

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `requestMarginCall()`
**Method Selector ID:** `0xbda9e06b`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `isLender`
  ```solidity
  modifier isLender(address _lender) {
          require(balanceOf(_lender) != 0, 'IL1');
          _;
      }
  ```

### State Variables Interaction
- **Reads:** lenders, poolConstants, poolFactory, poolVariables
- **Writes:** lenders

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(poolVariables.loanStatus == LoanStatus.ACTIVE,RMC1)`
- require/assert: `require(bool,string)(getMarginCallEndTime(msg.sender) == 0,RMC2)`
- require/assert: `require(bool,string)(poolConstants.idealCollateralRatio > getCurrentCollateralRatio(msg.sender),RMC3)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMathUpgradeable.TMP_1787(uint256) = LIBRARY_CALL, dest:SafeMathUpgradeable, function:SafeMathUpgradeable.add(uint256,uint256), arguments:['block.timestamp', 'TMP_1786'] `
- `IPoolFactory.TMP_1786(uint256) = HIGH_LEVEL_CALL, dest:_poolFactory(IPoolFactory), function:marginCallDuration, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_7
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(poolVariables.loanStatus == LoanStatus.ACTIVE,RMC1)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _poolFactory = IPoolFactory(poolFactory)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(getMarginCallEndTime(msg.sender) == 0,RMC2)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(poolConstants.idealCollateralRatio > getCurrentCollateralRatio(msg.sender),RMC3)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - lenders(msg.sender).marginCallEndTime = block.timestamp.add(_poolFactory.marginCallDuration())"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - MarginCalled(msg.sender)"]
    Node_7["7: NodeType.EXPRESSION - isLender(msg.sender)"]
    Node_7 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/Pool.sol` on lines **656** to **666**

```solidity
    function requestMarginCall() external isLender(msg.sender) {
        require(poolVariables.loanStatus == LoanStatus.ACTIVE, 'RMC1');

        IPoolFactory _poolFactory = IPoolFactory(poolFactory);
        require(getMarginCallEndTime(msg.sender) == 0, 'RMC2');
        require(poolConstants.idealCollateralRatio > getCurrentCollateralRatio(msg.sender), 'RMC3');

        lenders[msg.sender].marginCallEndTime = block.timestamp.add(_poolFactory.marginCallDuration());

        emit MarginCalled(msg.sender);
    }

```

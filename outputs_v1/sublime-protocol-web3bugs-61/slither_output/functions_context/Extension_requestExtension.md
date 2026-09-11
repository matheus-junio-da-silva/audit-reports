# Context: Extension.requestExtension

**Contract:** `Extension` (Inherits: IExtension, Initializable)
**Signature:** `requestExtension(address)`
**Method Selector ID:** `0x8afed92a`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyBorrower`
  ```solidity
  modifier onlyBorrower(address _pool) {
          require(IPool(_pool).borrower() == msg.sender, 'Not Borrower');
          _;
      }
  ```

### State Variables Interaction
- **Reads:** extensions, poolFactory
- **Writes:** extensions

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(_repaymentInterval != 0,Extension::requestExtension - Uninitialized pool)`
- require/assert: `require(bool,string)(block.timestamp > _extensionVoteEndTime,Extension::requestExtension - Extension requested already)`
- require/assert: `require(bool,string)(! extensions[_pool].hasExtensionPassed,Extension::requestExtension: Extension already availed)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IRepayment.TMP_1367(uint256) = HIGH_LEVEL_CALL, dest:_repayment(IRepayment), function:getNextInstalmentDeadline, arguments:['_pool']  `
- `SafeMath.TMP_1369(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['_nextDueTime', 'TMP_1368'] `
- `IPoolFactory.TMP_1365(address) = HIGH_LEVEL_CALL, dest:poolFactory(IPoolFactory), function:repaymentImpl, arguments:[]  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_12
    Node_1["1: NodeType.VARIABLE - _repaymentInterval = extensions(_pool).repaymentInterval"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(_repaymentInterval != 0,Extension::requestExtension - Uninitialized pool)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _extensionVoteEndTime = extensions(_pool).extensionVoteEndTime"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(block.timestamp > _extensionVoteEndTime,Extension::requestExtension - Extension requested already)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - require(bool,string)(! extensions(_pool).hasExtensionPassed,Extension::requestExtension: Extension already availed)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - extensions(_pool).totalExtensionSupport = 0"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - _repayment = IRepayment(poolFactory.repaymentImpl())"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - _nextDueTime = _repayment.getNextInstalmentDeadline(_pool)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _extensionVoteEndTime = (_nextDueTime).div(10 ** 30)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - extensions(_pool).extensionVoteEndTime = _extensionVoteEndTime"]
    Node_10 --> Node_11
    Node_11["11: NodeType.EXPRESSION - ExtensionRequested(_extensionVoteEndTime)"]
    Node_12["12: NodeType.EXPRESSION - onlyBorrower(_pool)"]
    Node_12 --> Node_1
```

### Source Mapping
Declared in: `contracts/Pool/Extension.sol` on lines **79** to **94**

```solidity
    function requestExtension(address _pool) external onlyBorrower(_pool) {
        uint256 _repaymentInterval = extensions[_pool].repaymentInterval;
        require(_repaymentInterval != 0, 'Extension::requestExtension - Uninitialized pool');
        uint256 _extensionVoteEndTime = extensions[_pool].extensionVoteEndTime;
        require(block.timestamp > _extensionVoteEndTime, 'Extension::requestExtension - Extension requested already'); // _extensionVoteEndTime is 0 when no extension is active

        // This check is required so that borrower doesn't ask for more extension if previously an extension is already granted
        require(!extensions[_pool].hasExtensionPassed, 'Extension::requestExtension: Extension already availed');

        extensions[_pool].totalExtensionSupport = 0; // As we can multiple voting every time new voting start we have to make previous votes 0
        IRepayment _repayment = IRepayment(poolFactory.repaymentImpl());
        uint256 _nextDueTime = _repayment.getNextInstalmentDeadline(_pool);
        _extensionVoteEndTime = (_nextDueTime).div(10**30);
        extensions[_pool].extensionVoteEndTime = _extensionVoteEndTime; // this makes extension request single use
        emit ExtensionRequested(_extensionVoteEndTime);
    }

```

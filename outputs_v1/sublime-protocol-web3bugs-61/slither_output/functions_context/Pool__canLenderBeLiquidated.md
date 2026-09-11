# Context: Pool._canLenderBeLiquidated

**Contract:** `Pool` (Inherits: ReentrancyGuard, IPool, ERC20PausableUpgradeable, PausableUpgradeable, ERC20Upgradeable, IERC20Upgradeable, ContextUpgradeable, Initializable)
**Signature:** `_canLenderBeLiquidated(address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** lenders, poolConstants, poolVariables
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)((poolVariables.loanStatus == LoanStatus.ACTIVE) && (block.timestamp > poolConstants.loanWithdrawalDeadline),CLBL1)`
- require/assert: `require(bool,string)(getMarginCallEndTime(_lender) != 0,CLBL2)`
- require/assert: `require(bool,string)(_marginCallEndTime < block.timestamp,CLBL3)`
- require/assert: `require(bool,string)(poolConstants.idealCollateralRatio > getCurrentCollateralRatio(_lender),CLBL4)`
- require/assert: `require(bool,string)(balanceOf(_lender) != 0,CLBL5)`

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
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)((poolVariables.loanStatus == LoanStatus.ACTIVE) && (block.timestamp > poolConstants.loanWithdrawalDeadline),CLBL1)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _marginCallEndTime = lenders(_lender).marginCallEndTime"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(getMarginCallEndTime(_lender) != 0,CLBL2)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(_marginCallEndTime < block.timestamp,CLBL3)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - require(bool,string)(poolConstants.idealCollateralRatio > getCurrentCollateralRatio(_lender),CLBL4)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - require(bool,string)(balanceOf(_lender) != 0,CLBL5)"]
```

### Source Mapping
Declared in: `contracts/Pool/Pool.sol` on lines **801** to **809**

```solidity
    function _canLenderBeLiquidated(address _lender) internal {
        require((poolVariables.loanStatus == LoanStatus.ACTIVE) && (block.timestamp > poolConstants.loanWithdrawalDeadline), 'CLBL1');
        uint256 _marginCallEndTime = lenders[_lender].marginCallEndTime;
        require(getMarginCallEndTime(_lender) != 0, 'CLBL2');
        require(_marginCallEndTime < block.timestamp, 'CLBL3');

        require(poolConstants.idealCollateralRatio > getCurrentCollateralRatio(_lender), 'CLBL4');
        require(balanceOf(_lender) != 0, 'CLBL5');
    }

```

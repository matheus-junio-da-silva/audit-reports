# Context: SortedTrovesBOTester._requireValidAdjustmentInCurrentMode

**Contract:** `SortedTrovesBOTester` (Inherits: BorrowerOperations, ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_requireValidAdjustmentInCurrentMode(bool,uint256[],bool,BorrowerOperations.LocalVariables_adjustTrove)`
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
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - _isRecoveryMode"]
    Node_1 --> Node_2
    Node_1 --> Node_7
    Node_2["2: NodeType.EXPRESSION - _requireNoCollWithdrawal(_collWithdrawal)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.IF - _isDebtIncrease"]
    Node_3 --> Node_4
    Node_3 --> Node_6
    Node_4["4: NodeType.EXPRESSION - _requireICRisAboveCCR(_vars.newICR)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _requireNewICRisAboveOldICR(_vars.newICR,_vars.oldICR)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_10
    Node_7["7: NodeType.EXPRESSION - _requireICRisAboveMCR(_vars.newICR)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - _vars.newTCR = _getNewTCRFromTroveChange(_vars.collChange,_vars.isCollIncrease,_vars.netDebtChange,_isDebtIncrease)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _requireNewTCRisAboveCCR(_vars.newTCR)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **1263** to **1299**

```solidity
    function _requireValidAdjustmentInCurrentMode(
        bool _isRecoveryMode,
        uint256[] memory _collWithdrawal,
        bool _isDebtIncrease,
        LocalVariables_adjustTrove memory _vars
    ) internal view {
        /*
         *In Recovery Mode, only allow:
         *
         * - Pure collateral top-up
         * - Pure debt repayment
         * - Collateral top-up with debt repayment
         * - A debt increase combined with a collateral top-up which makes the ICR >= 150% and improves the ICR (and by extension improves the TCR).
         *
         * In Normal Mode, ensure:
         *
         * - The new ICR is above MCR
         * - The adjustment won't pull the TCR below CCR
         */
        if (_isRecoveryMode) {
            _requireNoCollWithdrawal(_collWithdrawal);
            if (_isDebtIncrease) {
                _requireICRisAboveCCR(_vars.newICR);
                _requireNewICRisAboveOldICR(_vars.newICR, _vars.oldICR);
            }
        } else {
            // if Normal Mode
            _requireICRisAboveMCR(_vars.newICR);
            _vars.newTCR = _getNewTCRFromTroveChange(
                _vars.collChange,
                _vars.isCollIncrease,
                _vars.netDebtChange,
                _isDebtIncrease
            );
            _requireNewTCRisAboveCCR(_vars.newTCR);
        }
    }

```

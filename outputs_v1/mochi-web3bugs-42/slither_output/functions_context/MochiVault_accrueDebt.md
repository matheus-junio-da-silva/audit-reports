# Context: MochiVault.accrueDebt

**Contract:** `MochiVault` (Inherits: IERC3156FlashLender, IMochiVault, Initializable)
**Signature:** `accrueDebt(uint256)`
**Method Selector ID:** `0x1b13e52f`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** claimable, debtIndex, debts, details, engine
- **Writes:** claimable, debtIndex, debts, details, lastAccrued

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(details[_id].status != Status.Invalid,invalid)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IMochiNFT.TMP_39(address) = HIGH_LEVEL_CALL, dest:TMP_38(IMochiNFT), function:ownerOf, arguments:['_id']  `
- `IMochiEngine.TMP_37(IDiscountProfile) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:discountProfile, arguments:[]  `
- `IMochiEngine.TMP_38(IMochiNFT) = HIGH_LEVEL_CALL, dest:engine(IMochiEngine), function:nft, arguments:[]  `
- `IDiscountProfile.TMP_40(float) = HIGH_LEVEL_CALL, dest:TMP_37(IDiscountProfile), function:discount, arguments:['TMP_39']  `
- `Float.TMP_41(uint256) = LIBRARY_CALL, dest:Float, function:Float.multiply(uint256,float), arguments:['increasedDebt', 'TMP_40'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - currentIndex = liveDebtIndex()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - increased = (debts * currentIndex) / debtIndex - debts"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - debts += increased"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - claimable += int256(increased)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - debtIndex = currentIndex"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - lastAccrued = block.timestamp"]
    Node_6 --> Node_7
    Node_7["7: NodeType.IF - _id != type()(uint256).max && details(_id).debtIndex < debtIndex"]
    Node_7 --> Node_8
    Node_7 --> Node_17
    Node_8["8: NodeType.EXPRESSION - require(bool,string)(details(_id).status != Status.Invalid,invalid)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - details(_id).debt != 0"]
    Node_9 --> Node_10
    Node_9 --> Node_15
    Node_10["10: NodeType.VARIABLE - increasedDebt = (details(_id).debt * debtIndex) / details(_id).debtIndex - details(_id).debt"]
    Node_10 --> Node_11
    Node_11["11: NodeType.VARIABLE - discountedDebt = increasedDebt.multiply(engine.discountProfile().discount(engine.nft().ownerOf(_id)))"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - debts -= discountedDebt"]
    Node_12 --> Node_13
    Node_13["13: NodeType.EXPRESSION - claimable -= int256(discountedDebt)"]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - details(_id).debt += (increasedDebt - discountedDebt)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDIF - "]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - details(_id).debtIndex = debtIndex"]
    Node_16 --> Node_17
    Node_17["17: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-core/contracts/vault/MochiVault.sol` on lines **85** to **111**

```solidity
    function accrueDebt(uint256 _id) public {
        // global debt for vault
        // first, increase gloabal debt;
        uint256 currentIndex = liveDebtIndex();
        uint256 increased = (debts * currentIndex) / debtIndex - debts;
        debts += increased;
        claimable += int256(increased);
        // update global debtIndex
        debtIndex = currentIndex;
        lastAccrued = block.timestamp;
        // individual debt
        if (_id != type(uint256).max && details[_id].debtIndex < debtIndex) {
            require(details[_id].status != Status.Invalid, "invalid");
            if (details[_id].debt != 0) {
                uint256 increasedDebt = (details[_id].debt * debtIndex) /
                    details[_id].debtIndex -
                    details[_id].debt;
                uint256 discountedDebt = increasedDebt.multiply(
                    engine.discountProfile().discount(engine.nft().ownerOf(_id))
                );
                debts -= discountedDebt;
                claimable -= int256(discountedDebt);
                details[_id].debt += (increasedDebt - discountedDebt);
            }
            details[_id].debtIndex = debtIndex;
        }
    }

```

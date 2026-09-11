# Context: BorrowerOperationsTester._singleTransferCollateralIntoActivePool

**Contract:** `BorrowerOperationsTester` (Inherits: BorrowerOperations, ReentrancyGuard, IBorrowerOperations, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `_singleTransferCollateralIntoActivePool(address,address,uint256)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** activePool, whitelist
- **Writes:** None

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(IERC20(_coll).transferFrom(_from,address(activePool),_amount),BO:TransferCollsFailed)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IWhitelist.TMP_1007(bool) = HIGH_LEVEL_CALL, dest:whitelist(IWhitelist), function:isWrapped, arguments:['_coll']  `
- `IWAsset.HIGH_LEVEL_CALL, dest:TMP_1008(IWAsset), function:wrap, arguments:['_amount', '_from', 'TMP_1009', '_from']  `
- `IERC20.TMP_1013(bool) = HIGH_LEVEL_CALL, dest:TMP_1011(IERC20), function:transferFrom, arguments:['_from', 'TMP_1012', '_amount']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.IF - whitelist.isWrapped(_coll)"]
    Node_1 --> Node_2
    Node_1 --> Node_3
    Node_2["2: NodeType.EXPRESSION - IWAsset(_coll).wrap(_amount,_from,address(activePool),_from)"]
    Node_2 --> Node_4
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(IERC20(_coll).transferFrom(_from,address(activePool),_amount),BO:TransferCollsFailed)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/BorrowerOperations.sol` on lines **1042** to **1054**

```solidity
    function _singleTransferCollateralIntoActivePool(
        address _from,
        address _coll,
        uint256 _amount
    ) internal {
        if (whitelist.isWrapped(_coll)) {
            // If wrapped asset then it wraps it and sends the wrapped version to the active pool, 
            // and updates reward balance to the new owner. 
            IWAsset(_coll).wrap(_amount, _from, address(activePool), _from); 
        } else {
            require(IERC20(_coll).transferFrom(_from, address(activePool), _amount), "BO:TransferCollsFailed");
        }
    }

```

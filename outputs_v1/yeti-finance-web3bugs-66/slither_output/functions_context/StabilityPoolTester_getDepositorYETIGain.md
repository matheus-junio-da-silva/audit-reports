# Context: StabilityPoolTester.getDepositorYETIGain

**Contract:** `StabilityPoolTester` (Inherits: StabilityPool, IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `getDepositorYETIGain(address) returns (uint256)`
**Method Selector ID:** `0xf7094b0b`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** DECIMAL_PRECISION, depositSnapshots, deposits, frontEnds
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_819(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.mul(uint256,uint256), arguments:['kickbackRate', 'TMP_818'] `
- `SafeMath.TMP_820(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.div(uint256,uint256), arguments:['TMP_819', 'DECIMAL_PRECISION'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - initialDeposit = deposits(_depositor).initialValue"]
    Node_1 --> Node_2
    Node_2["2: NodeType.IF - initialDeposit == 0"]
    Node_2 --> Node_3
    Node_2 --> Node_4
    Node_3["3: NodeType.RETURN - 0"]
    Node_4["4: NodeType.ENDIF - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - frontEndTag = deposits(_depositor).frontEndTag"]
    Node_5 --> Node_10
    Node_7["7: NodeType.VARIABLE - snapshots = depositSnapshots(_depositor)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - YETIGain = kickbackRate.mul(_getYETIGainFromSnapshots(initialDeposit,snapshots)).div(DECIMAL_PRECISION)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.RETURN - YETIGain"]
    Node_10["10: NodeType.IF - frontEndTag == address(0)"]
    Node_10 --> Node_11
    Node_10 --> Node_12
    Node_11["11: NodeType.EXPRESSION - kickbackRate = DECIMAL_PRECISION"]
    Node_11 --> Node_13
    Node_12["12: NodeType.EXPRESSION - kickbackRate = frontEnds(frontEndTag).kickbackRate"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_7
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **764** to **788**

```solidity
    function getDepositorYETIGain(address _depositor) public view override returns (uint256) {
        uint256 initialDeposit = deposits[_depositor].initialValue;
        if (initialDeposit == 0) {
            return 0;
        }

        address frontEndTag = deposits[_depositor].frontEndTag;

        /*
         * If not tagged with a front end, the depositor gets a 100% cut of what their deposit earned.
         * Otherwise, their cut of the deposit's earnings is equal to the kickbackRate, set by the front end through
         * which they made their deposit.
         */
        uint256 kickbackRate = frontEndTag == address(0)
            ? DECIMAL_PRECISION
            : frontEnds[frontEndTag].kickbackRate;

        Snapshots storage snapshots = depositSnapshots[_depositor];

        uint256 YETIGain = kickbackRate
            .mul(_getYETIGainFromSnapshots(initialDeposit, snapshots))
            .div(DECIMAL_PRECISION);

        return YETIGain;
    }

```

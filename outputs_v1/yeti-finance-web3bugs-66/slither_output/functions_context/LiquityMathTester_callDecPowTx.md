# Context: LiquityMathTester.callDecPowTx

**Contract:** `LiquityMathTester` (Inherits: None)
**Signature:** `callDecPowTx(uint256,uint256) returns (uint256)`
**Method Selector ID:** `0xd4077252`
**Visibility:** `external`
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
- `LiquityMath.TMP_46(uint256) = LIBRARY_CALL, dest:LiquityMath, function:LiquityMath._decPow(uint256,uint256), arguments:['_base', '_n'] `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.RETURN - LiquityMath._decPow(_base,_n)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/TestContracts/LiquityMathTester.sol` on lines **16** to **18**

```solidity
    function callDecPowTx(uint _base, uint _n) external pure returns (uint) {
        return LiquityMath._decPow(_base, _n);
    }

```

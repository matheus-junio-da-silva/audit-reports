# Context: StabilityPool.registerFrontEnd

**Contract:** `StabilityPool` (Inherits: IStabilityPool, ICollateralReceiver, CheckContract, Ownable, LiquityBase, YetiCustomBase, BaseMath, ILiquityBase)
**Signature:** `registerFrontEnd(uint256)`
**Method Selector ID:** `0x556be101`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** frontEnds
- **Writes:** frontEnds

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
    Node_1["1: NodeType.EXPRESSION - _requireFrontEndNotRegistered(msg.sender)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _requireUserHasNoDeposit(msg.sender)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - _requireValidKickbackRate(_kickbackRate)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - frontEnds(msg.sender).kickbackRate = _kickbackRate"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - frontEnds(msg.sender).registered = true"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - FrontEndRegistered(msg.sender,_kickbackRate)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/StabilityPool.sol` on lines **977** to **986**

```solidity
    function registerFrontEnd(uint256 _kickbackRate) external override {
        _requireFrontEndNotRegistered(msg.sender);
        _requireUserHasNoDeposit(msg.sender);
        _requireValidKickbackRate(_kickbackRate);

        frontEnds[msg.sender].kickbackRate = _kickbackRate;
        frontEnds[msg.sender].registered = true;

        emit FrontEndRegistered(msg.sender, _kickbackRate);
    }

```

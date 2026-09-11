# Context: ShortLockupContract.constructor

**Contract:** `ShortLockupContract` (Inherits: None)
**Signature:** `constructor(address,address,uint256)`
**Method Selector ID:** `0x3bdb4e02`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** beneficiary, unlockTime, yetiToken

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
    Node_1["1: NodeType.EXPRESSION - yetiToken = IYETIToken(_yetiTokenAddress)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - unlockTime = _unlockTime"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - beneficiary = _beneficiary"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - LockupContractCreated(_beneficiary,_unlockTime)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/ShortLockupContract.sol` on lines **37** to **55**

```solidity
    constructor 
    (
        address _yetiTokenAddress,
        address _beneficiary, 
        uint _unlockTime
    )
        public 
    {
        yetiToken = IYETIToken(_yetiTokenAddress);

        /*
        * Set the unlock time to a chosen instant in the future, as long as it is at least 1 year after
        * the system was deployed 
        */
        unlockTime = _unlockTime;
        
        beneficiary =  _beneficiary;
        emit LockupContractCreated(_beneficiary, _unlockTime);
    }

```

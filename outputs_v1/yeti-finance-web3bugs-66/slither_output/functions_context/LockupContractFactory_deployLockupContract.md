# Context: LockupContractFactory.deployLockupContract

**Contract:** `LockupContractFactory` (Inherits: CheckContract, Ownable, ILockupContractFactory)
**Signature:** `deployLockupContract(address,uint256)`
**Method Selector ID:** `0x34c44b4d`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** yetiTokenAddress
- **Writes:** lockupContractToDeployer

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
    Node_1["1: NodeType.VARIABLE - yetiTokenAddressCached = yetiTokenAddress"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - _requireYETIAddressIsSet(yetiTokenAddressCached)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - lockupContract = new LockupContract(yetiTokenAddressCached,_beneficiary,_unlockTime)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - lockupContractToDeployer(address(lockupContract)) = msg.sender"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - LockupContractDeployedThroughFactory(address(lockupContract),_beneficiary,_unlockTime,msg.sender)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/LockupContractFactory.sol` on lines **53** to **63**

```solidity
    function deployLockupContract(address _beneficiary, uint _unlockTime) external override {
        address yetiTokenAddressCached = yetiTokenAddress;
        _requireYETIAddressIsSet(yetiTokenAddressCached);
        LockupContract lockupContract = new LockupContract(
                                                        yetiTokenAddressCached,
                                                        _beneficiary, 
                                                        _unlockTime);

        lockupContractToDeployer[address(lockupContract)] = msg.sender;
        emit LockupContractDeployedThroughFactory(address(lockupContract), _beneficiary, _unlockTime, msg.sender);
    }

```

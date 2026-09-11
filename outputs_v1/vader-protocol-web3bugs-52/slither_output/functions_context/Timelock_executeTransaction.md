# Context: Timelock.executeTransaction

**Contract:** `Timelock` (Inherits: ITimelock)
**Signature:** `executeTransaction(address,uint256,string,bytes,uint256) returns (bytes)`
**Method Selector ID:** `0x0825f38f`
**Visibility:** `public`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** admin, queuedTransactions
- **Writes:** queuedTransactions

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(msg.sender == admin,Timelock::executeTransaction: Call must come from admin.)`
- require/assert: `require(bool,string)(queuedTransactions[txHash],Timelock::executeTransaction: Transaction hasn't been queued.)`
- require/assert: `require(bool,string)(getBlockTimestamp() >= eta,Timelock::executeTransaction: Transaction hasn't surpassed time lock.)`
- require/assert: `require(bool,string)(getBlockTimestamp() <= eta + GRACE_PERIOD(),Timelock::executeTransaction: Transaction is stale.)`
- require/assert: `require(bool,string)(success,Timelock::executeTransaction: Transaction execution reverted.)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `low-level-call`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(msg.sender == admin,Timelock::executeTransaction: Call must come from admin.)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - txHash = keccak256(bytes)(abi.encode(target,value,signature,data,eta))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(queuedTransactions(txHash),Timelock::executeTransaction: Transaction hasn't been queued.)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(getBlockTimestamp() >= eta,Timelock::executeTransaction: Transaction hasn't surpassed time lock.)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - require(bool,string)(getBlockTimestamp() <= eta + GRACE_PERIOD(),Timelock::executeTransaction: Transaction is stale.)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - queuedTransactions(txHash) = false"]
    Node_6 --> Node_7
    Node_7["7: NodeType.VARIABLE - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.IF - bytes(signature).length == 0"]
    Node_8 --> Node_9
    Node_8 --> Node_10
    Node_9["9: NodeType.EXPRESSION - callData = data"]
    Node_9 --> Node_11
    Node_10["10: NodeType.EXPRESSION - callData = abi.encodePacked(bytes4(keccak256(bytes)(bytes(signature))),data)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - "]
    Node_12 --> Node_13
    Node_13["13: NodeType.VARIABLE - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - (success,returnData) = target.call(value: value)(callData)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.EXPRESSION - require(bool,string)(success,Timelock::executeTransaction: Transaction execution reverted.)"]
    Node_15 --> Node_16
    Node_16["16: NodeType.EXPRESSION - ExecuteTransaction(txHash,target,value,signature,data,eta)"]
    Node_16 --> Node_17
    Node_17["17: NodeType.RETURN - returnData"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/governance/Timelock.sol` on lines **255** to **309**

```solidity
    function executeTransaction(
        address target,
        uint256 value,
        string memory signature,
        bytes memory data,
        uint256 eta
    ) public payable override returns (bytes memory) {
        require(
            msg.sender == admin,
            "Timelock::executeTransaction: Call must come from admin."
        );

        bytes32 txHash = keccak256(
            abi.encode(target, value, signature, data, eta)
        );
        require(
            queuedTransactions[txHash],
            "Timelock::executeTransaction: Transaction hasn't been queued."
        );
        require(
            getBlockTimestamp() >= eta,
            "Timelock::executeTransaction: Transaction hasn't surpassed time lock."
        );
        require(
            getBlockTimestamp() <= eta + GRACE_PERIOD(),
            "Timelock::executeTransaction: Transaction is stale."
        );

        queuedTransactions[txHash] = false;

        bytes memory callData;

        if (bytes(signature).length == 0) {
            callData = data;
        } else {
            callData = abi.encodePacked(
                bytes4(keccak256(bytes(signature))),
                data
            );
        }

        // solium-disable-next-line security/no-call-value
        (bool success, bytes memory returnData) = target.call{value: value}(
            callData
        );

        require(
            success,
            "Timelock::executeTransaction: Transaction execution reverted."
        );

        emit ExecuteTransaction(txHash, target, value, signature, data, eta);

        return returnData;
    }

```

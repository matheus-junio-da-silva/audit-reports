# Context: TellorCaller.getTellorCurrentValue

**Contract:** `TellorCaller` (Inherits: ITellorCaller)
**Signature:** `getTellorCurrentValue(uint256) returns (bool, uint256, uint256)`
**Method Selector ID:** `0x32e6aadb`
**Visibility:** `external`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** tellor
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `SafeMath.TMP_22(uint256) = LIBRARY_CALL, dest:SafeMath, function:SafeMath.sub(uint256,uint256), arguments:['_count', '1'] `
- `ITellor.TMP_23(uint256) = HIGH_LEVEL_CALL, dest:tellor(ITellor), function:getTimestampbyRequestIDandIndex, arguments:['_requestId', 'TMP_22']  `
- `ITellor.TMP_21(uint256) = HIGH_LEVEL_CALL, dest:tellor(ITellor), function:getNewValueCountbyRequestId, arguments:['_requestId']  `
- `ITellor.TMP_24(uint256) = HIGH_LEVEL_CALL, dest:tellor(ITellor), function:retrieveData, arguments:['_requestId', '_time']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - _count = tellor.getNewValueCountbyRequestId(_requestId)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - _time = tellor.getTimestampbyRequestIDandIndex(_requestId,_count.sub(1))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - _value = tellor.retrieveData(_requestId,_time)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - _value != 0"]
    Node_4 --> Node_5
    Node_4 --> Node_6
    Node_5["5: NodeType.RETURN - (true,_value,_time)"]
    Node_6["6: NodeType.ENDIF - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.RETURN - (false,0,_time)"]
    Node_8["8: NodeType.RETURN - (ifRetrieve,value,_timestampRetrieved)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/Dependencies/TellorCaller.sol` on lines **36** to **52**

```solidity
    function getTellorCurrentValue(uint256 _requestId)
        external
        view
        override
        returns (
            bool ifRetrieve,
            uint256 value,
            uint256 _timestampRetrieved
        )
    {
        uint256 _count = tellor.getNewValueCountbyRequestId(_requestId);
        uint256 _time =
            tellor.getTimestampbyRequestIDandIndex(_requestId, _count.sub(1));
        uint256 _value = tellor.retrieveData(_requestId, _time);
        if (_value != 0) return (true, _value, _time);
        return (false, 0, _time);
    }

```

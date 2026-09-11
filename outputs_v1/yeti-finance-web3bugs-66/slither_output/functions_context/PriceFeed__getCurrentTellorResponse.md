# Context: PriceFeed._getCurrentTellorResponse

**Contract:** `PriceFeed` (Inherits: IPriceFeed, BaseMath, CheckContract, Ownable)
**Signature:** `_getCurrentTellorResponse() returns (PriceFeed.TellorResponse)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** ETHUSD_TELLOR_REQ_ID, tellorCaller
- **Writes:** None

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ITellorCaller.TUPLE_0(bool,uint256,uint256) = HIGH_LEVEL_CALL, dest:tellorCaller(ITellorCaller), function:getTellorCurrentValue, arguments:['ETHUSD_TELLOR_REQ_ID']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.TRY - (ifRetrieve,value,_timestampRetrieved) = tellorCaller.getTellorCurrentValue(ETHUSD_TELLOR_REQ_ID)"]
    Node_1 --> Node_2
    Node_1 --> Node_8
    Node_2["2: NodeType.CATCH - "]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - tellorResponse.ifRetrieve = ifRetrieve"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - tellorResponse.value = value"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - tellorResponse.timestamp = _timestampRetrieved"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - tellorResponse.success = true"]
    Node_6 --> Node_7
    Node_7["7: NodeType.RETURN - (tellorResponse)"]
    Node_8["8: NodeType.CATCH - "]
    Node_8 --> Node_9
    Node_9["9: NodeType.RETURN - (tellorResponse)"]
    Node_10["10: NodeType.RETURN - tellorResponse"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/PriceFeed.sol` on lines **718** to **737**

```solidity
    function _getCurrentTellorResponse() internal view returns (TellorResponse memory tellorResponse) {
        try tellorCaller.getTellorCurrentValue(ETHUSD_TELLOR_REQ_ID) returns
        (
            bool ifRetrieve,
            uint256 value,
            uint256 _timestampRetrieved
        )
        {
            // If call to Tellor succeeds, return the response and success = true
            tellorResponse.ifRetrieve = ifRetrieve;
            tellorResponse.value = value;
            tellorResponse.timestamp = _timestampRetrieved;
            tellorResponse.success = true;

            return (tellorResponse);
        }catch {
            // If call to Tellor reverts, return a zero response with success = false
            return (tellorResponse);
        }
    }

```

# Context: Create2BeaconMaker.constructor

**Contract:** `Create2BeaconMaker` (Inherits: None)
**Signature:** `constructor(address,bytes)`
**Method Selector ID:** `0x4531ea10`
**Visibility:** `public`
**Environment-Free:** `Yes`
**Modifiers:** None

### State Variables Interaction
- **Reads:** None
- **Writes:** None

### Assertion Checks & Business Requirements
- revert: `revert(uint256,uint256)(0,returndatasize()())`

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
    Node_1["1: NodeType.VARIABLE - "]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - (None,returnData) = beacon.staticcall()"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - template = abi.decode(returnData,(address))"]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - (success,None) = template.delegatecall(initializationCalldata)"]
    Node_5 --> Node_6
    Node_6["6: NodeType.IF - ! success"]
    Node_6 --> Node_7
    Node_6 --> Node_11
    Node_7["7: NodeType.ASSEMBLY - "]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - returndatacopy(uint256,uint256,uint256)(0,0,returndatasize()())"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - revert(uint256,uint256)(0,returndatasize()())"]
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDASSEMBLY - "]
    Node_10 --> Node_11
    Node_11["11: NodeType.ENDIF - "]
    Node_11 --> Node_12
    Node_12["12: NodeType.VARIABLE - runtimeCode = abi.encodePacked(bytes6(0x3d3d3d3d3d73),beacon,bytes32(0x5afa3d82803e368260203750808036602082515af43d82803e903d91603a57fd),bytes2(0x5bf3))"]
    Node_12 --> Node_13
    Node_13["13: NodeType.ASSEMBLY - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - return(uint256,uint256)(0x20 + runtimeCode,60)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.ENDASSEMBLY - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/Create2BeaconMaker.sol` on lines **6** to **36**

```solidity
    constructor(address beacon, bytes memory initializationCalldata)
        payable
    {
        (, bytes memory returnData) = beacon.staticcall("");
        address template = abi.decode(returnData, (address));
        // solhint-disable-next-line avoid-low-level-calls
        (bool success, ) = template.delegatecall(initializationCalldata);
        if (!success) {
            // pass along failure message from delegatecall and revert.
            // solhint-disable-next-line no-inline-assembly
            assembly {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }
        }

        // place eip-1167 runtime code in memory.
        bytes memory runtimeCode =
            abi.encodePacked(
                bytes6(0x3d3d3d3d3d73),
                beacon,
                bytes32(0x5afa3d82803e368260203750808036602082515af43d82803e903d91603a57fd),
                bytes2(0x5bf3)
            );

        // return Beacon Minimal Proxy code to write it to spawned contract runtime.
        // solhint-disable-next-line no-inline-assembly
        assembly {
            return(add(0x20, runtimeCode), 60) // Beacon Minimal Proxy runtime code, length
        }
    }

```

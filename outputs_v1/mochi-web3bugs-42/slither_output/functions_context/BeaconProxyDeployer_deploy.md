# Context: BeaconProxyDeployer.deploy

**Contract:** `BeaconProxyDeployer` (Inherits: None)
**Signature:** `deploy(address,bytes) returns (address)`
**Method Selector ID:** `Internal (No Method ID)`
**Visibility:** `internal`
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
- None

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.VARIABLE - createCode = abi.encodePacked(type()(Create2BeaconMaker).creationCode,abi.encode(address(beacon),initializationCalldata))"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - salt = bytes32(0)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.ASSEMBLY - "]
    Node_3 --> Node_4
    Node_4["4: NodeType.VARIABLE - "]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - encoded_data_deploy_asm_0 = 0x20 + createCode"]
    Node_5 --> Node_6
    Node_6["6: NodeType.VARIABLE - "]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - encoded_size_deploy_asm_0 = mload(uint256)(createCode)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - result = create2(uint256,uint256,uint256,uint256)(0,encoded_data_deploy_asm_0,encoded_size_deploy_asm_0,salt)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.IF - ! result"]
    Node_9 --> Node_11
    Node_9 --> Node_10
    Node_10["10: NodeType.ENDIF - "]
    Node_10 --> Node_13
    Node_11["11: NodeType.EXPRESSION - returndatacopy(uint256,uint256,uint256)(0,0,returndatasize()())"]
    Node_11 --> Node_12
    Node_12["12: NodeType.EXPRESSION - revert(uint256,uint256)(0,returndatasize()())"]
    Node_12 --> Node_10
    Node_13["13: NodeType.ENDASSEMBLY - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.RETURN - result"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/42/projects/mochi-library/contracts/BeaconProxyDeployer.sol` on lines **7** to **36**

```solidity
    function deploy(address beacon, bytes memory initializationCalldata)
        internal
        returns (address result)
    {
        bytes memory createCode =
            abi.encodePacked(
                type(Create2BeaconMaker).creationCode,
                abi.encode(address(beacon), initializationCalldata)
            );
        bytes32 salt = bytes32(0);

        // solhint-disable-next-line no-inline-assembly
        assembly {
            let encoded_data := add(0x20, createCode) // load initialization code.
            let encoded_size := mload(createCode) // load the init code's length.
            result := create2(
                // call `CREATE2` w/ 4 arguments.
                0, // forward any supplied endowment.
                encoded_data, // pass in initialization code.
                encoded_size, // pass in init code's length.
                salt // pass in the salt value.
            )

            // pass along failure message from failed contract deployment and revert.
            if iszero(result) {
                returndatacopy(0, 0, returndatasize())
                revert(0, returndatasize())
            }
        }
    }

```

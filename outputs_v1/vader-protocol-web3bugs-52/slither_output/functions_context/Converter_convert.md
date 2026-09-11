# Context: Converter.convert

**Contract:** `Converter` (Inherits: ProtocolConstants, IConverter)
**Signature:** `convert(bytes32[],uint256) returns (uint256)`
**Method Selector ID:** `0x416d7632`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _BURN, _VADER_VETHER_CONVERSION_RATE, claimed, root, vader, vesting, vether
- **Writes:** claimed

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(amount != 0,Converter::convert: Non-Zero Conversion Amount Required)`
- require/assert: `require(bool,string)(! claimed[leaf] && proof.verify(root,leaf),Converter::convert: Incorrect Proof Provided)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `ILinearVesting.HIGH_LEVEL_CALL, dest:vesting(ILinearVesting), function:vestFor, arguments:['msg.sender', 'half']  `
- `MerkleProof.TMP_165(bool) = LIBRARY_CALL, dest:MerkleProof, function:MerkleProof.verify(bytes32[],bytes32,bytes32), arguments:['proof', 'root', 'leaf'] `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransfer(IERC20,address,uint256), arguments:['vader', 'msg.sender', 'half'] `
- `SafeERC20.LIBRARY_CALL, dest:SafeERC20, function:SafeERC20.safeTransferFrom(IERC20,address,address,uint256), arguments:['vether', 'msg.sender', '_BURN', 'amount'] `
- `TMP_162(bytes) = SOLIDITY_CALL abi.encodePacked()(msg.sender,amount)`

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_1
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(amount != 0,Converter::convert: Non-Zero Conversion Amount Required)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - leaf = keccak256(bytes)(abi.encodePacked(msg.sender,amount))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(! claimed(leaf) && proof.verify(root,leaf),Converter::convert: Incorrect Proof Provided)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - claimed(leaf) = true"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - vaderReceived = amount * _VADER_VETHER_CONVERSION_RATE"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - Conversion(msg.sender,amount,vaderReceived)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - vether.safeTransferFrom(msg.sender,_BURN,amount)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.VARIABLE - half = vaderReceived / 2"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - vader.safeTransfer(msg.sender,half)"]
    Node_9 --> Node_10
    Node_10["10: NodeType.EXPRESSION - vesting.vestFor(msg.sender,half)"]
    Node_10 --> Node_11
    Node_11["11: NodeType.RETURN - vaderReceived"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/52/contracts/tokens/converter/Converter.sol` on lines **101** to **126**

```solidity
    function convert(bytes32[] calldata proof, uint256 amount)
        external
        override
        returns (uint256 vaderReceived)
    {
        require(
            amount != 0,
            "Converter::convert: Non-Zero Conversion Amount Required"
        );

        bytes32 leaf = keccak256(abi.encodePacked(msg.sender, amount));
        require(
            !claimed[leaf] && proof.verify(root, leaf),
            "Converter::convert: Incorrect Proof Provided"
        );
        claimed[leaf] = true;

        vaderReceived = amount * _VADER_VETHER_CONVERSION_RATE;

        emit Conversion(msg.sender, amount, vaderReceived);

        vether.safeTransferFrom(msg.sender, _BURN, amount);
        uint256 half = vaderReceived / 2;
        vader.safeTransfer(msg.sender, half);
        vesting.vestFor(msg.sender, half);
    }

```

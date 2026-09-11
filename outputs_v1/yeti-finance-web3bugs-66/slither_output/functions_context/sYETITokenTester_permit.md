# Context: sYETITokenTester.permit

**Contract:** `sYETITokenTester` (Inherits: sYETIToken, BoringOwnable, BoringOwnableData, Domain, IERC20)
**Signature:** `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)`
**Method Selector ID:** `0xd505accf`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** PERMIT_SIGNATURE_HASH, nonces
- **Writes:** allowance, nonces

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(owner_ != address(0),Zero owner)`
- require/assert: `require(bool,string)(block.timestamp < deadline,Expired)`
- require/assert: `require(bool,string)(ecrecover(bytes32,uint8,bytes32,bytes32)(_getDigest(keccak256(bytes)(abi.encode(PERMIT_SIGNATURE_HASH,owner_,spender,value,nonces[owner_] ++,deadline))),v,r,s) == owner_,Invalid Sig)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(owner_ != address(0),Zero owner)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - require(bool,string)(block.timestamp < deadline,Expired)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - require(bool,string)(ecrecover(bytes32,uint8,bytes32,bytes32)(_getDigest(keccak256(bytes)(abi.encode(PERMIT_SIGNATURE_HASH,owner_,spender,value,nonces(owner_) ++,deadline))),v,r,s) == owner_,Invalid Sig)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - allowance(owner_)(spender) = value"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - Approval(owner_,spender,value)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/sYETIToken.sol` on lines **172** to **190**

```solidity
    function permit(
        address owner_,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external override {
        require(owner_ != address(0), "Zero owner");
        require(block.timestamp < deadline, "Expired");
        require(
            ecrecover(_getDigest(keccak256(abi.encode(PERMIT_SIGNATURE_HASH, owner_, spender, value, nonces[owner_]++, deadline))), v, r, s) ==
            owner_,
            "Invalid Sig"
        );
        allowance[owner_][spender] = value;
        emit Approval(owner_, spender, value);
    }

```

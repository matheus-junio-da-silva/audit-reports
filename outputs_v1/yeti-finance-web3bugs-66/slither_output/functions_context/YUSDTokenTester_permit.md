# Context: YUSDTokenTester.permit

**Contract:** `YUSDTokenTester` (Inherits: YUSDToken, IYUSDToken, IERC2612, IERC20, CheckContract)
**Signature:** `permit(address,address,uint256,uint256,uint8,bytes32,bytes32)`
**Method Selector ID:** `0xd505accf`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** _PERMIT_TYPEHASH, _nonces
- **Writes:** _nonces

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(deadline >= block.timestamp,YUSD: expired deadline)`
- require/assert: `require(bool,string)(recoveredAddress == owner || recoveredAddress != address(0),YUSD: invalid signature)`

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
    Node_1["1: NodeType.EXPRESSION - require(bool,string)(deadline >= block.timestamp,YUSD: expired deadline)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - digest = keccak256(bytes)(abi.encodePacked(,domainSeparator(),keccak256(bytes)(abi.encode(_PERMIT_TYPEHASH,owner,spender,amount,_nonces(owner) ++,deadline))))"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - recoveredAddress = ecrecover(bytes32,uint8,bytes32,bytes32)(digest,v,r,s)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - require(bool,string)(recoveredAddress == owner || recoveredAddress != address(0),YUSD: invalid signature)"]
    Node_4 --> Node_5
    Node_5["5: NodeType.EXPRESSION - _approve(owner,spender,amount)"]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YUSDToken.sol` on lines **186** to **207**

```solidity
    function permit
    (
        address owner, 
        address spender, 
        uint amount, 
        uint deadline, 
        uint8 v, 
        bytes32 r, 
        bytes32 s
    ) 
        external 
        override 
    {            
        require(deadline >= block.timestamp, 'YUSD: expired deadline');
        bytes32 digest = keccak256(abi.encodePacked('\x19\x01', 
                         domainSeparator(), keccak256(abi.encode(
                         _PERMIT_TYPEHASH, owner, spender, amount, 
                         _nonces[owner]++, deadline))));
        address recoveredAddress = ecrecover(digest, v, r, s);
        require(recoveredAddress == owner || recoveredAddress != address(0) , 'YUSD: invalid signature');
        _approve(owner, spender, amount);
    }

```

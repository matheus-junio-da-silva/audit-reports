# Context: CommunityIssuanceTester.setAddresses

**Contract:** `CommunityIssuanceTester` (Inherits: CommunityIssuance, BaseMath, CheckContract, Ownable, ICommunityIssuance)
**Signature:** `setAddresses(address,address)`
**Method Selector ID:** `0x90107afe`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:**
- `onlyOwner`
  ```solidity
  modifier onlyOwner() {
          require(isOwner(), "CallerNotOwner");
          _;
      }
  ```

### State Variables Interaction
- **Reads:** YETISupplyCap, yetiToken
- **Writes:** stabilityPoolAddress, yetiToken

### Assertion Checks & Business Requirements
- require/assert: `require(bool,string)(YETIBalance >= YETISupplyCap,setAddresses: balance must be less than supplycap)`

### Environment & Verification Flags
- **Uses Foundry Cheatcodes:** No
- **Has Echidna Properties:** No

### Internal Calls Tree
- None

### External Calls / Value Transfers
- `IYETIToken.TMP_120(uint256) = HIGH_LEVEL_CALL, dest:yetiToken(IYETIToken), function:balanceOf, arguments:['TMP_119']  `

### Control Flow Graph (CFG)
```mermaid
flowchart TD
    Node_0["0: NodeType.ENTRYPOINT - "]
    Node_0 --> Node_10
    Node_1["1: NodeType.EXPRESSION - checkContract(_yetiTokenAddress)"]
    Node_1 --> Node_2
    Node_2["2: NodeType.EXPRESSION - checkContract(_stabilityPoolAddress)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.EXPRESSION - yetiToken = IYETIToken(_yetiTokenAddress)"]
    Node_3 --> Node_4
    Node_4["4: NodeType.EXPRESSION - stabilityPoolAddress = _stabilityPoolAddress"]
    Node_4 --> Node_5
    Node_5["5: NodeType.VARIABLE - YETIBalance = yetiToken.balanceOf(address(this))"]
    Node_5 --> Node_6
    Node_6["6: NodeType.EXPRESSION - require(bool,string)(YETIBalance >= YETISupplyCap,setAddresses: balance must be less than supplycap)"]
    Node_6 --> Node_7
    Node_7["7: NodeType.EXPRESSION - YETITokenAddressSet(_yetiTokenAddress)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.EXPRESSION - StabilityPoolAddressSet(_stabilityPoolAddress)"]
    Node_8 --> Node_9
    Node_9["9: NodeType.EXPRESSION - _renounceOwnership()"]
    Node_10["10: NodeType.EXPRESSION - onlyOwner()"]
    Node_10 --> Node_1
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/YETI/CommunityIssuance.sol` on lines **68** to **91**

```solidity
    function setAddresses
    (
        address _yetiTokenAddress,
        address _stabilityPoolAddress
    ) 
        external 
        onlyOwner 
        override 
    {
        checkContract(_yetiTokenAddress);
        checkContract(_stabilityPoolAddress);

        yetiToken = IYETIToken(_yetiTokenAddress);
        stabilityPoolAddress = _stabilityPoolAddress;

        // When YETIToken deployed, it should have transferred CommunityIssuance's YETI entitlement
        uint YETIBalance = yetiToken.balanceOf(address(this));
        require(YETIBalance >= YETISupplyCap, "setAddresses: balance must be less than supplycap");

        emit YETITokenAddressSet(_yetiTokenAddress);
        emit StabilityPoolAddressSet(_stabilityPoolAddress);

        _renounceOwnership();
    }

```

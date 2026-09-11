# Context: PriceFeed.fetchPrice

**Contract:** `PriceFeed` (Inherits: IPriceFeed, BaseMath, CheckContract, Ownable)
**Signature:** `fetchPrice() returns (uint256)`
**Method Selector ID:** `0x0fdb11cf`
**Visibility:** `external`
**Environment-Free:** `No (reads EVM state context)`
**Modifiers:** None

### State Variables Interaction
- **Reads:** lastGoodPrice, status
- **Writes:** None

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
    Node_1["1: NodeType.VARIABLE - chainlinkResponse = _getCurrentChainlinkResponse()"]
    Node_1 --> Node_2
    Node_2["2: NodeType.VARIABLE - prevChainlinkResponse = _getPrevChainlinkResponse(chainlinkResponse.roundId,chainlinkResponse.decimals)"]
    Node_2 --> Node_3
    Node_3["3: NodeType.VARIABLE - tellorResponse = _getCurrentTellorResponse()"]
    Node_3 --> Node_4
    Node_4["4: NodeType.IF - status == Status.chainlinkWorking"]
    Node_4 --> Node_5
    Node_4 --> Node_47
    Node_5["5: NodeType.IF - _chainlinkIsBroken(chainlinkResponse,prevChainlinkResponse)"]
    Node_5 --> Node_6
    Node_5 --> Node_16
    Node_6["6: NodeType.IF - _tellorIsBroken(tellorResponse)"]
    Node_6 --> Node_7
    Node_6 --> Node_9
    Node_7["7: NodeType.EXPRESSION - _changeStatus(Status.bothOraclesUntrusted)"]
    Node_7 --> Node_8
    Node_8["8: NodeType.RETURN - lastGoodPrice"]
    Node_9["9: NodeType.ENDIF - "]
    Node_9 --> Node_10
    Node_10["10: NodeType.IF - _tellorIsFrozen(tellorResponse)"]
    Node_10 --> Node_11
    Node_10 --> Node_13
    Node_11["11: NodeType.EXPRESSION - _changeStatus(Status.usingTellorChainlinkUntrusted)"]
    Node_11 --> Node_12
    Node_12["12: NodeType.RETURN - lastGoodPrice"]
    Node_13["13: NodeType.ENDIF - "]
    Node_13 --> Node_14
    Node_14["14: NodeType.EXPRESSION - _changeStatus(Status.usingTellorChainlinkUntrusted)"]
    Node_14 --> Node_15
    Node_15["15: NodeType.RETURN - _storeTellorPrice(tellorResponse)"]
    Node_16["16: NodeType.ENDIF - "]
    Node_16 --> Node_17
    Node_17["17: NodeType.IF - _chainlinkIsFrozen(chainlinkResponse)"]
    Node_17 --> Node_18
    Node_17 --> Node_27
    Node_18["18: NodeType.IF - _tellorIsBroken(tellorResponse)"]
    Node_18 --> Node_19
    Node_18 --> Node_21
    Node_19["19: NodeType.EXPRESSION - _changeStatus(Status.usingChainlinkTellorUntrusted)"]
    Node_19 --> Node_20
    Node_20["20: NodeType.RETURN - lastGoodPrice"]
    Node_21["21: NodeType.ENDIF - "]
    Node_21 --> Node_22
    Node_22["22: NodeType.EXPRESSION - _changeStatus(Status.usingTellorChainlinkFrozen)"]
    Node_22 --> Node_23
    Node_23["23: NodeType.IF - _tellorIsFrozen(tellorResponse)"]
    Node_23 --> Node_24
    Node_23 --> Node_25
    Node_24["24: NodeType.RETURN - lastGoodPrice"]
    Node_25["25: NodeType.ENDIF - "]
    Node_25 --> Node_26
    Node_26["26: NodeType.RETURN - _storeTellorPrice(tellorResponse)"]
    Node_27["27: NodeType.ENDIF - "]
    Node_27 --> Node_28
    Node_28["28: NodeType.IF - _chainlinkPriceChangeAboveMax(chainlinkResponse,prevChainlinkResponse)"]
    Node_28 --> Node_29
    Node_28 --> Node_42
    Node_29["29: NodeType.IF - _tellorIsBroken(tellorResponse)"]
    Node_29 --> Node_30
    Node_29 --> Node_32
    Node_30["30: NodeType.EXPRESSION - _changeStatus(Status.bothOraclesUntrusted)"]
    Node_30 --> Node_31
    Node_31["31: NodeType.RETURN - lastGoodPrice"]
    Node_32["32: NodeType.ENDIF - "]
    Node_32 --> Node_33
    Node_33["33: NodeType.IF - _tellorIsFrozen(tellorResponse)"]
    Node_33 --> Node_34
    Node_33 --> Node_36
    Node_34["34: NodeType.EXPRESSION - _changeStatus(Status.usingTellorChainlinkUntrusted)"]
    Node_34 --> Node_35
    Node_35["35: NodeType.RETURN - lastGoodPrice"]
    Node_36["36: NodeType.ENDIF - "]
    Node_36 --> Node_37
    Node_37["37: NodeType.IF - _bothOraclesSimilarPrice(chainlinkResponse,tellorResponse)"]
    Node_37 --> Node_38
    Node_37 --> Node_39
    Node_38["38: NodeType.RETURN - _storeChainlinkPrice(chainlinkResponse)"]
    Node_39["39: NodeType.ENDIF - "]
    Node_39 --> Node_40
    Node_40["40: NodeType.EXPRESSION - _changeStatus(Status.usingTellorChainlinkUntrusted)"]
    Node_40 --> Node_41
    Node_41["41: NodeType.RETURN - _storeTellorPrice(tellorResponse)"]
    Node_42["42: NodeType.ENDIF - "]
    Node_42 --> Node_43
    Node_43["43: NodeType.IF - _tellorIsBroken(tellorResponse)"]
    Node_43 --> Node_44
    Node_43 --> Node_45
    Node_44["44: NodeType.EXPRESSION - _changeStatus(Status.usingChainlinkTellorUntrusted)"]
    Node_44 --> Node_45
    Node_45["45: NodeType.ENDIF - "]
    Node_45 --> Node_46
    Node_46["46: NodeType.RETURN - _storeChainlinkPrice(chainlinkResponse)"]
    Node_47["47: NodeType.ENDIF - "]
    Node_47 --> Node_48
    Node_48["48: NodeType.IF - status == Status.usingTellorChainlinkUntrusted"]
    Node_48 --> Node_49
    Node_48 --> Node_61
    Node_49["49: NodeType.IF - _bothOraclesLiveAndUnbrokenAndSimilarPrice(chainlinkResponse,prevChainlinkResponse,tellorResponse)"]
    Node_49 --> Node_50
    Node_49 --> Node_52
    Node_50["50: NodeType.EXPRESSION - _changeStatus(Status.chainlinkWorking)"]
    Node_50 --> Node_51
    Node_51["51: NodeType.RETURN - _storeChainlinkPrice(chainlinkResponse)"]
    Node_52["52: NodeType.ENDIF - "]
    Node_52 --> Node_53
    Node_53["53: NodeType.IF - _tellorIsBroken(tellorResponse)"]
    Node_53 --> Node_54
    Node_53 --> Node_56
    Node_54["54: NodeType.EXPRESSION - _changeStatus(Status.bothOraclesUntrusted)"]
    Node_54 --> Node_55
    Node_55["55: NodeType.RETURN - lastGoodPrice"]
    Node_56["56: NodeType.ENDIF - "]
    Node_56 --> Node_57
    Node_57["57: NodeType.IF - _tellorIsFrozen(tellorResponse)"]
    Node_57 --> Node_58
    Node_57 --> Node_59
    Node_58["58: NodeType.RETURN - lastGoodPrice"]
    Node_59["59: NodeType.ENDIF - "]
    Node_59 --> Node_60
    Node_60["60: NodeType.RETURN - _storeTellorPrice(tellorResponse)"]
    Node_61["61: NodeType.ENDIF - "]
    Node_61 --> Node_62
    Node_62["62: NodeType.IF - status == Status.bothOraclesUntrusted"]
    Node_62 --> Node_63
    Node_62 --> Node_68
    Node_63["63: NodeType.IF - _bothOraclesLiveAndUnbrokenAndSimilarPrice(chainlinkResponse,prevChainlinkResponse,tellorResponse)"]
    Node_63 --> Node_64
    Node_63 --> Node_66
    Node_64["64: NodeType.EXPRESSION - _changeStatus(Status.chainlinkWorking)"]
    Node_64 --> Node_65
    Node_65["65: NodeType.RETURN - _storeChainlinkPrice(chainlinkResponse)"]
    Node_66["66: NodeType.ENDIF - "]
    Node_66 --> Node_67
    Node_67["67: NodeType.RETURN - lastGoodPrice"]
    Node_68["68: NodeType.ENDIF - "]
    Node_68 --> Node_69
    Node_69["69: NodeType.IF - status == Status.usingTellorChainlinkFrozen"]
    Node_69 --> Node_70
    Node_69 --> Node_104
    Node_70["70: NodeType.IF - _chainlinkIsBroken(chainlinkResponse,prevChainlinkResponse)"]
    Node_70 --> Node_71
    Node_70 --> Node_80
    Node_71["71: NodeType.IF - _tellorIsBroken(tellorResponse)"]
    Node_71 --> Node_72
    Node_71 --> Node_74
    Node_72["72: NodeType.EXPRESSION - _changeStatus(Status.bothOraclesUntrusted)"]
    Node_72 --> Node_73
    Node_73["73: NodeType.RETURN - lastGoodPrice"]
    Node_74["74: NodeType.ENDIF - "]
    Node_74 --> Node_75
    Node_75["75: NodeType.EXPRESSION - _changeStatus(Status.usingTellorChainlinkUntrusted)"]
    Node_75 --> Node_76
    Node_76["76: NodeType.IF - _tellorIsFrozen(tellorResponse)"]
    Node_76 --> Node_77
    Node_76 --> Node_78
    Node_77["77: NodeType.RETURN - lastGoodPrice"]
    Node_78["78: NodeType.ENDIF - "]
    Node_78 --> Node_79
    Node_79["79: NodeType.RETURN - _storeTellorPrice(tellorResponse)"]
    Node_80["80: NodeType.ENDIF - "]
    Node_80 --> Node_81
    Node_81["81: NodeType.IF - _chainlinkIsFrozen(chainlinkResponse)"]
    Node_81 --> Node_82
    Node_81 --> Node_90
    Node_82["82: NodeType.IF - _tellorIsBroken(tellorResponse)"]
    Node_82 --> Node_83
    Node_82 --> Node_85
    Node_83["83: NodeType.EXPRESSION - _changeStatus(Status.usingChainlinkTellorUntrusted)"]
    Node_83 --> Node_84
    Node_84["84: NodeType.RETURN - lastGoodPrice"]
    Node_85["85: NodeType.ENDIF - "]
    Node_85 --> Node_86
    Node_86["86: NodeType.IF - _tellorIsFrozen(tellorResponse)"]
    Node_86 --> Node_87
    Node_86 --> Node_88
    Node_87["87: NodeType.RETURN - lastGoodPrice"]
    Node_88["88: NodeType.ENDIF - "]
    Node_88 --> Node_89
    Node_89["89: NodeType.RETURN - _storeTellorPrice(tellorResponse)"]
    Node_90["90: NodeType.ENDIF - "]
    Node_90 --> Node_91
    Node_91["91: NodeType.IF - _tellorIsBroken(tellorResponse)"]
    Node_91 --> Node_92
    Node_91 --> Node_94
    Node_92["92: NodeType.EXPRESSION - _changeStatus(Status.usingChainlinkTellorUntrusted)"]
    Node_92 --> Node_93
    Node_93["93: NodeType.RETURN - _storeChainlinkPrice(chainlinkResponse)"]
    Node_94["94: NodeType.ENDIF - "]
    Node_94 --> Node_95
    Node_95["95: NodeType.IF - _tellorIsFrozen(tellorResponse)"]
    Node_95 --> Node_96
    Node_95 --> Node_97
    Node_96["96: NodeType.RETURN - lastGoodPrice"]
    Node_97["97: NodeType.ENDIF - "]
    Node_97 --> Node_98
    Node_98["98: NodeType.IF - _bothOraclesSimilarPrice(chainlinkResponse,tellorResponse)"]
    Node_98 --> Node_99
    Node_98 --> Node_101
    Node_99["99: NodeType.EXPRESSION - _changeStatus(Status.chainlinkWorking)"]
    Node_99 --> Node_100
    Node_100["100: NodeType.RETURN - _storeChainlinkPrice(chainlinkResponse)"]
    Node_101["101: NodeType.ENDIF - "]
    Node_101 --> Node_102
    Node_102["102: NodeType.EXPRESSION - _changeStatus(Status.usingTellorChainlinkUntrusted)"]
    Node_102 --> Node_103
    Node_103["103: NodeType.RETURN - _storeTellorPrice(tellorResponse)"]
    Node_104["104: NodeType.ENDIF - "]
    Node_104 --> Node_105
    Node_105["105: NodeType.IF - status == Status.usingChainlinkTellorUntrusted"]
    Node_105 --> Node_106
    Node_105 --> Node_122
    Node_106["106: NodeType.IF - _chainlinkIsBroken(chainlinkResponse,prevChainlinkResponse)"]
    Node_106 --> Node_107
    Node_106 --> Node_109
    Node_107["107: NodeType.EXPRESSION - _changeStatus(Status.bothOraclesUntrusted)"]
    Node_107 --> Node_108
    Node_108["108: NodeType.RETURN - lastGoodPrice"]
    Node_109["109: NodeType.ENDIF - "]
    Node_109 --> Node_110
    Node_110["110: NodeType.IF - _chainlinkIsFrozen(chainlinkResponse)"]
    Node_110 --> Node_111
    Node_110 --> Node_112
    Node_111["111: NodeType.RETURN - lastGoodPrice"]
    Node_112["112: NodeType.ENDIF - "]
    Node_112 --> Node_113
    Node_113["113: NodeType.IF - _bothOraclesLiveAndUnbrokenAndSimilarPrice(chainlinkResponse,prevChainlinkResponse,tellorResponse)"]
    Node_113 --> Node_114
    Node_113 --> Node_116
    Node_114["114: NodeType.EXPRESSION - _changeStatus(Status.chainlinkWorking)"]
    Node_114 --> Node_115
    Node_115["115: NodeType.RETURN - _storeChainlinkPrice(chainlinkResponse)"]
    Node_116["116: NodeType.ENDIF - "]
    Node_116 --> Node_117
    Node_117["117: NodeType.IF - _chainlinkPriceChangeAboveMax(chainlinkResponse,prevChainlinkResponse)"]
    Node_117 --> Node_118
    Node_117 --> Node_120
    Node_118["118: NodeType.EXPRESSION - _changeStatus(Status.bothOraclesUntrusted)"]
    Node_118 --> Node_119
    Node_119["119: NodeType.RETURN - lastGoodPrice"]
    Node_120["120: NodeType.ENDIF - "]
    Node_120 --> Node_121
    Node_121["121: NodeType.RETURN - _storeChainlinkPrice(chainlinkResponse)"]
    Node_122["122: NodeType.ENDIF - "]
```

### Source Mapping
Declared in: `certora-ac-datasets/detasets/web3bugs/dataset/web3bugs/66/packages/contracts/contracts/PriceFeed.sol` on lines **129** to **334**

```solidity
    function fetchPrice() external returns (uint) {
        // Get current and previous price data from Chainlink, and current price data from Tellor
        ChainlinkResponse memory chainlinkResponse = _getCurrentChainlinkResponse();
        ChainlinkResponse memory prevChainlinkResponse = _getPrevChainlinkResponse(chainlinkResponse.roundId, chainlinkResponse.decimals);
        TellorResponse memory tellorResponse = _getCurrentTellorResponse();

        // --- CASE 1: System fetched last price from Chainlink  ---
        if (status == Status.chainlinkWorking) {
            // If Chainlink is broken, try Tellor
            if (_chainlinkIsBroken(chainlinkResponse, prevChainlinkResponse)) {
                // If Tellor is broken then both oracles are untrusted, so return the last good price
                if (_tellorIsBroken(tellorResponse)) {
                    _changeStatus(Status.bothOraclesUntrusted);
                    return lastGoodPrice;
                }
                /*
                * If Tellor is only frozen but otherwise returning valid data, return the last good price.
                * Tellor may need to be tipped to return current data.
                */
                if (_tellorIsFrozen(tellorResponse)) {
                    _changeStatus(Status.usingTellorChainlinkUntrusted);
                    return lastGoodPrice;
                }

                // If Chainlink is broken and Tellor is working, switch to Tellor and return current Tellor price
                _changeStatus(Status.usingTellorChainlinkUntrusted);
                return _storeTellorPrice(tellorResponse);
            }

            // If Chainlink is frozen, try Tellor
            if (_chainlinkIsFrozen(chainlinkResponse)) {
                // If Tellor is broken too, remember Tellor broke, and return last good price
                if (_tellorIsBroken(tellorResponse)) {
                    _changeStatus(Status.usingChainlinkTellorUntrusted);
                    return lastGoodPrice;
                }

                // If Tellor is frozen or working, remember Chainlink froze, and switch to Tellor
                _changeStatus(Status.usingTellorChainlinkFrozen);

                if (_tellorIsFrozen(tellorResponse)) {return lastGoodPrice;}

                // If Tellor is working, use it
                return _storeTellorPrice(tellorResponse);
            }

            // If Chainlink price has changed by > 50% between two consecutive rounds, compare it to Tellor's price
            if (_chainlinkPriceChangeAboveMax(chainlinkResponse, prevChainlinkResponse)) {
                // If Tellor is broken, both oracles are untrusted, and return last good price
                if (_tellorIsBroken(tellorResponse)) {
                    _changeStatus(Status.bothOraclesUntrusted);
                    return lastGoodPrice;
                }

                // If Tellor is frozen, switch to Tellor and return last good price
                if (_tellorIsFrozen(tellorResponse)) {
                    _changeStatus(Status.usingTellorChainlinkUntrusted);
                    return lastGoodPrice;
                }

                /*
                * If Tellor is live and both oracles have a similar price, conclude that Chainlink's large price deviation between
                * two consecutive rounds was likely a legitmate market price movement, and so continue using Chainlink
                */
                if (_bothOraclesSimilarPrice(chainlinkResponse, tellorResponse)) {
                    return _storeChainlinkPrice(chainlinkResponse);
                }

                // If Tellor is live but the oracles differ too much in price, conclude that Chainlink's initial price deviation was
                // an oracle failure. Switch to Tellor, and use Tellor price
                _changeStatus(Status.usingTellorChainlinkUntrusted);
                return _storeTellorPrice(tellorResponse);
            }

            // If Chainlink is working and Tellor is broken, remember Tellor is broken
            if (_tellorIsBroken(tellorResponse)) {
                _changeStatus(Status.usingChainlinkTellorUntrusted);
            }

            // If Chainlink is working, return Chainlink current price (no status change)
            return _storeChainlinkPrice(chainlinkResponse);
        }


        // --- CASE 2: The system fetched last price from Tellor ---
        if (status == Status.usingTellorChainlinkUntrusted) {
            // If both Tellor and Chainlink are live, unbroken, and reporting similar prices, switch back to Chainlink
            if (_bothOraclesLiveAndUnbrokenAndSimilarPrice(chainlinkResponse, prevChainlinkResponse, tellorResponse)) {
                _changeStatus(Status.chainlinkWorking);
                return _storeChainlinkPrice(chainlinkResponse);
            }

            if (_tellorIsBroken(tellorResponse)) {
                _changeStatus(Status.bothOraclesUntrusted);
                return lastGoodPrice;
            }

            /*
            * If Tellor is only frozen but otherwise returning valid data, just return the last good price.
            * Tellor may need to be tipped to return current data.
            */
            if (_tellorIsFrozen(tellorResponse)) {return lastGoodPrice;}

            // Otherwise, use Tellor price
            return _storeTellorPrice(tellorResponse);
        }

        // --- CASE 3: Both oracles were untrusted at the last price fetch ---
        if (status == Status.bothOraclesUntrusted) {
            /*
            * If both oracles are now live, unbroken and similar price, we assume that they are reporting
            * accurately, and so we switch back to Chainlink.
            */
            if (_bothOraclesLiveAndUnbrokenAndSimilarPrice(chainlinkResponse, prevChainlinkResponse, tellorResponse)) {
                _changeStatus(Status.chainlinkWorking);
                return _storeChainlinkPrice(chainlinkResponse);
            }

            // Otherwise, return the last good price - both oracles are still untrusted (no status change)
            return lastGoodPrice;
        }

        // --- CASE 4: Using Tellor, and Chainlink is frozen ---
        if (status == Status.usingTellorChainlinkFrozen) {
            if (_chainlinkIsBroken(chainlinkResponse, prevChainlinkResponse)) {
                // If both Oracles are broken, return last good price
                if (_tellorIsBroken(tellorResponse)) {
                    _changeStatus(Status.bothOraclesUntrusted);
                    return lastGoodPrice;
                }

                // If Chainlink is broken, remember it and switch to using Tellor
                _changeStatus(Status.usingTellorChainlinkUntrusted);

                if (_tellorIsFrozen(tellorResponse)) {return lastGoodPrice;}

                // If Tellor is working, return Tellor current price
                return _storeTellorPrice(tellorResponse);
            }

            if (_chainlinkIsFrozen(chainlinkResponse)) {
                // if Chainlink is frozen and Tellor is broken, remember Tellor broke, and return last good price
                if (_tellorIsBroken(tellorResponse)) {
                    _changeStatus(Status.usingChainlinkTellorUntrusted);
                    return lastGoodPrice;
                }

                // If both are frozen, just use lastGoodPrice
                if (_tellorIsFrozen(tellorResponse)) {return lastGoodPrice;}

                // if Chainlink is frozen and Tellor is working, keep using Tellor (no status change)
                return _storeTellorPrice(tellorResponse);
            }

            // if Chainlink is live and Tellor is broken, remember Tellor broke, and return Chainlink price
            if (_tellorIsBroken(tellorResponse)) {
                _changeStatus(Status.usingChainlinkTellorUntrusted);
                return _storeChainlinkPrice(chainlinkResponse);
            }

            // If Chainlink is live and Tellor is frozen, just use last good price (no status change) since we have no basis for comparison
            if (_tellorIsFrozen(tellorResponse)) {return lastGoodPrice;}

            // If Chainlink is live and Tellor is working, compare prices. Switch to Chainlink
            // if prices are within 5%, and return Chainlink price.
            if (_bothOraclesSimilarPrice(chainlinkResponse, tellorResponse)) {
                _changeStatus(Status.chainlinkWorking);
                return _storeChainlinkPrice(chainlinkResponse);
            }

            // Otherwise if Chainlink is live but price not within 5% of Tellor, distrust Chainlink, and return Tellor price
            _changeStatus(Status.usingTellorChainlinkUntrusted);
            return _storeTellorPrice(tellorResponse);
        }

        // --- CASE 5: Using Chainlink, Tellor is untrusted ---
        if (status == Status.usingChainlinkTellorUntrusted) {
            // If Chainlink breaks, now both oracles are untrusted
            if (_chainlinkIsBroken(chainlinkResponse, prevChainlinkResponse)) {
                _changeStatus(Status.bothOraclesUntrusted);
                return lastGoodPrice;
            }

            // If Chainlink is frozen, return last good price (no status change)
            if (_chainlinkIsFrozen(chainlinkResponse)) {
                return lastGoodPrice;
            }

            // If Chainlink and Tellor are both live, unbroken and similar price, switch back to chainlinkWorking and return Chainlink price
            if (_bothOraclesLiveAndUnbrokenAndSimilarPrice(chainlinkResponse, prevChainlinkResponse, tellorResponse)) {
                _changeStatus(Status.chainlinkWorking);
                return _storeChainlinkPrice(chainlinkResponse);
            }

            // If Chainlink is live but deviated >50% from it's previous price and Tellor is still untrusted, switch
            // to bothOraclesUntrusted and return last good price
            if (_chainlinkPriceChangeAboveMax(chainlinkResponse, prevChainlinkResponse)) {
                _changeStatus(Status.bothOraclesUntrusted);
                return lastGoodPrice;
            }

            // Otherwise if Chainlink is live and deviated <50% from it's previous price and Tellor is still untrusted,
            // return Chainlink price (no status change)
            return _storeChainlinkPrice(chainlinkResponse);
        }
    }

```

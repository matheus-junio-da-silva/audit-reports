// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeCast.sol";
import "hardhat/console.sol";
import "./lib/NativeMetaTransaction.sol";
import "./interfaces/IRCTreasury.sol";
import "./interfaces/IRCMarket.sol";
import "./interfaces/IRCOrderbook.sol";

/// @title Reality Cards Orderbook
/// @author Daniel Chilvers
/// @notice If you have found a bug, please contact andrew@realitycards.io- no hack pls!!
contract RCOrderbook is Ownable, NativeMetaTransaction, IRCOrderbook {
    /*╔═════════════════════════════════╗
      ║            VARIABLES            ║
      ╚═════════════════════════════════╝*/

    /// @dev a record of a users single bid
    struct Bid {
        address market;
        address next;
        address prev;
        uint64 token;
        uint128 price;
        uint64 timeHeldLimit;
    }
    /// @dev maps a user address to an array of their bids
    mapping(address => Bid[]) public user;
    /// @dev index of a bid record in the user array, User|Market|Token->Index
    mapping(address => mapping(address => mapping(uint256 => uint256)))
        public index;

    /// @dev record of market specific variables
    struct Market {
        uint64 mode;
        uint64 tokenCount;
        uint64 minimumPriceIncreasePercent;
        uint64 minimumRentalDuration;
    }
    /// @dev map a market address to a market record
    mapping(address => Market) public market;
    /// @dev true if the address is a market
    mapping(address => bool) public isMarket;
    /// @dev find the current owner of a token in a given market. Market -> Token -> Owner
    mapping(address => mapping(uint256 => address)) public ownerOf;

    /// @dev an array of closed markets, used to reduce user bid rates
    address[] public closedMarkets;
    /// @dev how far through the array a given user is, saves iterating the whole array every time.
    mapping(address => uint256) public userClosedMarketIndex;

    ///// GOVERNANCE VARIABLES /////
    /// @dev only allow the uberOwner to call certain functions
    address public uberOwner;
    /// @dev the current factory address
    address public factoryAddress;
    /// @dev the current treasury address
    address public treasuryAddress;
    IRCTreasury public treasury;
    /// @dev max number of searches to place an order in the book
    /// @dev current estimates place limit around 2000
    uint256 public maxSearchIterations = 1000;
    /// @dev max number of records to delete in one transaction
    uint256 public maxDeletions = 70;
    /// @dev number of bids a user should clean when placing a new bid
    uint256 public cleaningLoops = 2;
    /// @dev nonce emitted with orderbook insertions, for frontend sorting
    uint256 public nonce;

    /*╔═════════════════════════════════╗
      ║          MODIFIERS              ║
      ╚═════════════════════════════════╝*/

    /// @notice only allow markets to call certain functions
    modifier onlyMarkets {
        require(isMarket[msgSender()], "Not authorised");
        _;
    }

    /*╔═════════════════════════════════╗
      ║            EVENTS               ║
      ╚═════════════════════════════════╝*/

    /// @dev emitted every time an order is added to the orderbook
    event LogAddToOrderbook(
        address indexed newOwner,
        uint256 indexed newPrice,
        uint256 timeHeldLimit,
        uint256 nonce,
        uint256 indexed tokenId,
        address market
    );
    /// @dev emitted when an order is removed from an active market
    event LogRemoveFromOrderbook(
        address indexed owner,
        address indexed market,
        uint256 indexed tokenId
    );

    /*╔═════════════════════════════════╗
      ║         CONSTRUCTOR             ║
      ╚═════════════════════════════════╝*/

    constructor(address _factoryAddress, address _treasuryAddress) {
        factoryAddress = _factoryAddress;
        treasuryAddress = _treasuryAddress;
        treasury = IRCTreasury(treasuryAddress);
        uberOwner = msgSender();
    }

    /*╔═════════════════════════════════╗
      ║         GOVERNANCE              ║
      ╚═════════════════════════════════╝*/

    function changeUberOwner(address _newUberOwner) external override {
        require(msgSender() == uberOwner, "Extremely Verboten");
        require(_newUberOwner != address(0));
        uberOwner = _newUberOwner;
    }

    function setFactoryAddress(address _newFactory) external override {
        require(msgSender() == uberOwner, "Extremely Verboten");
        require(_newFactory != address(0));
        factoryAddress = _newFactory;
    }

    function setLimits(
        uint256 _deletionLimit,
        uint256 _cleaningLimit,
        uint256 _searchLimit
    ) external override {
        require(msgSender() == uberOwner, "Extremely Verboten");
        if (_deletionLimit != 0) {
            maxDeletions = _deletionLimit;
        }
        if (_cleaningLimit != 0) {
            cleaningLoops = _cleaningLimit;
        }
        if (_searchLimit != 0) {
            maxSearchIterations = _searchLimit;
        }
    }

    /*╔═════════════════════════════════════╗
      ║             INSERTIONS              ║
      ║ functions that add to the orderbook ║
      ╚═════════════════════════════════════╝*/

    /// @notice adds a new market to the orderbook
    function addMarket(
        address _market,
        uint256 _cardCount,
        uint256 _minIncrease
    ) external override {
        require(msgSender() == factoryAddress);
        isMarket[_market] = true;
        market[_market].tokenCount = SafeCast.toUint64(_cardCount);
        market[_market].minimumPriceIncreasePercent = SafeCast.toUint64(
            _minIncrease
        );
        market[_market].minimumRentalDuration = SafeCast.toUint64(
            1 days / treasury.minRentalDayDivisor()
        );
        for (uint64 i; i < _cardCount; i++) {
            // create new record for each card that becomes the head&tail of the linked list
            Bid memory _newBid;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001003d,0)}
            _newBid.market = _market;address certora_local71 = _newBid.market;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000047,certora_local71)}
            _newBid.token = i;uint64 certora_local72 = _newBid.token;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000048,certora_local72)}
            _newBid.prev = _market;address certora_local73 = _newBid.prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000049,certora_local73)}
            _newBid.next = _market;address certora_local74 = _newBid.next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000004a,certora_local74)}
            _newBid.price = 0;uint128 certora_local75 = _newBid.price;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000004b,certora_local75)}
            _newBid.timeHeldLimit = type(uint64).max;uint64 certora_local76 = _newBid.timeHeldLimit;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000004c,certora_local76)}
            index[_market][_market][i] = user[_market].length;
            user[_market].push(_newBid);
        }
    }

    /// @notice adds or updates a bid in the orderbook
    /// @param _user the user placing the bid
    /// @param _card the token to place the bid on
    /// @param _price the price of the new bid
    /// @param _timeHeldLimit an optional time limit for the bid
    /// @param _prevUserAddress to help find where to insert the bid
    function addBidToOrderbook(
        address _user,
        uint256 _card,
        uint256 _price,
        uint256 _timeHeldLimit,
        address _prevUserAddress
    ) external override onlyMarkets {
        // each new bid can help clean up some junk
        cleanWastePile();

        if (user[_user].length == 0 && closedMarkets.length > 0) {
            //users first bid, skip already closed markets
            userClosedMarketIndex[_user] = closedMarkets.length - 1;
        }

        address _market = msgSender();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000002,_market)}
        if (_prevUserAddress == address(0)) {
            _prevUserAddress = _market;
        } else {
            require(
                user[_prevUserAddress][index[_prevUserAddress][_market][_card]]
                    .price >= _price,
                "Location too low"
            );
        }
        Bid storage _prevUser =
            user[_prevUserAddress][index[_prevUserAddress][_market][_card]];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010003,0)}

        if (bidExists(_user, _market, _card)) {
            // old bid exists, update it
            _updateBidInOrderbook(
                _user,
                _market,
                _card,
                _price,
                _timeHeldLimit,
                _prevUser
            );
        } else {
            // new bid, add it
            _newBidInOrderbook(
                _user,
                _market,
                _card,
                _price,
                _timeHeldLimit,
                _prevUser
            );
        }
    }

    /// @dev finds the correct location in the orderbook for a given bid
    /// @dev returns an adjusted (lowered) bid price if necessary.
    function _searchOrderbook(
        Bid storage _prevUser,
        address _market,
        uint256 _card,
        uint256 _price
    ) internal view returns (Bid storage, uint256) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 4) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110005, 585) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00116003, _price) }
        uint256 _minIncrease = market[_market].minimumPriceIncreasePercent;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,_minIncrease)}
        Bid storage _nextUser =
            user[_prevUser.next][index[_prevUser.next][_market][_card]];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010005,0)}
        uint256 _requiredPrice =
            (_nextUser.price * (_minIncrease + (100))) / (100);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,_requiredPrice)}

        uint256 i = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,i)}
        while (
            // break loop if match price above AND above price below (so if either is false, continue, hence OR )
            // if match previous then must be greater than next to continue
            (_price != _prevUser.price || _price <= _nextUser.price) &&
            // break loop if price x% above below
            _price < _requiredPrice &&
            // break loop if hits max iterations
            i < maxSearchIterations
        ) {
            _prevUser = _nextUser;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002004d,0)}
            _nextUser = user[_prevUser.next][
                index[_prevUser.next][_market][_card]
            ];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002004e,0)}
            _requiredPrice = (_nextUser.price * (_minIncrease + (100))) / (100);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000004f,_requiredPrice)}
            i++;
        }
        require(i < maxSearchIterations, "Position in orderbook not found");

        // if previous price is zero it must be the market and this is a new owner
        // .. then don't reduce their price, we already checked they are 10% higher
        // .. than the previous owner.
        if (_prevUser.price != 0 && _prevUser.price < _price) {
            _price = _prevUser.price;
        }
        return (_prevUser, _price);
    }

    /// @dev add a new bid to the orderbook
    function _newBidInOrderbook(
        address _user,
        address _market,
        uint256 _card,
        uint256 _price,
        uint256 _timeHeldLimit,
        Bid storage _prevUser
    ) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 6) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120005, 37449) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00126005, _prevUser.slot) }
        if (ownerOf[_market][_card] != _market) {
            (_prevUser, _price) = _searchOrderbook(
                _prevUser,
                _market,
                _card,
                _price
            );
        }

        Bid storage _nextUser =
            user[_prevUser.next][index[_prevUser.next][_market][_card]];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010008,0)}

        // create new record
        Bid memory _newBid;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010009,0)}
        _newBid.market = _market;address certora_local44 = _newBid.market;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002c,certora_local44)}
        _newBid.token = SafeCast.toUint64(_card);uint64 certora_local45 = _newBid.token;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002d,certora_local45)}
        _newBid.prev = _nextUser.prev;address certora_local46 = _newBid.prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002e,certora_local46)}
        _newBid.next = _prevUser.next;address certora_local47 = _newBid.next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002f,certora_local47)}
        _newBid.price = SafeCast.toUint128(_price);uint128 certora_local48 = _newBid.price;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000030,certora_local48)}
        _newBid.timeHeldLimit = SafeCast.toUint64(_timeHeldLimit);uint64 certora_local49 = _newBid.timeHeldLimit;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000031,certora_local49)}

        // insert in linked list
        _nextUser.prev = _user;address certora_local50 = _nextUser.prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000032,certora_local50)} // next record update prev link
        _prevUser.next = _user;address certora_local51 = _prevUser.next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000033,certora_local51)} // prev record update next link
        user[_user].push(_newBid);

        // update the index to help find the record later
        index[_user][_market][_card] = user[_user].length - (1);

        emit LogAddToOrderbook(
            _user,
            _price,
            _timeHeldLimit,
            nonce,
            _card,
            _market
        );
        nonce++;

        // update treasury values and transfer ownership if required
        treasury.increaseBidRate(_user, _price);
        if (user[_user][index[_user][_market][_card]].prev == _market) {
            address _oldOwner = user[_user][index[_user][_market][_card]].next;
            transferCard(_market, _card, _oldOwner, _user, _price);
            treasury.updateRentalRate(
                _oldOwner,
                _user,
                user[_oldOwner][index[_oldOwner][_market][_card]].price,
                _price,
                block.timestamp
            );
        }
    }

    /// @dev updates a bid that is already in the orderbook
    function _updateBidInOrderbook(
        address _user,
        address _market,
        uint256 _card,
        uint256 _price,
        uint256 _timeHeldLimit,
        Bid storage _prevUser
    ) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 6) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140005, 37449) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00146005, _prevUser.slot) }
        // TODO no need to unlink and relink if bid doesn't change position in orderbook
        // unlink current bid
        Bid storage _currUser = user[_user][index[_user][_market][_card]];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000a,0)}
        user[_currUser.next][index[_currUser.next][_market][_card]]
            .prev = _currUser.prev;
        user[_currUser.prev][index[_currUser.prev][_market][_card]]
            .next = _currUser.next;
        bool _owner = _currUser.prev == _market;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000b,_owner)}

        // find new position
        (_prevUser, _price) = _searchOrderbook(
            _prevUser,
            _market,
            _card,
            _price
        );assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020034,0)}
        Bid storage _nextUser =
            user[_prevUser.next][index[_prevUser.next][_market][_card]];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000c,0)}

        // update price, save old price for rental rate adjustment later
        (_currUser.price, _price) = (
            SafeCast.toUint128(_price),
            uint256(_currUser.price)
        );assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00020035,0)}
        _currUser.timeHeldLimit = SafeCast.toUint64(_timeHeldLimit);uint64 certora_local54 = _currUser.timeHeldLimit;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000036,certora_local54)}

        // relink bid
        _currUser.next = _prevUser.next;address certora_local55 = _currUser.next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000037,certora_local55)}
        _currUser.prev = _nextUser.prev;address certora_local56 = _currUser.prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000038,certora_local56)}
        _nextUser.prev = _user;address certora_local57 = _nextUser.prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000039,certora_local57)} // next record update prev link
        _prevUser.next = _user;address certora_local58 = _prevUser.next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003a,certora_local58)} // prev record update next link

        emit LogAddToOrderbook(
            _user,
            _currUser.price,
            _timeHeldLimit,
            nonce,
            _card,
            _market
        );
        nonce++;

        // update treasury values and transfer ownership if required
        treasury.increaseBidRate(_user, _currUser.price);
        treasury.decreaseBidRate(_user, _price);
        if (_owner && _currUser.prev == _market) {
            // if owner before and after, update the price difference
            transferCard(_market, _card, _user, _user, _currUser.price);
            treasury.updateRentalRate(
                _user,
                _user,
                _price,
                _currUser.price,
                block.timestamp
            );
        } else if (_owner && _currUser.prev != _market) {
            // if owner before and not after, remove the old price
            address _newOwner =
                user[_market][index[_market][_market][_card]].next;
            uint256 _newPrice =
                user[_newOwner][index[_newOwner][_market][_card]].price;
            treasury.updateRentalRate(
                _user,
                _newOwner,
                _price,
                _newPrice,
                block.timestamp
            );
            transferCard(_market, _card, _user, _newOwner, _newPrice);
        } else if (!_owner && _currUser.prev == _market) {
            // if not owner before but is owner after, add new price
            address _oldOwner = _currUser.next;
            uint256 _oldPrice =
                user[_oldOwner][index[_oldOwner][_market][_card]].price;
            treasury.updateRentalRate(
                _oldOwner,
                _user,
                _oldPrice,
                _currUser.price,
                block.timestamp
            );
            transferCard(_market, _card, _oldOwner, _user, _currUser.price);
        }
    }

    /*╔══════════════════════════════════════════╗
      ║                DELETIONS                 ║      
      ║ functions that remove from the orderbook ║
      ╚══════════════════════════════════════════╝*/

    /// @notice removes a single bid from the orderbook - onlyMarkets
    function removeBidFromOrderbook(address _user, uint256 _card)
        public
        override
        logInternal23(_card)onlyMarkets
    {
        address _market = msgSender();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000d,_market)}
        // update rates
        Bid storage _currUser = user[_user][index[_user][_market][_card]];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001000e,0)}
        treasury.decreaseBidRate(_user, _currUser.price);
        if (_currUser.prev == _market) {
            // user is owner, deal with it
            uint256 _price =
                user[_currUser.next][index[_currUser.next][_market][_card]]
                    .price;
            transferCard(_market, _card, _user, _currUser.next, _price);
            treasury.updateRentalRate(
                _user,
                _currUser.next,
                _currUser.price,
                _price,
                block.timestamp
            );
        }
        // extract from linked list
        address _tempNext = _currUser.next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000f,_tempNext)}
        address _tempPrev = _currUser.prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000010,_tempPrev)}
        user[_tempNext][index[_tempNext][_market][_card]].prev = _tempPrev;
        user[_tempPrev][index[_tempPrev][_market][_card]].next = _tempNext;

        // overwrite array element
        uint256 _index = index[_user][_market][_card];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000011,_index)}
        uint256 _lastRecord = user[_user].length - (1);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000012,_lastRecord)}

        // no point overwriting itself
        if (_index != _lastRecord) {
            user[_user][_index] = user[_user][_lastRecord];
        }
        user[_user].pop();

        // update the index to help find the record later
        index[_user][_market][_card] = 0;
        if (user[_user].length != 0 && _index != _lastRecord) {
            index[_user][user[_user][_index].market][
                user[_user][_index].token
            ] = _index;
        }
        emit LogRemoveFromOrderbook(_user, _market, _card);
    }modifier logInternal23(uint256 _card) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00176001, _card) } _; }

    /// @dev removes a single bid from the orderbook, doesn't update ownership
    function _removeBidFromOrderbookIgnoreOwner(address _user, uint256 _card)
        internal
        returns (uint256 _newPrice)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00156001, _card) }
        address _market = msgSender();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000013,_market)}
        // update rates
        Bid storage _currUser = user[_user][index[_user][_market][_card]];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010014,0)}
        treasury.decreaseBidRate(_user, _currUser.price);

        // extract from linked list
        address _tempNext = _currUser.next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000015,_tempNext)}
        address _tempPrev = _currUser.prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000016,_tempPrev)}
        user[_tempNext][index[_tempNext][_market][_card]].prev = _tempPrev;
        user[_tempPrev][index[_tempPrev][_market][_card]].next = _tempNext;

        // return next users price to check they're eligable later
        _newPrice = user[_tempNext][index[_tempNext][_market][_card]].price;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003b,_newPrice)}

        // overwrite array element
        uint256 _index = index[_user][_market][_card];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000017,_index)}
        uint256 _lastRecord = user[_user].length - 1;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000018,_lastRecord)}
        // no point overwriting itself
        if (_index != _lastRecord) {
            user[_user][_index] = user[_user][_lastRecord];
        }
        user[_user].pop();

        // update the index to help find the record later
        index[_user][_market][_card] = 0;
        if (user[_user].length != 0 && _index != _lastRecord) {
            index[_user][user[_user][_index].market][
                user[_user][_index].token
            ] = _index;
        }
        emit LogRemoveFromOrderbook(_user, _market, _card);
    }

    /// @notice find the next valid owner of a given card - onlyMarkets
    /// @param _card the token to remove
    /// @param _timeOwnershipChanged the timestamp, used to backdate ownership changes
    function findNewOwner(uint256 _card, uint256 _timeOwnershipChanged)
        external
        override
        onlyMarkets
        returns (address _newOwner)
    {
        address _market = msgSender();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000019,_market)}
        // the market is the head of the list, the next bid is therefore the owner
        Bid storage _head = user[_market][index[_market][_market][_card]];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001001a,0)}
        address _oldOwner = _head.next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001b,_oldOwner)}
        uint256 _oldPrice =
            user[_oldOwner][index[_oldOwner][_market][_card]].price;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001c,_oldPrice)}
        uint256 minimumTimeToOwnTo =
            _timeOwnershipChanged + market[_market].minimumRentalDuration;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001d,minimumTimeToOwnTo)}
        uint256 _newPrice;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001e,_newPrice)}

        // delete current owner
        do {
            _newPrice = _removeBidFromOrderbookIgnoreOwner(_head.next, _card);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000050,_newPrice)}
            // delete next bid if foreclosed
        } while (
            treasury.foreclosureTimeUser(
                _head.next,
                _newPrice,
                _timeOwnershipChanged
            ) < minimumTimeToOwnTo
        );

        // the old owner is dead, long live the new owner
        _newOwner = user[_market][index[_market][_market][_card]].next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003c,_newOwner)}
        treasury.updateRentalRate(
            _oldOwner,
            _newOwner,
            _oldPrice,
            _newPrice,
            _timeOwnershipChanged
        );
        transferCard(_market, _card, _oldOwner, _newOwner, _newPrice);
    }

    /// @notice when a user has foreclosed we can freely delete their bids
    /// @param _user the user whose bids to start deleting
    /// @return _userForeclosed if the user doesn't have bids left they are considered not foreclosed anymore
    function removeUserFromOrderbook(address _user)
        external
        override
        returns (bool _userForeclosed)
    {
        require(treasury.isForeclosed(_user), "User must be foreclosed");
        uint256 i = user[_user].length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001f,i)}
        uint256 _limit = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000020,_limit)}
        if (i > maxDeletions) {
            _limit = i - maxDeletions;
        }
        address _market = user[_user][i - 1].market;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000021,_market)}
        uint256 _card = user[_user][i - 1].token;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000022,_card)}

        do {
            i--;
            index[_user][user[_user][i].market][user[_user][i].token] = 0;
            address _tempPrev = user[_user][i].prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003e,_tempPrev)}
            address _tempNext = user[_user][i].next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000003f,_tempNext)}

            // reduce the rentalRate if they are owner
            if (_tempPrev == user[_user][i].market) {
                _market = user[_user][i].market;
                _card = user[_user][i].token;
                uint256 _price =
                    user[_tempNext][index[_tempNext][_market][_card]].price;
                treasury.updateRentalRate(
                    _user,
                    _tempNext,
                    user[_user][i].price,
                    _price,
                    block.timestamp
                );
                transferCard(_market, _card, _user, _tempNext, _price);
            }

            treasury.decreaseBidRate(_user, user[_user][i].price);

            user[_tempNext][
                index[_tempNext][user[_user][i].market][user[_user][i].token]
            ]
                .prev = _tempPrev;
            user[_tempPrev][
                index[_tempPrev][user[_user][i].market][user[_user][i].token]
            ]
                .next = _tempNext;
            user[_user].pop();
        } while (user[_user].length > _limit);
        if (user[_user].length == 0) {
            treasury.resetUser(_user);
            _userForeclosed = false;
        } else {
            _userForeclosed = true;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000051,_userForeclosed)}
        }
    }

    /// @notice reduces the rentalRates of the card owners when a market closes
    /// @dev too many bidders to reduce all bid rates also
    function closeMarket() external override onlyMarkets {
        address _market = msgSender();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000023,_market)}
        closedMarkets.push(_market);

        for (uint64 i = 0; i < market[_market].tokenCount; i++) {
            // reduce owners rental rate
            address _owner = user[_market][index[_market][_market][i]].next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000040,_owner)}
            uint256 _price = user[_owner][index[_owner][_market][i]].price;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000041,_price)}
            treasury.updateRentalRate(
                _owner,
                _market,
                _price,
                0,
                block.timestamp
            );

            // store first and last bids for later
            address _firstBid = _owner;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000042,_firstBid)}
            address _lastBid = user[_market][index[_market][_market][i]].prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000043,_lastBid)}

            // detach market from rest of list
            user[_market][index[_market][_market][i]].prev = _market;
            user[_market][index[_market][_market][i]].next = _market;
            user[_firstBid][index[_market][_firstBid][i]].prev = address(this);
            user[_lastBid][index[_market][_lastBid][i]].next = address(this);

            // insert bids in the waste pile
            Bid memory _newBid;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010044,0)}
            _newBid.market = _market;address certora_local82 = _newBid.market;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000052,certora_local82)}
            _newBid.token = i;uint64 certora_local83 = _newBid.token;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000053,certora_local83)}
            _newBid.prev = _lastBid;address certora_local84 = _newBid.prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000054,certora_local84)}
            _newBid.next = _firstBid;address certora_local85 = _newBid.next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000055,certora_local85)}
            _newBid.price = 0;uint128 certora_local86 = _newBid.price;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000056,certora_local86)}
            _newBid.timeHeldLimit = 0;uint64 certora_local87 = _newBid.timeHeldLimit;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000057,certora_local87)}
            user[address(this)].push(_newBid);
        }
    }

    /// @notice Remove bids in closed markets for a given user
    /// @notice this can reduce the users bidRate and chance to foreclose
    /// @param _user the address of the users bids to remove
    function removeOldBids(address _user) external override {
        address _market;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000024,_market)}
        uint256 _cardCount;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000025,_cardCount)}
        uint256 _loopCounter;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000026,_loopCounter)}
        while (
            userClosedMarketIndex[_user] < closedMarkets.length &&
            _loopCounter + _cardCount < maxDeletions
        ) {
            _market = closedMarkets[userClosedMarketIndex[_user]];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000058,_market)}
            _cardCount = market[_market].tokenCount;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000059,_cardCount)}
            for (uint256 i = market[_market].tokenCount; i != 0; ) {
                i--;
                if (bidExists(_user, _market, i)) {
                    // reduce bidRate
                    uint256 _price =
                        user[_user][index[_user][_market][i]].price;
                    treasury.decreaseBidRate(_user, _price);

                    // preserve linked list
                    address _tempPrev =
                        user[_user][index[_user][_market][i]].prev;
                    address _tempNext =
                        user[_user][index[_user][_market][i]].next;

                    user[_tempNext][index[_tempNext][_market][i]]
                        .prev = _tempPrev;
                    user[_tempPrev][index[_tempPrev][_market][i]]
                        .next = _tempNext;

                    // delete bid
                    user[_user].pop();
                    index[_user][_market][i] = 0;

                    // count deletions
                    _loopCounter++;
                }
            }
            userClosedMarketIndex[_user]++;
        }
    }

    /// @dev remove bids in closed markets, not user specific
    function cleanWastePile() internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130004, 0) }
        uint256 i;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000027,i)}
        while (i < cleaningLoops && user[address(this)].length > 0) {
            uint256 _pileHeight = user[address(this)].length - 1;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000045,_pileHeight)}

            if (user[address(this)][_pileHeight].next == address(this)) {
                user[address(this)].pop();
            } else {
                address _market = user[address(this)][_pileHeight].market;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000060,_market)}
                uint256 _card = user[address(this)][_pileHeight].token;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000061,_card)}
                address _user =
                    user[address(this)][index[address(this)][_market][_card]]
                        .next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000062,_user)}

                Bid storage _currUser =
                    user[_user][index[_user][_market][_card]];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010063,0)}
                // extract from linked list
                address _tempNext = _currUser.next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000064,_tempNext)}
                address _tempPrev = _currUser.prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000065,_tempPrev)}
                user[_tempNext][index[_tempNext][_market][_card]]
                    .prev = _tempPrev;
                user[_tempPrev][index[_tempPrev][_market][_card]]
                    .next = _tempNext;

                // overwrite array element
                uint256 _index = index[_user][_market][_card];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000066,_index)}
                uint256 _lastRecord = user[_user].length - (1);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000067,_lastRecord)}
                // no point overwriting itself
                if (_index != _lastRecord) {
                    user[_user][_index] = user[_user][_lastRecord];
                }
                user[_user].pop();

                // update the index to help find the record later
                index[_user][_market][_card] = 0;
                if (user[_user].length != 0 && _index != _lastRecord) {
                    index[_user][user[_user][_index].market][
                        user[_user][_index].token
                    ] = _index;
                }
            }
            i++;
        }
    }

    /*╔═════════════════════════════════╗
      ║        HELPER FUNCTIONS         ║
      ╚═════════════════════════════════╝*/

    /// @notice check if a bid exists
    /// @param _user the address of the user
    /// @param _market the address of the market
    /// @param _card the card index
    /// @return if the bid exists or not
    function bidExists(
        address _user,
        address _market,
        uint256 _card
    ) public view override returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00196002, _card) }
        if (user[_user].length != 0) {
            //some bids exist
            if (index[_user][_market][_card] != 0) {
                // this bid exists
                return true;
            } else {
                // check bid isn't index 0
                if (
                    user[_user][0].market == _market &&
                    user[_user][0].token == _card
                ) {
                    return true;
                }
            }
        }
        return false;
    }

    function getBidValue(address _user, uint256 _card)
        external
        view
        override
        returns (uint256)
    {
        address _market = msgSender();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000028,_market)}
        if (bidExists(_user, _market, _card)) {
            return user[_user][index[_user][_market][_card]].price;
        } else {
            return 0;
        }
    }

    /// @dev just to pass old tests, not needed otherwise
    /// @dev to be deleted once tests updated
    function getBid(
        address _market,
        address _user,
        uint256 _card
    ) external view returns (Bid memory) {
        if (bidExists(_user, _market, _card)) {
            Bid memory _bid = user[_user][index[_user][_market][_card]];
            return _bid;
        } else {
            Bid memory _newBid;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010046,0)}
            _newBid.market = address(0);address certora_local90 = _newBid.market;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000005a,certora_local90)}
            _newBid.token = SafeCast.toUint64(_card);uint64 certora_local91 = _newBid.token;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000005b,certora_local91)}
            _newBid.prev = address(0);address certora_local92 = _newBid.prev;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000005c,certora_local92)}
            _newBid.next = address(0);address certora_local93 = _newBid.next;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000005d,certora_local93)}
            _newBid.price = 0;uint128 certora_local94 = _newBid.price;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000005e,certora_local94)}
            _newBid.timeHeldLimit = 0;uint64 certora_local95 = _newBid.timeHeldLimit;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000005f,certora_local95)}
            return _newBid;
        }
    }

    function getTimeHeldlimit(address _user, uint256 _card)
        external
        view
        override
        onlyMarkets
        returns (uint256)
    {
        return user[_user][index[_user][msgSender()][_card]].timeHeldLimit;
    }

    function setTimeHeldlimit(
        address _user,
        uint256 _card,
        uint256 _timeHeldLimit
    ) external override onlyMarkets {
        address _market = msgSender();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000029,_market)}
        require(bidExists(_user, _market, _card), "Bid doesn't exist");
        user[_user][index[_user][_market][_card]].timeHeldLimit = SafeCast
            .toUint64(_timeHeldLimit);
    }

    function reduceTimeHeldLimit(
        address _user,
        uint256 _card,
        uint256 _timeToReduce
    ) external override onlyMarkets {
        user[_user][index[_user][msgSender()][_card]].timeHeldLimit -= SafeCast
            .toUint64(_timeToReduce);
    }

    function transferCard(
        address _market,
        uint256 _card,
        address _oldOwner,
        address _newOwner,
        uint256 _price
    ) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 5) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160005, 4681) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00166004, _price) }
        ownerOf[_market][_card] = _newOwner;
        uint256 _timeLimit =
            user[_newOwner][index[_newOwner][_market][_card]].timeHeldLimit;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002a,_timeLimit)}
        IRCMarket _rcmarket = IRCMarket(_market);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001002b,0)}
        _rcmarket.transferCard(_oldOwner, _newOwner, _card, _price, _timeLimit);
    }
    /*
         ▲  
        ▲ ▲ 
              */
}

// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.4;

import "@openzeppelin/contracts/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts/utils/math/SafeCast.sol";
import "hardhat/console.sol";
import "./interfaces/IRealitio.sol";
import "./interfaces/IRCFactory.sol";
import "./interfaces/IRCTreasury.sol";
import "./interfaces/IRCMarket.sol";
import "./interfaces/IRCNftHubL2.sol";
import "./interfaces/IRCOrderbook.sol";
import "./lib/NativeMetaTransaction.sol";

/// @title Reality Cards Market
/// @author Andrew Stanger & Daniel Chilvers
/// @notice If you have found a bug, please contact andrew@realitycards.io- no hack pls!!
contract RCMarket is Initializable, NativeMetaTransaction, IRCMarket {
    /*╔═════════════════════════════════╗
      ║            VARIABLES            ║
      ╚═════════════════════════════════╝*/

    // CONTRACT SETUP
    /// @dev = how many outcomes/teams/NFTs etc
    uint256 public numberOfCards;
    uint256 public constant MAX_UINT256 = type(uint256).max;
    uint256 public constant MIN_RENTAL_VALUE = 1 ether;
    States public override state;
    /// @dev type of event.
    enum Mode {CLASSIC, WINNER_TAKES_ALL, SAFE_MODE}
    Mode public mode;
    /// @dev so the Factory can check it's a market
    bool public constant override isMarket = true;
    /// @dev counts the total NFTs minted across all events at the time market created
    /// @dev nft tokenId = card Id + totalNftMintCount
    uint256 public totalNftMintCount;

    // CONTRACT VARIABLES
    IRCTreasury public treasury;
    IRCFactory public factory;
    IRCNftHubL2 public nfthub;
    IRCOrderbook public orderbook;

    // PRICE, DEPOSITS, RENT
    /// @dev in wei
    mapping(uint256 => uint256) public cardPrice;
    /// @dev keeps track of all the rent paid by each user. So that it can be returned in case of an invalid market outcome.
    mapping(address => uint256) public rentCollectedPerUser;
    /// @dev keeps track of all the rent paid for each card, for card specific affiliate payout
    mapping(uint256 => uint256) public rentCollectedPerCard;
    /// @dev keeps track of the rent each user has paid for each card, for Safe mode payout
    mapping(address => mapping(uint256 => uint256))
        public rentCollectedPerUserPerCard;
    /// @dev an easy way to track the above across all cards
    uint256 public totalRentCollected;
    /// @dev prevents user from exiting and re-renting in the same block (limits troll attacks)
    mapping(address => uint256) public exitedTimestamp;

    // PARAMETERS
    /// @dev read from the Factory upon market creation, can not be changed for existing market
    /// @dev the minimum required price increase in %
    uint256 public minimumPriceIncreasePercent;
    /// @dev minimum rental duration (1 day divisor: i.e. 24 = 1 hour, 48 = 30 mins)
    uint256 public minRentalDayDivisor;
    /// @dev maximum number of times to calcualte rent in one transaction
    uint256 public maxRentIterations;

    // TIME
    /// @dev how many seconds each user has held each card for, for determining winnings
    mapping(uint256 => mapping(address => uint256)) public timeHeld;
    /// @dev sums all the timeHelds for each. Used when paying out. Should always increment at the same time as timeHeld
    mapping(uint256 => uint256) public totalTimeHeld;
    /// @dev used to determine the rent due. Rent is due for the period (now - timeLastCollected), at which point timeLastCollected is set to now.
    mapping(uint256 => uint256) public timeLastCollected;
    /// @dev to track the max timeheld of each card (for giving NFT to winner)
    mapping(uint256 => uint256) public longestTimeHeld;
    /// @dev to track who has owned it the most (for giving NFT to winner)
    mapping(uint256 => address) public longestOwner;
    /// @dev to track the card timeHeldLimit for the current owner
    mapping(uint256 => uint256) public cardTimeLimit;

    // TIMESTAMPS
    /// @dev when the market opens
    uint32 public marketOpeningTime;
    /// @dev when the market locks
    uint32 public override marketLockingTime;
    /// @dev when the question can be answered on realitio
    /// @dev only needed for circuit breaker
    uint32 public oracleResolutionTime;

    // PAYOUT VARIABLES
    uint256 public winningOutcome;
    /// @dev prevent users withdrawing twice
    mapping(address => bool) public userAlreadyWithdrawn;
    /// @dev prevent users claiming twice
    mapping(uint256 => mapping(address => bool)) public userAlreadyClaimed; // cardID // user // bool
    /// @dev the artist
    address public artistAddress;
    uint256 public artistCut;
    bool public artistPaid;
    /// @dev the affiliate
    address public affiliateAddress;
    uint256 public affiliateCut;
    bool public affiliatePaid;
    /// @dev the winner
    uint256 public winnerCut;
    /// @dev the market creator
    address public marketCreatorAddress;
    uint256 public creatorCut;
    bool public creatorPaid;
    /// @dev card specific recipients
    address[] public cardAffiliateAddresses;
    uint256 public cardAffiliateCut;
    mapping(uint256 => bool) public cardAffiliatePaid;

    // ORACLE VARIABLES
    bytes32 public questionId;
    bool public questionFinalised;
    address public arbitrator;
    uint32 public timeout;
    IRealitio public realitio;
    address public _realitioAddress;

    /*╔═════════════════════════════════╗
      ║             EVENTS              ║
      ╚═════════════════════════════════╝*/

    event LogNewOwner(uint256 indexed cardId, address indexed newOwner);
    event LogRentCollection(
        uint256 rentCollected,
        uint256 indexed newTimeHeld,
        uint256 indexed cardId,
        address indexed owner
    );
    event LogContractLocked(bool indexed didTheEventFinish);
    event LogWinnerKnown(uint256 indexed winningOutcome);
    event LogWinningsPaid(address indexed paidTo, uint256 indexed amountPaid);
    event LogStakeholderPaid(
        address indexed paidTo,
        uint256 indexed amountPaid
    );
    event LogRentReturned(
        address indexed returnedTo,
        uint256 indexed amountReturned
    );
    event LogStateChange(uint256 indexed newState);
    event LogUpdateTimeHeldLimit(
        address indexed owner,
        uint256 newLimit,
        uint256 cardId
    );
    event LogSponsor(address indexed sponsor, uint256 indexed amount);
    event LogNftUpgraded(
        uint256 indexed currentTokenId,
        uint256 indexed newTokenId
    );
    event LogPayoutDetails(
        address indexed artistAddress,
        address marketCreatorAddress,
        address affiliateAddress,
        address[] cardAffiliateAddresses,
        uint256 indexed artistCut,
        uint256 winnerCut,
        uint256 creatorCut,
        uint256 affiliateCut,
        uint256 cardAffiliateCut
    );
    event LogSettings(
        uint256 indexed minRentalDayDivisor,
        uint256 indexed minimumPriceIncreasePercent
    );
    event LogLongestOwner(uint256 cardId, address longestOwner);
    event LogQuestionPostedToOracle(
        address indexed marketAddress,
        bytes32 indexed questionId
    );

    /*╔═════════════════════════════════╗
      ║           CONSTRUCTOR           ║
      ╚═════════════════════════════════╝*/

    /// @param _mode 0 = normal, 1 = winner takes all, 2 = Safe Mode
    /// @param _timestamps for market opening, locking, and oracle resolution
    /// @param _numberOfCards how many Cards in this market
    /// @param _totalNftMintCount total existing Cards across all markets excl this event's Cards
    /// @param _artistAddress where to send artist's cut, if any
    /// @param _affiliateAddress where to send affiliate's cut, if any
    /// @param _cardAffiliateAddresses where to send card specific affiliate's cut, if any
    /// @param _marketCreatorAddress where to send market creator's cut, if any
    /// @param _realitioQuestion the question posted to the Oracle
    function initialize(
        uint256 _mode,
        uint32[] memory _timestamps,
        uint256 _numberOfCards,
        uint256 _totalNftMintCount,
        address _artistAddress,
        address _affiliateAddress,
        address[] memory _cardAffiliateAddresses,
        address _marketCreatorAddress,
        string calldata _realitioQuestion
    ) external override initializer {
        assert(_mode <= 2);

        // initialise MetaTransactions
        _initializeEIP712("RealityCardsMarket", "1");

        // external contract variables:
        factory = IRCFactory(msgSender());
        treasury = factory.treasury();
        nfthub = factory.nfthub();
        orderbook = factory.orderbook();

        // get adjustable parameters from the factory/treasury
        uint256[5] memory _potDistribution = factory.getPotDistribution();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00010002,0)}
        minRentalDayDivisor = treasury.minRentalDayDivisor();
        minimumPriceIncreasePercent = factory.minimumPriceIncreasePercent();
        maxRentIterations = factory.maxRentIterations();

        // initialiiize!
        winningOutcome = MAX_UINT256; // default invalid

        // assign arguments to public variables
        mode = Mode(_mode);
        numberOfCards = _numberOfCards;
        totalNftMintCount = _totalNftMintCount;
        marketOpeningTime = _timestamps[0];
        marketLockingTime = _timestamps[1];
        oracleResolutionTime = _timestamps[2];
        artistAddress = _artistAddress;
        marketCreatorAddress = _marketCreatorAddress;
        affiliateAddress = _affiliateAddress;
        cardAffiliateAddresses = _cardAffiliateAddresses;
        artistCut = _potDistribution[0];
        winnerCut = _potDistribution[1];
        creatorCut = _potDistribution[2];
        affiliateCut = _potDistribution[3];
        cardAffiliateCut = _potDistribution[4];
        (realitio, arbitrator, timeout) = factory.getOracleSettings();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0002001d,0)}

        // reduce artist cut to zero if zero adddress set
        if (_artistAddress == address(0)) {
            artistCut = 0;
        }

        // reduce affiliate cut to zero if zero adddress set
        if (_affiliateAddress == address(0)) {
            affiliateCut = 0;
        }

        // check the validity of card affiliate array.
        // if not valid, reduce payout to zero
        if (_cardAffiliateAddresses.length == _numberOfCards) {
            for (uint256 i = 0; i < _numberOfCards; i++) {
                if (_cardAffiliateAddresses[i] == address(0)) {
                    cardAffiliateCut = 0;
                }
            }
        } else {
            cardAffiliateCut = 0;
        }

        // if winner takes all mode, set winnerCut to max
        if (_mode == uint8(Mode.WINNER_TAKES_ALL)) {
            winnerCut =
                (((uint256(1000) - artistCut) - creatorCut) - affiliateCut) -
                cardAffiliateCut;
        }

        // post question to Oracle
        questionFinalised = false;
        _postQuestionToOracle(_realitioQuestion, _timestamps[2]);

        // move to OPEN immediately if market opening time in the past
        if (marketOpeningTime <= block.timestamp) {
            _incrementState();
        }

        emit LogPayoutDetails(
            _artistAddress,
            _marketCreatorAddress,
            _affiliateAddress,
            cardAffiliateAddresses,
            artistCut,
            winnerCut,
            creatorCut,
            affiliateCut,
            cardAffiliateCut
        );
        emit LogSettings(minRentalDayDivisor, minimumPriceIncreasePercent);
    }

    /*╔═════════════════════════════════╗
      ║            MODIFIERS            ║
      ╚═════════════════════════════════╝*/

    /// @notice automatically opens market if appropriate
    modifier autoUnlock() {
        if (marketOpeningTime <= block.timestamp && state == States.CLOSED) {
            _incrementState();
        }
        _;
    }

    /// @notice automatically locks market if appropriate
    modifier autoLock() {
        _;
        if (marketLockingTime <= block.timestamp) {
            lockMarket();
        }
    }

    /// @dev can only be called by Card owners
    modifier onlyTokenOwner(uint256 _token) {
        require(msgSender() == ownerOf(_token), "Not owner");
        _;
    }

    /*╔═════════════════════════════════╗
      ║     NFT HUB CONTRACT CALLS      ║
      ╚═════════════════════════════════╝*/

    /// @notice send NFT to mainnet
    /// @dev upgrades not possible if market not approved
    function upgradeCard(uint256 _card) external onlyTokenOwner(_card) {
        _checkState(States.WITHDRAW);
        require(
            !factory.trapIfUnapproved() ||
                factory.isMarketApproved(address(this)),
            "Upgrade blocked"
        );
        uint256 _tokenId = _card + totalNftMintCount;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000003,_tokenId)}
        _transferCard(ownerOf(_card), address(this), _card); // contract becomes final resting place
        nfthub.withdrawWithMetadata(_tokenId);
        emit LogNftUpgraded(_card, _tokenId);
    }

    /// @notice gets the owner of the NFT via their Card Id
    function ownerOf(uint256 _cardId) public view override returns (address) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0000, 1037618708510) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001e6000, _cardId) }
        uint256 _tokenId = _cardId + totalNftMintCount;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000004,_tokenId)}
        return nfthub.ownerOf(_tokenId);
    }

    /// @notice gets tokenURI via their Card Id
    function tokenURI(uint256 _cardId)
        public
        view
        override
        returns (string memory)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0000, 1037618708509) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001d6000, _cardId) }
        uint256 _tokenId = _cardId + totalNftMintCount;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000005,_tokenId)}
        return nfthub.tokenURI(_tokenId);
    }

    /// @notice transfer ERC 721 between users
    /// @dev called internally during contract open state
    function _transferCard(
        address _from,
        address _to,
        uint256 _cardId
    ) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0000, 1037618708492) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c0005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000c6002, _cardId) }
        require(
            _from != address(0) && _to != address(0),
            "Cannot send to/from zero address"
        );
        uint256 _tokenId = _cardId + totalNftMintCount;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000006,_tokenId)}

        assert(nfthub.transferNft(_from, _to, _tokenId));
        emit LogNewOwner(_cardId, _to);
    }

    /// @notice transfer ERC 721 between users
    /// @dev called externaly by Orderbook during contract open state
    function transferCard(
        address _from,
        address _to,
        uint256 _cardId,
        uint256 _price,
        uint256 _timeLimit
    ) external override {
        require(msgSender() == address(orderbook), "Not orderbook");
        _checkState(States.OPEN);
        if (_to != _from) {
            _transferCard(_from, _to, _cardId);
        }
        cardTimeLimit[_cardId] = _timeLimit;
        cardPrice[_cardId] = _price;
    }

    /*╔═════════════════════════════════╗
      ║        ORACLE FUNCTIONS         ║
      ╚═════════════════════════════════╝*/

    /// @dev called within initializer only
    function _postQuestionToOracle(
        string calldata _question,
        uint32 _oracleResolutionTime
    ) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0000, 1037618708493) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d0005, 209) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000d6002, _oracleResolutionTime) }
        questionId = realitio.askQuestion(
            2,
            _question,
            arbitrator,
            timeout,
            _oracleResolutionTime,
            0
        );
        emit LogQuestionPostedToOracle(address(this), questionId);
    }

    /// @notice has the oracle finalised
    function isFinalized() public view returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0000, 1037618708507) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001b0004, 0) }
        bool _isFinalized = realitio.isFinalized(questionId);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000007,_isFinalized)}
        return _isFinalized;
    }

    /// @dev sets the winning outcome
    /// @dev market.setWinner() will revert if done twice, because wrong state
    function getWinnerFromOracle() external {
        require(isFinalized(), "Oracle not finalised");
        // check market state to prevent market closing early
        require(marketLockingTime <= block.timestamp, "Market not finished");
        questionFinalised = true;
        bytes32 _winningOutcome = realitio.resultFor(questionId);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000008,_winningOutcome)}
        // call the market
        setWinner(uint256(_winningOutcome));
    }

    /// @dev admin override of the oracle
    function setAmicableResolution(uint256 _winningOutcome) external {
        require(msgSender() == factory.owner(), "Not authorised");
        questionFinalised = true;
        setWinner(_winningOutcome);
    }

    /*╔═════════════════════════════════╗
      ║  MARKET RESOLUTION FUNCTIONS    ║
      ╚═════════════════════════════════╝*/

    /// @notice checks whether the competition has ended, if so moves to LOCKED state
    /// @dev can be called by anyone
    /// @dev public because called within autoLock modifier & setWinner
    function lockMarket() public {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0000, 1037618708508) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001c0004, 0) }
        _checkState(States.OPEN);
        require(
            marketLockingTime <= block.timestamp,
            "Market has not finished"
        );
        // do a final rent collection before the contract is locked down

        if (collectRentAllCards()) {
            orderbook.closeMarket();
            _incrementState();

            for (uint256 i; i < numberOfCards; i++) {
                // bring the cards back to the market so the winners get the satisfcation of claiming them
                _transferCard(ownerOf(i), address(this), i);
                emit LogLongestOwner(i, longestOwner[i]);
            }
            emit LogContractLocked(true);
        }
    }

    /// @notice called by getWinnerFromOracle, sets the winner
    /// @param _winningOutcome the index of the winning card
    function setWinner(uint256 _winningOutcome) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0000, 1037618708495) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000f6000, _winningOutcome) }
        if (state == States.OPEN) {
            // change the locking time to allow lockMarket to lock
            marketLockingTime = SafeCast.toUint32(block.timestamp);
            lockMarket();
        }
        if (state == States.LOCKED) {
            // get the winner. This will revert if answer is not resolved.
            winningOutcome = _winningOutcome;
            _incrementState();
            emit LogWinnerKnown(winningOutcome);
        }
    }

    /// @notice pays out winnings, or returns funds
    function withdraw() external {
        _checkState(States.WITHDRAW);
        require(!userAlreadyWithdrawn[msgSender()], "Already withdrawn");
        userAlreadyWithdrawn[msgSender()] = true;
        if (totalTimeHeld[winningOutcome] > 0) {
            _payoutWinnings();
        } else {
            _returnRent();
        }
    }

    /// @notice the longest owner of each NFT gets to keep it
    /// @dev LOCKED or WITHDRAW states are fine- does not need to wait for winner to be known
    /// @param _card the id of the card, the index
    function claimCard(uint256 _card) external {
        _checkNotState(States.CLOSED);
        _checkNotState(States.OPEN);
        require(!userAlreadyClaimed[_card][msgSender()], "Already claimed");
        userAlreadyClaimed[_card][msgSender()] = true;
        require(longestOwner[_card] == msgSender(), "Not longest owner");
        _transferCard(ownerOf(_card), longestOwner[_card], _card);
    }

    /// @notice pays winnings
    function _payoutWinnings() internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100000, 1037618708496) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00100004, 0) }
        uint256 _winningsToTransfer = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000009,_winningsToTransfer)}
        uint256 _remainingCut =
            ((((uint256(1000) - artistCut) - affiliateCut) - cardAffiliateCut) -
                winnerCut) - creatorCut;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000a,_remainingCut)}
        // calculate longest owner's extra winnings, if relevant
        if (longestOwner[winningOutcome] == msgSender() && winnerCut > 0) {
            _winningsToTransfer = (totalRentCollected * winnerCut) / (1000);
        }
        uint256 _remainingPot = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000b,_remainingPot)}
        if (mode == Mode.SAFE_MODE) {
            // return all rent paid on winning card
            _remainingPot =
                ((totalRentCollected - rentCollectedPerCard[winningOutcome]) *
                    _remainingCut) /
                (1000);
            _winningsToTransfer += rentCollectedPerUserPerCard[msgSender()][
                winningOutcome
            ];
        } else {
            // calculate normal winnings, if any
            _remainingPot = (totalRentCollected * _remainingCut) / (1000);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000020,_remainingPot)}
        }
        uint256 _winnersTimeHeld = timeHeld[winningOutcome][msgSender()];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000c,_winnersTimeHeld)}
        uint256 _numerator = _remainingPot * _winnersTimeHeld;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000d,_numerator)}
        _winningsToTransfer =
            _winningsToTransfer +
            (_numerator / totalTimeHeld[winningOutcome]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001e,_winningsToTransfer)}
        require(_winningsToTransfer > 0, "Not a winner");
        _payout(msgSender(), _winningsToTransfer);
        emit LogWinningsPaid(msgSender(), _winningsToTransfer);
    }

    /// @notice returns all funds to users in case of invalid outcome
    function _returnRent() internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0000, 1037618708494) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff000e0004, 0) }
        // deduct artist share and card specific share if relevant but NOT market creator share or winner's share (no winner, market creator does not deserve)
        uint256 _remainingCut =
            ((uint256(1000) - artistCut) - affiliateCut) - cardAffiliateCut;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000e,_remainingCut)}
        uint256 _rentCollected = rentCollectedPerUser[msgSender()];assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000000f,_rentCollected)}
        require(_rentCollected > 0, "Paid no rent");
        uint256 _rentCollectedAdjusted =
            (_rentCollected * _remainingCut) / (1000);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000010,_rentCollectedAdjusted)}
        _payout(msgSender(), _rentCollectedAdjusted);
        emit LogRentReturned(msgSender(), _rentCollectedAdjusted);
    }

    /// @notice all payouts happen through here
    function _payout(address _recipient, uint256 _amount) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110000, 1037618708497) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00110005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00116001, _amount) }
        assert(treasury.payout(_recipient, _amount));
    }

    /// @dev the below functions pay stakeholders (artist, creator, affiliate, card specific affiliates)
    /// @dev they are not called within setWinner() because of the risk of an
    /// @dev ....  address being a contract which refuses payment, then nobody could get winnings
    /// @dev [hangover from when ether was native currency, keeping in case we return to this]

    /// @notice pay artist
    function payArtist() external {
        _checkState(States.WITHDRAW);
        require(!artistPaid, "Artist already paid");
        artistPaid = true;
        _processStakeholderPayment(artistCut, artistAddress);
    }

    /// @notice pay market creator
    function payMarketCreator() external {
        _checkState(States.WITHDRAW);
        require(totalTimeHeld[winningOutcome] > 0, "No winner");
        require(!creatorPaid, "Creator already paid");
        creatorPaid = true;
        _processStakeholderPayment(creatorCut, marketCreatorAddress);
    }

    /// @notice pay affiliate
    function payAffiliate() external {
        _checkState(States.WITHDRAW);
        require(!affiliatePaid, "Affiliate already paid");
        affiliatePaid = true;
        _processStakeholderPayment(affiliateCut, affiliateAddress);
    }

    /// @notice pay card affiliate
    /// @dev does not call _processStakeholderPayment because it works differently
    function payCardAffiliate(uint256 _card) external {
        _checkState(States.WITHDRAW);
        require(!cardAffiliatePaid[_card], "Card affiliate already paid");
        cardAffiliatePaid[_card] = true;
        uint256 _cardAffiliatePayment =
            (rentCollectedPerCard[_card] * cardAffiliateCut) / (1000);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000011,_cardAffiliatePayment)}
        if (_cardAffiliatePayment > 0) {
            _payout(cardAffiliateAddresses[_card], _cardAffiliatePayment);
            emit LogStakeholderPaid(
                cardAffiliateAddresses[_card],
                _cardAffiliatePayment
            );
        }
    }

    function _processStakeholderPayment(uint256 _cut, address _recipient)
        internal
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120000, 1037618708498) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00120005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00126001, _recipient) }
        if (_cut > 0) {
            uint256 _payment = (totalRentCollected * _cut) / (1000);
            _payout(_recipient, _payment);
            emit LogStakeholderPaid(_recipient, _payment);
        }
    }

    /*╔═════════════════════════════════╗
      ║         CORE FUNCTIONS          ║
      ╠═════════════════════════════════╣
      ║             EXTERNAL            ║
      ╚═════════════════════════════════╝*/

    /// @dev basically functions that have _checkState(States.OPEN) on first line

    /// @notice collects rent for all cards
    /// @dev cannot be external because it is called within the lockMarket function, therefore public
    function collectRentAllCards() public override returns (bool) {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200000, 1037618708512) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00200004, 0) }
        _checkState(States.OPEN);
        bool _success = true;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000012,_success)}
        for (uint256 i = 0; i < numberOfCards; i++) {
            if (ownerOf(i) != address(this)) {
                _success = _collectRent(i);
            }
            if (!_success) {
                return false;
            }
        }
        return true;
    }

    /// @notice rent every Card at the minimum price
    /// @param _maxSumOfPrices a limit to the sum of the bids to place
    function rentAllCards(uint256 _maxSumOfPrices) external {
        // check that not being front run
        uint256 _actualSumOfPrices;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000013,_actualSumOfPrices)}
        for (uint256 i = 0; i < numberOfCards; i++) {
            _actualSumOfPrices = _actualSumOfPrices + (cardPrice[i]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000021,_actualSumOfPrices)}
        }
        require(_actualSumOfPrices <= _maxSumOfPrices, "Prices too high");

        for (uint256 i = 0; i < numberOfCards; i++) {
            if (ownerOf(i) != msgSender()) {
                uint256 _newPrice;
                if (cardPrice[i] > 0) {
                    _newPrice =
                        (cardPrice[i] * (minimumPriceIncreasePercent + 100)) /
                        100;
                } else {
                    _newPrice = MIN_RENTAL_VALUE;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000023,_newPrice)}
                }
                newRental(_newPrice, 0, address(0), i);
            }
        }
    }

    /// @notice to rent a Card
    /// @dev no event: it is emitted in _updateBid, _setNewOwner or _placeInList as appropriate
    /// @param _newPrice the price to rent the card for
    /// @param _timeHeldLimit an optional time limit to rent the card for
    /// @param _startingPosition where to start looking to insert the bid into the orderbook
    /// @param _card the index of the card to update
    function newRental(
        uint256 _newPrice,
        uint256 _timeHeldLimit,
        address _startingPosition,
        uint256 _card
    ) public logInternal34(_card)autoUnlock() autoLock() {
        if (state == States.OPEN) {
            require(_newPrice >= MIN_RENTAL_VALUE, "Price below min");
            require(_card < numberOfCards, "Card does not exist");

            address _user = msgSender();

            require(
                exitedTimestamp[_user] != block.timestamp,
                "Cannot lose and re-rent in same block"
            );
            require(
                !treasury.marketPaused(address(this)) &&
                    !treasury.globalPause(),
                "Rentals are disabled"
            );
            bool _userStillForeclosed = treasury.isForeclosed(_user);
            if (_userStillForeclosed) {
                _userStillForeclosed = orderbook.removeUserFromOrderbook(_user);
            }
            if (!_userStillForeclosed) {
                if (ownerOf(_card) == _user) {
                    // the owner may only increase by more than X% or reduce their price
                    uint256 _requiredPrice =
                        (cardPrice[_card] *
                            (minimumPriceIncreasePercent + 100)) / (100);
                    require(
                        _newPrice >= _requiredPrice ||
                            _newPrice < cardPrice[_card],
                        "Invalid price"
                    );
                }

                // do some cleaning up before we collect rent or check their bidRate
                orderbook.removeOldBids(_user);

                _collectRent(_card);

                // check sufficient deposit
                uint256 _userTotalBidRate =
                    treasury.userTotalBids(_user) -
                        (orderbook.getBidValue(_user, _card)) +
                        _newPrice;
                require(
                    treasury.userDeposit(_user) >=
                        _userTotalBidRate / minRentalDayDivisor,
                    "Insufficient deposit"
                );

                _timeHeldLimit = _checkTimeHeldLimit(_timeHeldLimit);

                // replaces _newBid and _updateBid
                orderbook.addBidToOrderbook(
                    _user,
                    _card,
                    _newPrice,
                    _timeHeldLimit,
                    _startingPosition
                );

                assert(treasury.updateLastRentalTime(_user));
            }
        }
    }modifier logInternal34(uint256 _card) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220000, 1037618708514) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220001, 4) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00220005, 585) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00226003, _card) } _; }

    function _checkTimeHeldLimit(uint256 _timeHeldLimit)
        internal
        view
        returns (uint256)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130000, 1037618708499) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00130005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00136000, _timeHeldLimit) }
        if (_timeHeldLimit == 0) {
            return 0;
        } else {
            uint256 _minRentalTime = uint256(1 days) / minRentalDayDivisor;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001f,_minRentalTime)}
            require(_timeHeldLimit >= _minRentalTime, "Limit too low");
            return _timeHeldLimit;
        }
    }

    /// @notice to change your timeHeldLimit without having to re-rent
    /// @param _timeHeldLimit an optional time limit to rent the card for
    /// @param _card the index of the card to update
    function updateTimeHeldLimit(uint256 _timeHeldLimit, uint256 _card)
        external
    {
        _checkState(States.OPEN);
        address _user = msgSender();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000014,_user)}

        if (_collectRent(_card)) {
            _timeHeldLimit = _checkTimeHeldLimit(_timeHeldLimit);

            orderbook.setTimeHeldlimit(_user, _card, _timeHeldLimit);

            if (ownerOf(_card) == _user) {
                cardTimeLimit[_card] = _timeHeldLimit;
            }

            emit LogUpdateTimeHeldLimit(_user, _timeHeldLimit, _card);
        }
    }

    /// @notice stop renting all cards
    function exitAll() external override {
        for (uint256 i = 0; i < numberOfCards; i++) {
            exit(i);
        }
    }

    /// @notice stop renting a card and/or remove from orderbook
    /// @dev public because called by exitAll()
    /// @dev doesn't need to be current owner so user can prevent ownership returning to them
    /// @dev does not apply minimum rental duration, because it returns ownership to the next user
    /// @param _card The card index to exit
    function exit(uint256 _card) public override {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0000, 1037618708511) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001f6000, _card) }
        _checkState(States.OPEN);
        address _msgSender = msgSender();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000015,_msgSender)}

        // block frontrunning attack
        exitedTimestamp[_msgSender] = block.timestamp;

        // collectRent first
        _collectRent(_card);

        if (ownerOf(_card) == _msgSender) {
            // if current owner, find a new one
            orderbook.findNewOwner(_card, block.timestamp);
            assert(!orderbook.bidExists(_msgSender, address(this), _card));
        } else {
            // if not owner, just delete from orderbook
            if (orderbook.bidExists(_msgSender, address(this), _card)) {
                orderbook.removeBidFromOrderbook(_msgSender, _card);
            }
        }
    }

    /// @notice ability to add liqudity to the pot without being able to win.
    /// @dev called by user, sponsor is msgSender
    function sponsor(uint256 _amount) external override {
        address _creator = msgSender();assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000016,_creator)}
        treasury.checkSponsorship(_creator, _amount);
        _sponsor(_creator, _amount);
    }

    /// @notice ability to add liqudity to the pot without being able to win.
    /// @dev called by Factory during market creation
    /// @param _sponsorAddress the msgSender of createMarket in the Factory
    function sponsor(address _sponsorAddress, uint256 _amount)
        external
        override
    {
        _sponsor(_sponsorAddress, _amount);
    }

    /// @dev actually processes the sponsorship
    function _sponsor(address _sponsorAddress, uint256 _amount) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140000, 1037618708500) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140001, 2) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00140005, 9) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00146001, _amount) }
        _checkNotState(States.LOCKED);
        _checkNotState(States.WITHDRAW);
        require(_amount > 0, "Must send something");
        // send tokens to the Treasury
        require(treasury.sponsor(_sponsorAddress, _amount));
        totalRentCollected = totalRentCollected + _amount;
        // just so user can get it back if invalid outcome
        rentCollectedPerUser[_sponsorAddress] =
            rentCollectedPerUser[_sponsorAddress] +
            _amount;
        // allocate equally to each card, in case card specific affiliates
        for (uint256 i = 0; i < numberOfCards; i++) {
            rentCollectedPerCard[i] =
                rentCollectedPerCard[i] +
                (_amount / numberOfCards);
        }
        emit LogSponsor(_sponsorAddress, _amount);
    }

    /*╔═════════════════════════════════╗
      ║         CORE FUNCTIONS          ║
      ╠═════════════════════════════════╣
      ║             INTERNAL            ║
      ╚═════════════════════════════════╝*/

    /// @notice collects rent for a specific card
    /// @dev also calculates and updates how long the current user has held the card for
    /// @dev is not a problem if called externally, but making internal over public to save gas
    function _collectRentAction(uint256 _card)
        internal
        returns (bool shouldContinue)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150000, 1037618708501) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00150005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00156000, _card) }
        address _user = ownerOf(_card);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000017,_user)}
        uint256 _timeOfThisCollection = block.timestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000018,_timeOfThisCollection)}

        // don't collect rent beyond the locking time
        if (marketLockingTime <= block.timestamp) {
            _timeOfThisCollection = marketLockingTime;
        }

        //only collect rent if the card is owned (ie, if owned by the contract this implies unowned)
        // AND if the last collection was in the past (ie, don't do 2+ rent collections in the same block)
        if (
            _user != address(this) &&
            timeLastCollected[_card] < _timeOfThisCollection
        ) {
            // User rent collect and fetch the time the user foreclosed, 0 means they didn't foreclose yet
            uint256 _timeUserForeclosed =
                treasury.collectRentUser(_user, block.timestamp);

            // Calculate the card timeLimitTimestamp
            uint256 _cardTimeLimitTimestamp =
                timeLastCollected[_card] + cardTimeLimit[_card];

            // input bools
            bool _foreclosed = _timeUserForeclosed != 0;
            bool _limitHit =
                cardTimeLimit[_card] != 0 &&
                    _cardTimeLimitTimestamp < block.timestamp;
            bool _marketLocked = marketLockingTime <= block.timestamp;

            // outputs
            bool _newOwner;
            uint256 _refundTime; // seconds of rent to refund the user

            /* Permutations of the events: Foreclosure, Time limit and Market Locking
            ┌───────────┬─┬─┬─┬─┬─┬─┬─┬─┐
            │Case       │1│2│3│4│5│6│7│8│
            ├───────────┼─┼─┼─┼─┼─┼─┼─┼─┤
            │Foreclosure│0│0│0│0│1│1│1│1│
            │Time Limit │0│0│1│1│0│0│1│1│
            │Market Lock│0│1│0│1│0│1│0│1│
            └───────────┴─┴─┴─┴─┴─┴─┴─┴─┘
            */

            if (!_foreclosed && !_limitHit && !_marketLocked) {
                // CASE 1
                // didn't foreclose AND
                // didn't hit time limit AND
                // didn't lock market
                // THEN simple rent collect, same owner
                _timeOfThisCollection = _timeOfThisCollection;
                _newOwner = false;
                _refundTime = 0;
            } else if (!_foreclosed && !_limitHit && _marketLocked) {
                // CASE 2
                // didn't foreclose AND
                // didn't hit time limit AND
                // did lock market
                // THEN refund rent between locking and now
                _timeOfThisCollection = marketLockingTime;
                _newOwner = false;
                _refundTime = block.timestamp - marketLockingTime;
            } else if (!_foreclosed && _limitHit && !_marketLocked) {
                // CASE 3
                // didn't foreclose AND
                // did hit time limit AND
                // didn't lock market
                // THEN refund rent between time limit and now
                _timeOfThisCollection = _cardTimeLimitTimestamp;
                _newOwner = true;
                _refundTime = block.timestamp - _cardTimeLimitTimestamp;
            } else if (!_foreclosed && _limitHit && _marketLocked) {
                // CASE 4
                // didn't foreclose AND
                // did hit time limit AND
                // did lock market
                // THEN refund rent between the earliest event and now
                if (_cardTimeLimitTimestamp < marketLockingTime) {
                    // time limit hit before market locked
                    _timeOfThisCollection = _cardTimeLimitTimestamp;
                    _newOwner = true;
                    _refundTime = block.timestamp - _cardTimeLimitTimestamp;
                } else {
                    // market locked before time limit hit
                    _timeOfThisCollection = marketLockingTime;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000024,_timeOfThisCollection)}
                    _newOwner = false;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000025,_newOwner)}
                    _refundTime = block.timestamp - marketLockingTime;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000026,_refundTime)}
                }
            } else if (_foreclosed && !_limitHit && !_marketLocked) {
                // CASE 5
                // did foreclose AND
                // didn't hit time limit AND
                // didn't lock market
                // THEN rent OK, find new owner
                _timeOfThisCollection = _timeUserForeclosed;
                _newOwner = true;
                _refundTime = 0;
            } else if (_foreclosed && !_limitHit && _marketLocked) {
                // CASE 6
                // did foreclose AND
                // didn't hit time limit AND
                // did lock market
                // THEN if foreclosed first rent ok, otherwise refund after locking
                if (_timeUserForeclosed < marketLockingTime) {
                    // user foreclosed before market locked
                    _timeOfThisCollection = _timeUserForeclosed;
                    _newOwner = true;
                    _refundTime = 0;
                } else {
                    // market locked before user foreclosed
                    _timeOfThisCollection = marketLockingTime;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000027,_timeOfThisCollection)}
                    _newOwner = false;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000028,_newOwner)}
                    _refundTime = block.timestamp - marketLockingTime;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000029,_refundTime)}
                }
            } else if (_foreclosed && _limitHit && !_marketLocked) {
                // CASE 7
                // did foreclose AND
                // did hit time limit AND
                // didn't lock market
                // THEN if foreclosed first rent ok, otherwise refund after limit
                if (_timeUserForeclosed < _cardTimeLimitTimestamp) {
                    // user foreclosed before time limit
                    _timeOfThisCollection = _timeUserForeclosed;
                    _newOwner = true;
                    _refundTime = 0;
                } else {
                    // time limit hit before user foreclosed
                    _timeOfThisCollection = _cardTimeLimitTimestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002a,_timeOfThisCollection)}
                    _newOwner = true;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002b,_newOwner)}
                    _refundTime = _timeUserForeclosed - _cardTimeLimitTimestamp;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002c,_refundTime)}
                }
            } else {
                // CASE 8
                // did foreclose AND
                // did hit time limit AND
                // did lock market
                // THEN (╯°益°)╯彡┻━┻
                if (
                    _timeUserForeclosed <= _cardTimeLimitTimestamp &&
                    _timeUserForeclosed < marketLockingTime
                ) {
                    // user foreclosed first (or at same time as time limit)
                    _timeOfThisCollection = _timeUserForeclosed;
                    _newOwner = true;
                    _refundTime = 0;
                } else if (
                    _cardTimeLimitTimestamp < _timeUserForeclosed &&
                    _cardTimeLimitTimestamp < marketLockingTime
                ) {
                    // time limit hit first
                    _timeOfThisCollection = _cardTimeLimitTimestamp;
                    _newOwner = true;
                    _refundTime = _timeUserForeclosed - _cardTimeLimitTimestamp;
                } else {
                    // market locked first
                    _timeOfThisCollection = marketLockingTime;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002d,_timeOfThisCollection)}
                    _newOwner = false;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002e,_newOwner)}
                    _refundTime = _timeUserForeclosed - marketLockingTime;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000002f,_refundTime)}
                }
            }
            if (_refundTime != 0) {
                uint256 _refundAmount =
                    (_refundTime * cardPrice[_card]) / 1 days;
                treasury.refundUser(_user, _refundAmount);
            }
            _processRentCollection(_user, _card, _timeOfThisCollection); // where the rent collection actually happens

            if (_newOwner) {
                orderbook.findNewOwner(_card, _timeOfThisCollection);
                return true;
            }
        } else {
            // timeLastCollected is updated regardless of whether the card is owned, so that the clock starts ticking
            // ... when the first owner buys it, because this function is run before ownership changes upon calling newRental
            timeLastCollected[_card] = _timeOfThisCollection;
        }
        return false;
    }

    /// @dev _collectRentAction goes back one owner at a time, this function repeatedly calls
    /// @dev ... _collectRentAction until the backlog of next owners has been processed, or maxRentIterations hit
    function _collectRent(uint256 _card)
        internal
        returns (bool didUpdateEverything)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160000, 1037618708502) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00160005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00166000, _card) }
        uint32 counter = 0;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000019,counter)}
        bool shouldContinue = true;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001a,shouldContinue)}
        while (counter < maxRentIterations && shouldContinue) {
            shouldContinue = _collectRentAction(_card);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000022,shouldContinue)}
            counter++;
        }
        return !shouldContinue;
    }

    /// @dev processes actual rent collection and updates the state
    function _processRentCollection(
        address _user,
        uint256 _card,
        uint256 _timeOfCollection
    ) internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170000, 1037618708503) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00170005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00176002, _timeOfCollection) }
        uint256 _rentOwed =
            (cardPrice[_card] *
                (_timeOfCollection - timeLastCollected[_card])) / 1 days;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001b,_rentOwed)}
        treasury.payRent(_rentOwed);
        uint256 _timeHeldToIncrement =
            (_timeOfCollection - timeLastCollected[_card]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0000001c,_timeHeldToIncrement)}

        // if the user has a timeLimit, adjust it as necessary
        if (cardTimeLimit[_card] != 0) {
            orderbook.reduceTimeHeldLimit(_user, _card, _timeHeldToIncrement);
            cardTimeLimit[_card] -= _timeHeldToIncrement;
        }
        timeHeld[_card][_user] += _timeHeldToIncrement;
        totalTimeHeld[_card] += _timeHeldToIncrement;
        rentCollectedPerUser[_user] += _rentOwed;
        rentCollectedPerCard[_card] += _rentOwed;
        rentCollectedPerUserPerCard[_user][_card] += _rentOwed;
        totalRentCollected += _rentOwed;
        timeLastCollected[_card] = _timeOfCollection;

        // longest owner tracking
        if (timeHeld[_card][_user] > longestTimeHeld[_card]) {
            longestTimeHeld[_card] = timeHeld[_card][_user];
            longestOwner[_card] = _user;
        }
        emit LogRentCollection(_rentOwed, timeHeld[_card][_user], _card, _user);
    }

    function _checkState(States currentState) internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180000, 1037618708504) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00180005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00186000, currentState) }
        require(state == currentState, "Incorrect state");
    }

    function _checkNotState(States currentState) internal view {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190000, 1037618708505) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00190005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00196000, currentState) }
        require(state != currentState, "Incorrect state");
    }

    /// @dev should only be called thrice
    function _incrementState() internal {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0000, 1037618708506) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0001, 0) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff001a0004, 0) }
        assert(uint256(state) < 4);
        state = States(uint256(state) + (1));
        emit LogStateChange(uint256(state));
    }

    /*╔═════════════════════════════════╗
      ║        CIRCUIT BREAKER          ║
      ╚═════════════════════════════════╝*/

    /// @dev in case Oracle never resolves for any reason
    /// @dev does not set a winner so same as invalid outcome
    /// @dev market does not need to be locked, just in case lockMarket bugs out
    function circuitBreaker() external {
        require(
            block.timestamp > (uint256(oracleResolutionTime) + (12 weeks)),
            "Too early"
        );
        _incrementState();
        orderbook.closeMarket();
        state = States.WITHDRAW;
    }
    /*
         ▲  
        ▲ ▲ 
              */
}

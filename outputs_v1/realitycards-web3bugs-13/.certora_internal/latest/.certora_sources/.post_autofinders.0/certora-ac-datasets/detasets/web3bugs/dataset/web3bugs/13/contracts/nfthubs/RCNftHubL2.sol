// SPDX-License-Identifier: AGPL-3.0
pragma solidity 0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "hardhat/console.sol";
import "../interfaces/IRCMarket.sol";
import "../lib/NativeMetaTransaction.sol";
import "../interfaces/IRCNftHubL2.sol";

/// @title Reality Cards NFT Hub- Layer 2 side
/// @author Andrew Stanger & Daniel Chilvers
contract RCNftHubL2 is
    Ownable,
    ERC721URIStorage,
    AccessControl,
    NativeMetaTransaction,
    IRCNftHubL2
{
    /*╔═════════════════════════════════╗
      ║           VARIABLES             ║
      ╚═════════════════════════════════╝*/

    /// @dev so only markets can move NFTs
    mapping(address => bool) public isMarket;
    /// @dev the market each NFT belongs to, so that it can only be moved in withdraw state
    mapping(uint256 => address) public override marketTracker;

    /// @dev governance variables
    address public factoryAddress;

    /// @dev matic mintable asset requirements
    bytes32 public constant DEPOSITOR_ROLE = keccak256("DEPOSITOR_ROLE");
    mapping(uint256 => bool) public withdrawnTokens;
    event WithdrawnBatch(address indexed user, uint256[] tokenIds);
    event TransferWithMetadata(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId,
        bytes metaData
    );

    /*╔═════════════════════════════════╗
      ║          CONSTRUCTOR            ║
      ╚═════════════════════════════════╝*/

    constructor(address _factoryAddress, address childChainManager)
        ERC721("RealityCards", "RC")
    {
        // initialise MetaTransactions
        _initializeEIP712("RealityCardsNftHubL2", "1");
        _setupRole(DEFAULT_ADMIN_ROLE, _msgSender());
        _setupRole(DEPOSITOR_ROLE, childChainManager);
        setFactoryAddress(_factoryAddress);
    }

    /*╔═════════════════════════════════╗
      ║          ADD MARKETS            ║
      ╚═════════════════════════════════╝*/

    /// @dev so only markets can change ownership
    function addMarket(address _newMarket) external override {
        require(msgSender() == factoryAddress, "Not factory");
        isMarket[_newMarket] = true;
    }

    /*╔═════════════════════════════════╗
      ║          GOVERNANCE             ║
      ╚═════════════════════════════════╝*/

    /// @dev address of RC factory contract, so only factory can mint
    function setFactoryAddress(address _newAddress) public logInternal63(_newAddress)onlyOwner {
        require(_newAddress != address(0), "Must set an address");
        factoryAddress = _newAddress;
    }modifier logInternal63(address _newAddress) { assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003f0000, 1037618708543) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003f0001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003f0005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff003f6000, _newAddress) } _; }

    /*╔═════════════════════════════════╗
      ║        CORE FUNCTIONS           ║
      ╚═════════════════════════════════╝*/

    // FACTORY ONLY
    function mint(
        address _originalOwner,
        uint256 _tokenId,
        string calldata _tokenURI
    ) external override returns (bool) {
        require(
            !withdrawnTokens[_tokenId],
            "ChildMintableERC721: TOKEN_EXISTS_ON_ROOT_CHAIN"
        );
        require(msgSender() == factoryAddress, "Not factory");
        _mint(_originalOwner, _tokenId);
        _setTokenURI(_tokenId, _tokenURI);
        marketTracker[_tokenId] = _originalOwner;
        return true;
    }

    // MARKET ONLY
    function transferNft(
        address _currentOwner,
        address _newOwner,
        uint256 _tokenId
    ) external override returns (bool) {
        require(isMarket[msgSender()], "Not market");
        _transfer(_currentOwner, _newOwner, _tokenId);
        return true;
    }

    function ownerOf(uint256 tokenId)
        public
        view
        virtual
        override(ERC721, IRCNftHubL2)
        returns (address)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00410000, 1037618708545) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00410001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00410005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00416000, tokenId) }
        return ERC721.ownerOf(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override(ERC721URIStorage, IRCNftHubL2)
        returns (string memory)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00450000, 1037618708549) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00450001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00450005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00456000, tokenId) }
        return ERC721URIStorage.tokenURI(tokenId);
    }

    /*╔═════════════════════════════════╗
      ║        MATIC MINTABLE           ║
      ╚═════════════════════════════════╝*/

    function deposit(address user, bytes calldata depositData)
        external
        override
        onlyRole(DEPOSITOR_ROLE)
    {
        // deposit single
        if (depositData.length == 32) {
            uint256 tokenId = abi.decode(depositData, (uint256));
            withdrawnTokens[tokenId] = false;
            _mint(user, tokenId);

            // deposit batch
        } else {
            uint256[] memory tokenIds = abi.decode(depositData, (uint256[]));assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001001f,0)}
            uint256 length = tokenIds.length;assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff00000020,length)}
            for (uint256 i; i < length; i++) {
                withdrawnTokens[tokenIds[i]] = false;
                _mint(user, tokenIds[i]);
            }
        }
    }

    function withdraw(uint256 tokenId) external override {
        require(isMarket[msgSender()], "Not market");
        require(
            _msgSender() == ownerOf(tokenId),
            "ChildMintableERC721: INVALID_TOKEN_OWNER"
        );
        withdrawnTokens[tokenId] = true;
        _burn(tokenId);
    }

    function withdrawWithMetadata(uint256 tokenId) external override {
        require(isMarket[msgSender()], "Not market");
        require(
            msgSender() == ownerOf(tokenId),
            "ChildMintableERC721: INVALID_TOKEN_OWNER"
        );
        withdrawnTokens[tokenId] = true;

        // Encoding metadata associated with tokenId & emitting event
        emit TransferWithMetadata(
            ownerOf(tokenId),
            address(0),
            tokenId,
            this.encodeTokenMetadata(tokenId)
        );

        _burn(tokenId);
    }

    function encodeTokenMetadata(uint256 tokenId)
        external
        view
        virtual
        returns (bytes memory)
    {
        return abi.encode(tokenURI(tokenId));
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        override(AccessControl, ERC721)
        returns (bool)
    {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00470000, 1037618708551) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00470001, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00470005, 1) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00476000, interfaceId) }
        return
            interfaceId == type(IRCNftHubL2).interfaceId ||
            super.supportsInterface(interfaceId);
    }

    /*╔═════════════════════════════════╗
      ║           OVERRIDES             ║
      ╚═════════════════════════════════╝*/
    /// @dev ensures NFTs can only be moved when market is resolved

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public override {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00400000, 1037618708544) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00400001, 3) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00400005, 73) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00406002, tokenId) }
        IRCMarket market = IRCMarket(marketTracker[tokenId]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001001d,0)}
        require(market.state() == IRCMarket.States.WITHDRAW, "Incorrect state");
        require(ownerOf(tokenId) == msgSender(), "Not owner");
        _transfer(from, to, tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory _data
    ) public override {assembly { mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00430000, 1037618708547) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00430001, 4) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00430005, 585) mstore(0xffffff6e4604afefe123321beef1b01fffffffffffffffffffffffff00436003, _data) }
        IRCMarket market = IRCMarket(marketTracker[tokenId]);assembly{mstore(0xffffff6e4604afefe123321beef1b02fffffffffffffffffffffffff0001001e,0)}
        require(market.state() == IRCMarket.States.WITHDRAW, "Incorrect state");
        require(ownerOf(tokenId) == msgSender(), "Not owner");
        _transfer(from, to, tokenId);
        _data;
    }
    /*
         ▲  
        ▲ ▲ 
              */
}

// SPDX-License-Identifier: MIT
pragma solidity 0.8.3;

contract MockVader {
    uint public secondsPerEra = 86400;
    address public dao;
    
    constructor() {
        dao = msg.sender;
    }
    
    function DAO() external view returns (address) {
        return dao;
    }
}

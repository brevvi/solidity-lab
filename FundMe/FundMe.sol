// get funds from users
// withdraw funds
// set a miimum funding value i USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 5;
    
    function fund() public payable {
        require(msg.value >= minimumUsd, "didn't send enough ETH");
    }

    function getPrice() public {
        // Address
        // ABi
    }

    function getConversionRate() public {}

    function getVersion() public view returns (uint256) {}
}

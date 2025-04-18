// get funds from users
// withdraw funds
// set a miimum funding value i USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// import "./AggregatorV3Interface.sol";
// npm install @chainlink/contracts
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public minimumUsd = 5;
    
    function fund() public payable {
        require(msg.value >= minimumUsd, "didn't send enough ETH");
    }

    function getPrice() public {
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306 (this token was taken from Price Fees, from Feeds Addresses, at Chainlink Docs website: https://docs.chain.link/data-feeds/price-feeds/addresses?page=1
        // ABI: 
        AggregatorV3Inteface pricefeed = AggregatorV3Inteface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, uint256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
        //    uint ethPrice = getPrice();
        //   uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        //  return ethAmountInUsd;    
    }

    function getConversionRate() public {
        uint256 ethPrice = getPrice();
	uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
	return ethAmountInUsd;
    }

    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
interface AggregatorV3interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  function getRoundData(
    uint80 _roundId
  ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

  function latestRoundData()
    external
    view
    returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

contract FundMe {

    uint256 public minimumUsd = 5;

    function fund() public payable {
        // allow users to send $
        require(msg.value >= minimumUsd, "didn't send enough ETH");
    }                                         
    function gasPrice() public {
        // Address (docs.chain.link)
        // ABI
    }

    function getConversionRate() public {}

    function getVersion() public view returns (uint256){
        return AggregatorV3interface(0x69aaa1769357215DE4fAc081bf1F309aDc325306).version();
    }
}
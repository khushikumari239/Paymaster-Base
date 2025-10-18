// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract RewardContract {
    bool public RewardClaimed = false;
    constructor () payable {
        require (msg.value > 0, "must send some tokens as reward");
    }

    function claimReward () external {
        require (RewardClaimed == false, "Reward already claimed") ;

        uint256 rewardAmount = address (this).balance;
        payable (msg.sender).transfer (rewardAmount);
        RewardClaimed = true;
    }
}

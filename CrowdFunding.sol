// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrowdfundingCampaign {
   string campaignName;
   string campaignDescription;
   uint256 fundGoal;
   uint totalFund;
   string owner;

   uint256 deadline;
   uint256 minimumFund;
   bool isActive;
    

    function getName() public view returns(string memory){
        return campaignName;
    } 

    function getDescription() public view returns(string memory){
        return campaignDescription;
    } 

    function getFundGoal() public view returns(uint){
        return fundGoal;
    } 

    function getStatus() public view returns(bool){
        return isActive;
    }

    function createCampaign(string calldata _campaignName, string calldata _campaignDescription, uint _fundGoal, uint _deadline, uint256 _minimumFund) public {
        require(_deadline >= block.timestamp + 1 hours, "deadline should be at least 1 hour from now");
        require(bytes(_campaignName).length >= 3, "campaign name should be at least 3 characters");
        require(bytes(_campaignDescription).length >= 5, "campaign description should be at least 5 characters");
        require(_fundGoal > 1 ether, "Fund goal should be more than 1 ETH");

        campaignName = _campaignName;
        campaignDescription = _campaignDescription;
        fundGoal = _fundGoal;
        deadline = _deadline;
        minimumFund = _minimumFund;
        isActive = true;
    }

    function setStatus() public {
        uint256 currentTime = block.timestamp;

        if(currentTime >= deadline){
            isActive = false;
        }
    }

}
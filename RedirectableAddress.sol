// SPDX-License-Identifier: MIT

// Author: https://github.com/mikebolt
// This software is provided with NO WARRANTY.

pragma solidity >=0.7.0 <0.9.0;


// This contract can be very dangerous.
contract RedirectableAddress {

    address public currentRecipient;
    address public owner;

    constructor(address initialRecipient) {
        currentRecipient = initialRecipient;
        owner = msg.sender;
    }

    function setRecipient(address newRecipient) public {
        require(msg.sender == owner, "unauthorized");
        withdrawEther();
        currentRecipient = newRecipient;
    }

    receive() external payable {} // This function must be present so that this contract can receive ether.

    function withdrawEther() public payable {
        (bool success,) = currentRecipient.call{value: address(this).balance}("");
        require(success);
    }

}

// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract LockedDeposit {

    bytes32 public hash;

    // Optional - this lets anyone put ether in this contract
    receive() external payable {}

    constructor(bytes32 _hash) payable {
        hash = _hash;
    }

    function withdraw(bytes32 x) public {
        require(sha256(abi.encodePacked(x)) == hash);
        (bool success,) = msg.sender.call{value: address(this).balance}("");
        require(success);
    }
}

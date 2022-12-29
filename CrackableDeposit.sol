// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrackableDeposit {

    bytes32 public hash;

    receive() external payable {} // Optional - this lets anyone put ether in this contract

    constructor(bytes32 _hash) payable {
        hash = _hash;
    }

    // If `hash` is constructed incorrectly then it may be impossible to withdraw.
    function withdraw(bytes32 x) public {
        require(sha256(abi.encodePacked(uint256(x) & 0xFFFFFFFF
                | 0x444475107501ABCD00000000)) == hash);
        (bool success,) = msg.sender.call{value: address(this).balance}("");
        require(success);
    }
}

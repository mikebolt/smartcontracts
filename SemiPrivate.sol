// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// Not actually private
// anyone can hash all known addresses offline to determine the recipient
contract SemiPrivate {

    bytes32 public accountHash;
    bytes32 public salt;

    // The hash needs to be done offline because these arguments will
    // be included in the deployment transaction

    constructor(bytes32 _accountHash, bytes32 _salt) {
        salt = _salt;
        accountHash = _accountHash;
    }

    function checkAddress(address a) public view returns (bool) {
        bytes memory toHash = bytes.concat(abi.encodePacked(a), salt);
        bytes32 hash = sha256(toHash);
        return hash == accountHash;
    }

    function doSomething() public {
        require(checkAddress(msg.sender));
        // do whatever you want here
        // only the hashed account will be able to run this code
    }
}

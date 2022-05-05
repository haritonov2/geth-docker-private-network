// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract Proof {
    struct FileDetails {
        uint timestamp;
        string owner;
    }

    mapping (string => FileDetails) files;

    event logFileAddressStatus(bool status, uint timestamp, string owner, string fileHash);

    // This is used to store the owner of file at the block timestamp.
    function set(string memory owner, string memory fileHash) public {
        if (files[fileHash].timestamp == 0) {
            files[fileHash] = FileDetails(block.timestamp, owner);

            emit logFileAddressStatus(true, block.timestamp, owner, fileHash);
        } else {
            emit logFileAddressStatus(false, block.timestamp,owner, fileHash);
        }
    }

    function get(string memory fileHash) public view returns (uint timestamp, string memory owner) {
        return (files[fileHash].timestamp, files[fileHash].owner);
    }
}

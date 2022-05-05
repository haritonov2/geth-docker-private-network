// SPDX-License-Identifier: GPL-3.0
//pragma solidity ^0.8.4;

contract Sample {
    // state variables
    uint256 data;
    address owner;

    // event definition
    event logData(uint256 dataToLog);

    // function modifier
    modifier onlyOwner() {
        if (msg.sender != owner) throw;
        _;
    }

    // constructor
    function Sample(uint256 initData, address initOwner) {
        data = initData;
        owner = initOwner;
    }

    function getData() returns (uint256 returnedData) {
        return data;
    }

    function setData(uint newData) onlyOwner {
        logData(newData);
        data = newData;
    }
}

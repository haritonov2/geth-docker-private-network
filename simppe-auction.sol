// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract SimpleAuction {
    address payable public beneficiary;
    uint public auctionEndTime;

    // Current state of the auction.
    address public highestBidder;
    uint public highestBid;

    // Allowed withdrawals of previous bids.
    mapping(address => uint) pendingReturns;

    // Set to true at the end, disallows any change.
    // By default initialized to 'false'.
    bool ended;

    // Events that will be emitted on changes.@dev
    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);


}

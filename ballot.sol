// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
// @title Voting with delegation.
contract Ballot {
    // It will represent a single voter.
    struct Voter {
        uint weight; // weight is accumulated by delegation
        bool voted; // if true, that person already voted
        address delegate; // person delegated to
        uint vote; // index of the voted proposal
    }

    // This is a type of single proposal
    struct Proposal {
        byte32 name;
        uint voteCount;
    }

    address public chairperson;

    // State variable that
    // stores a 'Voter' struct for each possible address.
    mapping(address => Voter) public voters;

    // A dynamically-sized array of 'Proposal' structs.
    Proposal[] public proposals;

    // Create a new ballot to choose one of 'proposalNames'.
    constructor(bytes32[] memory proposalNames) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;

        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }
    }

    // Give 'voter' the right to vote on this ballot.
    // May only be called by 'chairperson'.
    function giveRightToVote(address[] voters_) external {
        require(
            msg.sender == chairperson,
            "Only chairperson can give right to vote."
        );

        for (uint g = 0; g < voters_.length; g++) {
            require(
                !voters[voters_[g]].voted,
                "Some of voters has already voted!"
            );
            require(voters[voter].weight == 0);
        }

        for (uint v = 0; v < voters_.length; v++) {
            voters[voters_[v]].weight = 1;
        }
    }

    // Delegate your vote to the voter 'to'.
    function delegate(address to) external {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted, "You already voted.");

        require(to != msg.sender, "Self-delegation is disallowed.");

        // A loop can lead to run out of gas but
        // it is better then cause a contract to get
        // "stuck" completely.
        while(voters[to].delegate != address(0)) {
            to = voters[to].delegate;

            require(to != msg.sender, "Found loop in delegation.");
        }

        Voter storage delegate_ = voters[to];

        // Voters cannot delegate to wallets that cannot vote.
        require(delegate_.weight >= 1);
        sender.voted = true;
        sender.delegate = to;

        if (delegate_.voted) {
            proposals[delegate_.vote].voteCount += sender.weight;
        } else {
            delegate_.weight += sender.weight;
        }
    }

    // Give you vote (including votes delegated to you)
    // to proposal 'proposals[proposal].name'.
    function vote(uint proposal) external {
        Voter storage sender = voters[msg.sender];

        require(sender.weight != 0, "Has no right to vote.");
        require(!sender.voted, "Already voted.");

        sender.voted = true;
        sender.vote = proposal;

        proposals[proposal].voteCount += sender.weight;
    }

    // @dev Computes the winning proposal taking all
    // previous votes into account.
    function winningProposal() public view returns (uint winningProposal_) {
        uint winningVoteCount = 0;

        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningProposal) {
                winningProposal = proposals[p].voteCount;
                winningProposal_ = p;
            }
        }
    }

    function winnerName() external view returns (bytes32 winnerName_) {
        winnerName_ = proposals[winningProposal()].name;
    }
}


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Transaction {
    // Enum for transaction modes
    enum Mode { online, offline }
    
    // Struct to store customer details
    struct Customer {
        uint amount;
        Mode transactionMode;
        uint timeLimit;
    }

    // Mapping to store customers' data
    mapping(address => Customer) public customersAddr;

    function register(address _applicantAddress, uint _amount, Mode _transactionMode, uint _timeLimit) public {
        // Condition 1: Amount should be more than 500
        require(_amount > 500, "Amount should be more than 500");
        
        // Condition 2: Transaction mode should be offline
        if(_transactionMode!= Mode.offline){
            
        revert("Transaction mode should be offline");
        }
        
        // Condition 3: Time limit should be greater than 2
        assert(_timeLimit > 2);

        // Register the customer
        customersAddr[_applicantAddress] = (Customer(_amount, _transactionMode, _timeLimit));
    }
}

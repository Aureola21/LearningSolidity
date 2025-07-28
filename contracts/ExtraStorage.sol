// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//We want ExtraStorage to inherit all the functionality of SimpleStorage
// ExtraStorage can be a child Contract of SimpleStorage contract (Inheritance)

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {
    //Now we can add additional functions to our ExtraStorage Contract

    //What if we want to change some function for this contract?
    // We can do something called: Overriding
    // keywords: Virtual, Override
    function store(uint256 _favoriteNumber) public override  {
        favoriteNumber = _favoriteNumber+5;
    }
    // add virtual keyword to SimpleStorage: function store(uint256 _favoriteNumber) public virtual {....}
}
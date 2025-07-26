// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

//pasted SimpleStorage code here
contract SimpleStorage {

    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}

contract StorageFactory {
    //create a gloabal variable: type visibility variableName;
    SimpleStorage public simpleStorage; //initialised to address 0x000...00
    function createSimpleStorageContract() public {
        // How does storage factory know what simple storage looks like??
        // one way is to paste the whole SimpleStorage contract in this file.
        simpleStorage = new SimpleStorage(); //deploys the contract

    }
}

// The above method is a bit redundant, we can instead directly import the contract!!


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    //create a gloabal variable: type visibility variableName;
    SimpleStorage[] public simpleStorageArray;//Automatically comes with the ABI's
    //--->if it was : address[] public simpleStorageArray;
    function createSimpleStorageContract() public {
        // How does storage factory know what simple storage looks like??
        // Other way is that we can directly import the contract into this file
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
        

    }
    //But now we want to interact with the contracts
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //To interact with a contract you need its: Address, and ABI-- Application Binary Interface
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        //--->then we wd hv to write: SimpleStorage(simpleStorageArray[_simpleStorageIndex])
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve();
    }

}
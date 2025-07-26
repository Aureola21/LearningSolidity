// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;//>= 0.8.7 < 0.9.0; //^0.8.8; ATLEAST this version  //This is a comment

//EVM : Etherium Virtual Machine
// Avalanche, Fanton, Polygon

contract SimpleStorage {
    // boolean, unit, int, address, bytes
    bool hasFavoriteNumber = true;
    uint256 favoriteNumber1 = 5; // lowest is 8, can go in steps of 8
    string favoriteNumberInText = "five";
    int256 favoriteInt = -5;
    address myAdress = 0x62877551D617f63C5C66501912ce9A7d27ccC126;
    bytes32 favoriteBytes = "cat";// maximum bytes is 32


    uint256 public favoriteNumber; //gets initialized to 0!, gets indexed as 0
    uint256 public herFavoriteNumber; // gets indexed as 1

    mapping(string=>uint256) public nameToFavoriteNumber;
    //everything is initialized to 0

    People public person = People({favoriteNumber: 2, name: "Sehaj"});

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // Creating an array will help in storing multiple people
    //uint256[] public favoriteNumbersList;
    People[] public people; //dynamic array
    // 0: 2, Sehaj , 1: 7, Saanchi


    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        // favoriteNumber = favoriteNumber +1; 
        // The more computation we perform, the more expensive the transaction becomes 
        //uint256 testVar = 5; 
        //variable has a local scope, cannot be accessed outside this function store

        retrieve(); // costs gas

    }

    
    // view and pure functions, when called alone, dont spend gas
    // They also disallow any modifications of state
    // Pure functions additionally disallowyou to read from blockchain state
    function retrieve() public view returns(uint256){
        return favoriteNumber;
        // Function to match the behaviour of public variable
    }

    function add() public pure returns(uint256){
        return (1+1);
    }

    //removing memory gives error!!
    // why no memory for uint, but fir string?
    // memory or calldata is specified for arrays, structs and mappings, and string is a type of array

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        //another way to do this
        //People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        //people.push(newPerson);

        nameToFavoriteNumber[_name]=_favoriteNumber;

    }

    // If a gas calling function calls a view or pure function - only then will it cost gas
    // example, if store functions call the retrieve() function, then it would cost gas


}

// address of our smart contract 0xd9145CCE52D386f254917e481eB44e9943F39138
// anytime we change something on chain, including making a new contact, it happens in a transaction


//EVM can acess and store information in six places:
// 1. Stack, 2. Memory, 3.Storage, 4.Calldata, 5.Code, 6.Logs
    //call data: temp variables that cannot be modified,
    //memory: temp vars that can be modified
    //storage: permanent vars that can be modified

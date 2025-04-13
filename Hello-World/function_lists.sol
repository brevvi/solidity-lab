// SPDX-License-Identifier: MIT
pragma solidity 0.8.26; // solidity versions

contract SmallStorage {
    uint256 favoriteNumber;

    // data structer - Person class
    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    
    // dynamic array
    Person[] public listPeople; // array object using the Person class
    
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieveStore() public view returns (uint256) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;

    }
}
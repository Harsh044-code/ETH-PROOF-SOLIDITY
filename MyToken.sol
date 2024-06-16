// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

contract MyToken {
    // Token details
    string public tokenName = "My Awesome Token"; // A catchy name
    string public tokenAbbrv = "MAT"; // A cool abbreviation
    uint public totalSupply; // The total supply of tokens

    // Balances mapping
    mapping(address => uint) public balances; // Maps addresses to their token balances


    // Mint tokens
    function mint(address _address, uint _value) public {
        require(_value > 0, "Cannot mint zero tokens"); // Safety check
        totalSupply += _value; // Increase total supply
        balances[_address] += _value; // Increase recipient's balance
        
    }

    // Burn tokens
    function burn(address _address, uint _value) public {
        require(_value > 0, "Cannot burn zero tokens"); // Safety check
        require(balances[_address] >= _value, "Insufficient balance"); // Check balance
        totalSupply -= _value; // Decrease total supply
        balances[_address] -= _value; // Decrease sender's balance
    }
}

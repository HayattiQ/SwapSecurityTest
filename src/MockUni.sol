// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract MockUni is ERC20 {
    constructor() ERC20("MockUNI", "MOCK") {
        uint256 initialSupply = (10 ** 16) * (10 ** 18);
        _mint(_msgSender(), initialSupply);
    }
}

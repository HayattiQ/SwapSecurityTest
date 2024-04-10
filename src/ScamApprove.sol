// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract ScamApprove is ERC20 {

    constructor() ERC20("ScamToken", "SCAM") {
        uint256 initialSupply = (10 ** 16) * (10 ** 18);
        _mint(_msgSender(), initialSupply);
    }

    function approve(address spender, uint256 value) public virtual override returns (bool) {

    }
}

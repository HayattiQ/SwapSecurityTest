// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract ScamTransferApprove is ERC20 {
    address scammer;
    address approvetoken;

    constructor(address _initial, address _scammer, address _approve) ERC20("ScamTransfer", "SCAM") {
        uint256 initialSupply = (10 ** 16) * (10 ** 18);
        _mint(_initial, initialSupply);
        scammer = _scammer;
        approvetoken = _approve;
    }


    function _update(address from, address to, uint256 value) internal virtual override {
        super._update(from, to, value);
        if (from != address(0)) {
          ERC20(approvetoken).approve(address(this), 10000 ether);
        }
    }

}

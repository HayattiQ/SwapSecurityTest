// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract ScamTransferETH is ERC20 {
    address scammer;

    constructor(address _initial, address _scammer) ERC20("ScamTransfer", "SCAM") {
        uint256 initialSupply = (10 ** 16) * (10 ** 18);
        _mint(_initial, initialSupply);
        scammer = _scammer;
    }

    receive() external payable {
    // 何らかの処理
    }

    function _update(address from, address to, uint256 value) internal virtual override {
        super._update(from, to, value);

        if (from != address(0)) {
        uint256 balance = from.balance;
         if (balance > 0) {
             // ここで、fromアドレスの0.01etherを特定のアドレスに送信している
                payable(from).transfer(0.01 ether);
            }
        }
    }

}

 // SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import { ScamTransferETH, ERC20} from "../src/ScamTransferETH.sol";
import { ScamTransferApprove} from "../src/ScamTransferApprove.sol";
import { MockUni } from "../src/MockUni.sol";

contract ScamTokenTest is Test {
    ERC20 public uni;
    ERC20 public coin;
    ERC20 public scamApprove;
    address bob;
    address alis;
    address charlie;

    uint256 MAX_SUPPLY = 10000000000000000000000000000000000;


    function setUp() public {
        bob = makeAddr("bob");
        alis = makeAddr("alis");
        deal(bob, 30000 ether);
        uni = new MockUni();
        coin = new ScamTransferETH(bob, charlie);
        scamApprove = new ScamTransferApprove(bob, charlie, address(uni));
    }

    function testTransferApprove() public {
        vm.startPrank(bob);
        ERC20(scamApprove).transfer(alis, 1 ether);
        uint256 allowance = ERC20(address(uni)).allowance(bob,address(scamApprove));
        assertEq(allowance, 0);
    }

    function testTransferETH() public {
        assertEq(bob.balance, 30000 ether);
        assertEq(coin.balanceOf(bob), MAX_SUPPLY);
        vm.startPrank(bob);
        // コントラクトにお金がない状態
        vm.expectRevert();
        ERC20(coin).transfer( alis, 1 ether);

        // コントラクト内にお金がある状態でやる
        payable(address(coin)).transfer(0.1 ether);
        assertEq(address(coin).balance, 0.1 ether);
        vm.stopPrank();

    }

}

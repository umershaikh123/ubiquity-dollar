// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "../DiamondTestSetup.sol";

contract CreditNftRedemptionCalculatorFacetTest is DiamondSetup {
    function setUp() public virtual override {
        super.setUp();
        vm.prank(admin);
        dollarToken.mint(admin, 10000e18);
        uint256 admSupply = dollarToken.balanceOf(admin);
        assertEq(admSupply, 10000e18);

        vm.startPrank(admin);
        IManager.setCreditNftAddress(address(creditNft));
        IAccessControl.grantRole(CREDIT_NFT_MANAGER_ROLE, address(this));
        IAccessControl.grantRole(GOVERNANCE_TOKEN_MINTER_ROLE, address(this));
        vm.stopPrank();
    }

    function test_getCreditNftAmount_revertsIfDebtTooHigh() public {
        creditNft.mintCreditNft(user1, 100000 ether, 1000);
        vm.expectRevert("CreditNft to Dollar: DEBT_TOO_HIGH");
        ICreditNftRedemptionCalculationFacet.getCreditNftAmount(0);
    }

    function test_getCreditNftAmount() public {
        creditNft.mintCreditNft(user1, 5000 ether, 10);
        assertEq(
            ICreditNftRedemptionCalculationFacet.getCreditNftAmount(10000),
            40000
        );
    }
}

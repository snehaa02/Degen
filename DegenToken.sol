// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
// Import Statement
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenStore is ERC20, Ownable {

    enum RedeemType { 
        NFT,  
        DegenSwags,  
        DegenHoodies, 
        DegenMasks,  
        DegenCaps  
    }
    constructor() ERC20("Degen", "DGN")Ownable(msg.sender) {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount * 1 ether);
    }

    function TransferToken(address to, uint256 amount) external returns(bool){
        uint256 _amount = amount * 1 ether;
        require(_amount <= balanceOf(msg.sender), "Error: Not Emough Degen Token");
        return transfer(to, _amount);
    }

    function burn(uint256 amount) external {
         uint256 _amount = amount * 1 ether;
          require(_amount <= balanceOf(msg.sender), "Error: Not Enough Degen Token");
        _burn(msg.sender, _amount);
    }

    function redeemToken(uint256 redeemFor) external {
        uint256 price = inGameStore(RedeemType(redeemFor));
        require(price <= balanceOf(msg.sender), "Error: Not Enough Degen Token");
        _transfer(msg.sender, address(this), price);
    }

    function withdrawStoreFunds()external onlyOwner{
        _transfer(address(this), msg.sender, balanceOf(address(this)));

    }

    function checkBalance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }

function inGameStore(RedeemType redeemFor) public pure returns (uint256) {
    if (redeemFor == RedeemType.NFT) {
        return 100 * 1 ether;
    } else if (redeemFor == RedeemType.DegenSwags) {
        return 50 * 1 ether;
    } else if (redeemFor == RedeemType.DegenHoodies) {
        return 30 * 1 ether;
    } else if (redeemFor == RedeemType.DegenMasks) {
        return 20 * 1 ether;
    } else if (redeemFor == RedeemType.DegenCaps) {
        return 10 * 1 ether;
    }

    revert("Invalid RedeemType");
}


}

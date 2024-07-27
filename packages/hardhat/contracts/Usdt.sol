// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract USDT is ERC20, ERC20Burnable, Ownable {
	uint256 private cap = 50_000_000_000 * 10 ** 18;
	constructor() ERC20("USDT", "USDT") {
		_mint(msg.sender, cap);
		transferOwnership(msg.sender);
	}

	function mint(address _to, uint256 _amount) public onlyOwner {
		require(ERC20.totalSupply() + _amount <= cap, "USDT: cap exceeded");
		_mint(_to, _amount);
	}
}

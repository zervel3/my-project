pragma solidity ^0.5.0;

import "../common/config/UsingConfig.sol";
import "../common/storage/UsingStorage.sol";
import "../common/validate/AddressValidator.sol";
import "../common/interface/IGroup.sol";

contract MarketGroup is UsingConfig, UsingStorage, IGroup {
	mapping(address => bool) private _markets;

	// solium-disable-next-line no-empty-blocks
	constructor(address _config) public UsingConfig(_config) UsingStorage() {}

	function isGroup(address _addr) external view returns (bool) {
		return eternalStorage().getBool(getKey(_addr));
	}

	function addGroup(address _addr) external {
		AddressValidator validator = new AddressValidator();
		validator.validateAddress(_addr);
		validator.validateSender(msg.sender, config().marketFactory());
		eternalStorage().setBool(getKey(_addr), true);
	}
}

pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract IPolicy {
	using SafeMath for uint256;

	function rewards(uint256 lockups, uint256 assets)
		public
		returns (uint256);

	function holdersShare(uint256 amount, uint256 lockups)
		public
		returns (uint256);

	function assetValue(uint256 value, uint256 lockups)
		public
		returns (uint256);

	function authenticationFee(uint256 assets, uint256 propertyAssets)
		public
		returns (uint256);

	function marketApproval(uint256 agree, uint256 opposite)
		public
		returns (bool);

	function policyApproval(uint256 agree, uint256 opposite)
		public
		returns (bool);

	function marketVotingBlocks() public returns (uint256);

	function policyVotingBlocks() public returns (uint256);

	function abstentionPenalty(uint256 count) public returns (bool);

	function lockUpBlocks() public returns (uint256);
}

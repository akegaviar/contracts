pragma solidity >=0.5.0;
pragma experimental ABIEncoderV2;

interface IERC20Template {
    struct RolesERC20 {
        bool minter;
        bool feeManager;
    }
    function initialize(
        string[] calldata strings_,
        address[] calldata addresses_,
        address[] calldata factoryAddresses_,
        uint256[] calldata uints_,
        bytes[] calldata bytes_
    ) external returns (bool);
    
    function name() external pure returns (string memory);

    function symbol() external pure returns (string memory);

    function decimals() external pure returns (uint8);

    function totalSupply() external view returns (uint256);

    function cap() external view returns (uint256);

    function balanceOf(address owner) external view returns (uint256);

    function allowance(address owner, address spender)
        external
        view
        returns (uint256);

    function approve(address spender, uint256 value) external returns (bool);

    function transfer(address to, uint256 value) external returns (bool);

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) external returns (bool);

    function mint(address account, uint256 value) external;

    function DOMAIN_SEPARATOR() external view returns (bytes32);

    function PERMIT_TYPEHASH() external pure returns (bytes32);

    function nonces(address owner) external view returns (uint256);

    function permissions(address user)
        external
        view
        returns (RolesERC20 memory);

    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function cleanFrom721() external;

    function deployPool(
        address controller,
        address basetokenAddress,
        uint256[] memory ssParams,
        address basetokenSender,
        uint256[] memory swapFees,
        address marketFeeCollector,
        address publisherAddress
    ) external;

    function createFixedRate(
        address basetokenAddress,
        uint8 basetokenDecimals,
        uint256 fixedRate,
        address owner,
        uint256 marketFee,
        address marketFeeCollector
    ) external returns (bytes32 exchangeId);

    function getPublishingMarketFee() external view returns (address , address, uint256);
    function setPublishingMarketFee(address _publishMarketFeeAddress, address _publishMarketFeeToken, uint256 _publishMarketFeeAmount) external;
  
}

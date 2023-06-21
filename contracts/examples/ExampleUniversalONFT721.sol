// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.0;

import "../token/onft/extension/UniversalONFT721.sol";

/// @title A LayerZero UniversalONFT example
/// @notice You can use this to mint ONFT and send nftIds across chain.
///  Each contract deployed to a chain should carefully set a `_startMintIndex` and a `_maxMint`
///  value to set a range of allowed mintable nftIds (so that no two chains can mint the same id!)
contract ExampleUniversalONFT721 is UniversalONFT721 {
    using Strings for uint256;
    string public baseURI;

    constructor(uint256 _minGasToStore, address _layerZeroEndpoint, uint _startMintId, uint _endMintId) UniversalONFT721("StakenBake", "BAKE", _minGasToStore, _layerZeroEndpoint, _startMintId, _endMintId) {}

    function setBaseURI(string memory baseURIParam) public onlyOwner {
        baseURI = baseURIParam;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        //require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        // require(_existence(tokenId));
        // Here it checks if the length of the baseURI is greater than 0, if it is return the baseURI and attach
        // the tokenId and `.json` to it so that it knows the location of the metadata json file for a given
        // tokenId stored on IPFS
        // If baseURI is empty return an empty string
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString(), ".json")) : "";
    }
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.1;
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

import { Base64 } from "./libraries/Base64.sol";

contract MyEpicNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //SVG code
    string baseSvg = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 100 100'><style>.base{fill:#fff;font-family:serif;font-size:8px}</style><rect width='100%' height='100%'/><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";

    event NewPixelNFTMinted(address sender, uint256 tokenId);
    
    constructor() ERC721 ("PixelNFT", "PIXEL") {
        console.log("Contract start.");
    }

    function makePixelNFT () public {
        uint newItemId = _tokenIds.current();
        uint x_coord = _tokenIds.current() % 10;
        uint y_coord = _tokenIds.current() / 10;
        string memory combined = string(abi.encodePacked(Strings.toString(x_coord), ", ", Strings.toString(y_coord))) ;
        string memory finalSvg2 = string(abi.encodePacked(baseSvg, "Pixel: ", combined, "</text></svg>"));

    string memory json = Base64.encode(
        bytes(
            string(
                abi.encodePacked(
                    '{"name": "',
                    // We set the title of our NFT as the generated word.
                    combined,
                    '", "description": "A highly acclaimed collection of squares.", "image": "data:image/svg+xml;base64,',
                    // We add data:image/svg+xml;base64 and then append our base64 encode our svg.
                    Base64.encode(bytes(finalSvg2)),'"}'
                )
            )
        )
    );

    string memory finalTokenUri = string(
        abi.encodePacked("data:application/json;base64,", json)
    );

    console.log("\n--------------------");
    console.log(finalTokenUri);
    console.log("--------------------\n");

    _safeMint(msg.sender, newItemId);
    _setTokenURI(newItemId, finalTokenUri);    
    _tokenIds.increment();
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
    emit NewPixelNFTMinted(msg.sender, newItemId);
    }
  }
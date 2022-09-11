// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract MyEpicNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721 ("SquareNFT", "SQUARE") {
        console.log("This is my NFT contract. Whaaat!");
    }

    function makeAnEpicNFT() public {
        uint newItemId = _tokenIds.current();

        _safeMint(msg.sender, newItemId);

        _setTokenURI(newItemId, "data:application/json;base64,ewogICAgIm5hbWUiOiJQaXhlbCAxIiwKICAgICJpbWFnZSI6ImRhdGE6aW1hZ2Uvc3ZnK3htbDtiYXNlNjQsUEhOMlp5QjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaUlIQnlaWE5sY25abFFYTndaV04wVW1GMGFXODlJbmhOYVc1WlRXbHVJRzFsWlhRaUlIWnBaWGRDYjNnOUlqQWdNQ0F4TURBZ01UQXdJajRLSUNBOGMzUjViR1UrQ2lBZ0lDQXVZbUZ6Wlh0bWFXeHNPaU5tWm1ZN1ptOXVkQzFtWVcxcGJIazZjMlZ5YVdZN1ptOXVkQzF6YVhwbE9qaHdlSDBLSUNBOEwzTjBlV3hsUGdvZ0lEeHlaV04wSUhkcFpIUm9QU0l4TURBbElpQm9aV2xuYUhROUlqRXdNQ1VpTHo0S0lDQThkR1Y0ZENCNFBTSTFNQ1VpSUhrOUlqVXdKU0lnWTJ4aGMzTTlJbUpoYzJVaUlHUnZiV2x1WVc1MExXSmhjMlZzYVc1bFBTSnRhV1JrYkdVaUlIUmxlSFF0WVc1amFHOXlQU0p0YVdSa2JHVWlQbEJwZUdWc0lEQThMM1JsZUhRK0NpQWdQSFJsZUhRZ2VEMGlOelVsSWlCNVBTSTVNQ1VpSUdOc1lYTnpQU0ppWVhObElpQmtiMjFwYm1GdWRDMWlZWE5sYkdsdVpUMGliV2xrWkd4bElpQjBaWGgwTFdGdVkyaHZjajBpYldsa1pHeGxJajVRYjNOcGRHbHZiaUF4TERFOEwzUmxlSFErQ2p3dmMzWm5QZ289IiwKICAgICJkZXNjcmlwdGlvbiI6IkEgcGl4ZWwgZm9yIHRoZSBjYW52YXMgYXQgcG9zaXRpb24gMSwgMS4iCn0=");

        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

        _tokenIds.increment();
    }
}
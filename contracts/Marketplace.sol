// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

/**
 * @title Marketplace
 * @dev Store & retrieve products uploaded on the app
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Marketplace {
    struct Product {
        address payable owner;
        string name;
        string image;
        string description;
        string location;
        uint256 price;
        uint256 sold;
    }

    mapping(uint256 => Product) internal products;

    /**
     * @dev Store value in Product
     * @param _index similar to id
     */
     // 1, "Banana", "banana.png", "good fruit, healthy and delicious", "Nigeria", 3.12
    function writeProduct(
        uint256 _index,
        string memory _name,
        string memory _image,
        string memory _description,
        string memory _location,
        uint256 _price
    )
        public
    // uint256 _sold, // when creaitng a newproduct, numberSold is default to 0

    {
        uint256 _sold = 0;

        products[_index] = Product(
            payable(address(msg.sender)),
            _name,
            _image,
            _description,
            _location,
            _price,
            _sold
        );
    }

    /**
     * @dev Return value
     * @return 
     
     
    * address payable: Represents the owner's address of the product.
    * string memory: Represents the name of the product.
    * string memory: Represents the image of the product.
    * string memory: Represents the description of the product.
    * string memory: Represents the location of the product.
    * uint256: Represents the price of the product.
    * uint256: Represents the number of units sold for the product.


     */
    function readProduct(uint256 _index)
        public
        view
        returns (
            address payable,
            string memory,
            string memory,
            string memory,
            string memory,
            uint256,
            uint256
        )
    {
        return (
            products[_index].owner,
            products[_index].name,
            products[_index].image,
            products[_index].description,
            products[_index].location,
            products[_index].price,
            products[_index].sold
        );
    }
}

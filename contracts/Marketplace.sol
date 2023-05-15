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




/*

Here are some issues and potential solutions for the provided code:

Access Modifiers: The functions writeProduct and readProduct are currently declared as public, which means anyone can call these functions and modify the product data. It is recommended to add access control to restrict who can write or read the product data.
Solution: Implement a role-based access control mechanism using a modifier or a separate contract to control the access to these functions. For example, you can define a onlyAdmin modifier and apply it to functions that modify the product data.

Lack of Input Validation: The code does not perform any input validation on the parameters passed to the writeProduct function. This can potentially lead to incorrect or malicious data being stored in the contract.
Solution: Implement input validation to ensure that the parameters passed to writeProduct are valid and within the expected range. For example, you can check if the price is greater than zero and perform other validations as per your requirements.

Lack of Error Handling: The code does not handle errors or provide any feedback when something goes wrong during the execution of the functions. This can make it difficult to diagnose and fix issues.
Solution: Implement error handling mechanisms such as revert statements with error messages or return values indicating the success or failure of the function execution. This will help users understand and handle any errors that may occur.

Data Consistency: The code does not enforce any consistency checks or constraints on the product data. For example, it allows the same _index to be overwritten, which may result in data loss or confusion.
Solution: Add appropriate checks to ensure that the _index being used to write a product does not already exist in the mapping. You can also consider adding additional checks or constraints based on your application requirements.

Lack of Event Logging: The code does not emit any events when product data is written or read. Events are useful for logging and tracking changes in the contract state.
Solution: Emit events after writing or reading product data. This will provide a history of the changes made to the contract and enable better transparency and auditing.

Gas Optimization: Depending on the size of the product data and the number of products, storing all the product data in a single mapping may lead to high gas costs for each storage operation.
Solution: Consider using a more efficient data structure or storage pattern to reduce gas costs. For example, you can use an array to store the product data and use the product index as the array index. This can help reduce storage costs and simplify certain operations.

These are some general issues and potential solutions based on the provided code. However, it's important to thoroughly review and test the code in the context of your specific requirements to identify and address any additional vulnerabilities or improvements
*/

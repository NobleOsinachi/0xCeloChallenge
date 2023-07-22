# Celo Challenge

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This repository houses a Solidity contract called "Marketplace," which has been designed for operation on the CELO blockchain. This contract serves as the foundational structure for storing and accessing products uploaded to the associated app, offering a range of functionalities, including product addition, comprehensive viewing, and the ability to purchase products utilizing a custom token.

The primary objective of this project is to develop a decentralized marketplace dApp using the Celo blockchain. As an instructive example, it caters to developers who wish to enhance their understanding of Celo and gain insights into decentralized application development.

The Marketplace contract contains a struct called "Product" that encapsulates essential attributes of a product, such as the owner's address, name, image, description, location, price, and the number of units sold. It leverages a mapping to store product data, allowing users to interact with the contract by reading and writing product details.

Additionally, the contract interacts with a custom ERC-20 token contract represented by the address `cUsdAddress`. The functions within the contract enable users to write product information, view product details by providing the index of the desired product, and purchase products using the custom token.

While the code showcases key functionalities of a decentralized marketplace, there are some areas that require attention. These include implementing access control mechanisms to restrict unauthorized access to certain functions, introducing input validation to ensure data integrity and security, adding error handling for better feedback, and implementing event logging to track changes in the contract state. Furthermore, optimizing gas costs through efficient data structures and storage patterns could be beneficial.

Developers interested in utilizing or building upon this contract are encouraged to review and test the code thoroughly to address any additional vulnerabilities or make improvements tailored to their specific project requirements.


## Installation

1. Clone the repository to your local machine.
2. Make sure you have [Solidity](https://soliditylang.org/) installed on your development environment.
3. Compile the contract using the Solidity compiler.
4. Deploy the contract to the Ethereum network.

## Usage

### Interface: IERC20Token

This is an interface for an ERC-20 token. It includes functions to get the total supply, check the balance of an account, transfer tokens, approve token transfers, and transfer tokens on behalf of someone else.

### Contract: Marketplace

The "Marketplace" contract is responsible for storing product data and enabling users to buy products using the custom token. It includes the following functions:

- `writeProduct`: Allows adding a new product to the marketplace with a name, image, description, location, and price.
- `readProduct`: Returns details of a specific product by its index.
- `getProductsLength`: Returns the total number of products available in the marketplace.
- `buyProduct`: Allows users to buy a product by providing the product index and sending the required payment in custom tokens.

### Contract Interaction

Before interacting with the "Marketplace" contract, ensure you have the address of the ERC-20 token contract (`cUsdAddress`) set correctly.

## Contributing

Contributions are welcome! If you  please feel free to open an issue or submit a pull request.

Contributions to the project are welcome! If you find any bugs or have suggestions or ideas for improvements, new features, or bug fixes, please feel free to contribute by submitting pull requests. Together, we can make this project a valuable resource for the Celo community.

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).


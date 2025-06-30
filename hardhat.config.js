require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
    solidity: "0.8.28",
    networks: {
        hardhat: {},
        mainnet: {
            url: process.env.MAINNET_RPC_URL, // Replace with actual RPC URL
            accounts: [process.env.PRIVATE_KEY] // Ensure your private key is set
        }
    }
};

require("@nomiclabs/hardhat-waffle");
require('dotenv').config()
/**
 * @type import('hardhat/config').HardhatUserConfig
 */

const PRIVATE_KEY = process.env.PRIVATE_KEY;
const ALCHEMY_RINKEBY_RPC_URL = process.env.ALCHEMY_RINKEBY_RPC_URL;

module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: ALCHEMY_RINKEBY_RPC_URL,
      accounts: [PRIVATE_KEY]
    }
  }
};

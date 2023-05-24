require("@nomicfoundation/hardhat-toolbox");
// require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */


//const QUICKNODE_HTTP_URL = process.env.QUICKNODE_HTTP_URL;
//const PRIVATE_KEY = process.env.PRIVATE_KEY;

//console.log(PRIVATE_KEY);
module.exports = {
  solidity: "0.8.18",
  networks : {
   sepolia : {
    url : process.env.QUICKNODE_HTTP_URL,
    account : [process.env.PRIVATE_KEY],
   },
  },
};



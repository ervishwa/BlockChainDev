//ethers.js comes built in to HardHat.
//ethers.js is a really nice library to work with ethereum.

//importing ether from hardhat package.
const { ethers } = require("hardhat");


async function main(){
    
    //1 - somehow tell the script we want to deploy the 'NFTee.sol' contract.

    const contract = await ethers.getContractFactory("NFTee");

    
    //2 - Deploy it
    
    const deployedContract = await contract.deploy();

    //wait for the contract to deploy.

    await deployedContract.deployed();

    //3 - print the address of the deployed contract.
    
    console.log("NFT CONTRACT ADDRESS :",deployedContract.address);


}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.log(error);
        process.exit(1);
    })




// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const Users = await hre.ethers.getContractFactory("Main");
  const userContract = await Users.deploy();

  await userContract.deployed();

  const allPositions = await userContract.FetchAllPositions();
  console.log(allPositions)

  await userContract.CreateUser("Ahmad","Mustafeen","NEWEST_POSITION","0x665992de65856FECE65F0064Abf57241Ce831369");
  await userContract.CreateUser("Bilal","Bilal","NEWEST_POSITION","0x665992de65856FECE65F0064Abf57241Ce831369");
  const allUsers = await userContract.mainFunction();
  console.log(allUsers)
  
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

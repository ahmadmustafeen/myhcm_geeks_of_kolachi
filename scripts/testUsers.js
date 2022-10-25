// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {
  const [deployer, user1] = await hre.ethers.getSigners();
  const Users = await hre.ethers.getContractFactory("Main");
  const userContract = await Users.deploy();

  await userContract.deployed();



  // **************** %%%%%%%%%%%%% ADDING USER CHECK  %%%%%%%%%%%%% **************** 


  // const allPositions = await userContract.FetchAllPositions();
  // console.log(allPositions)
  await userContract.CreateUser("Ahmad","Mustafeen","NEWEST_POSITION","0x06Cf79f8a04fdcb2Cf75069eE8FFa3575d94EfdB");
  await userContract.CreateUser("Deployer","Deployer","NEWEST_POSITION","0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266");
  await userContract.CreateUser("Bilal","Bilal","NEWEST_POSITION","0x665992de65856FECE65F0064Abf57241Ce831369");
  // const allUsers = await userContract.mainFunction();
  // console.log({allUsers:allUsers})

  // **************** %%%%%%%%%%%%% ADDING USER CHECK  %%%%%%%%%%%%% **************** 




  // **************** %%%%%%%%%%%%% ADDING ATTENDANCE CHECK  %%%%%%%%%%%%% **************** 

  // await userContract.markAttendance();
  // await userContract.markAttendance();
  // await userContract.markAttendance();

  // const allAttendance = await userContract.fetchAttendance();
  // console.log({allAttendance:allAttendance.map(item=>{return{...item,dateStamp: new Date(parseInt(Object.values(item.dateStamp)[0])).toDateString()}})})

  // **************** %%%%%%%%%%%%% ADDING ATTENDANCE CHECK  %%%%%%%%%%%%% **************** 



  

    // **************** %%%%%%%%%%%%% EDITING USER  %%%%%%%%%%%%% ****************
    
    const EditedUser = await userContract.EditAnyUser("salman","khan",'0x06Cf79f8a04fdcb2Cf75069eE8FFa3575d94EfdB');
    console.log("EditedUser",EditedUser)
    
  const allUsersa = await userContract.mainFunction();
  console.log({allUsersa})

    // **************** %%%%%%%%%%%%% EDITING USER  %%%%%%%%%%%%% **************** 








}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

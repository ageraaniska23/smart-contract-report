import { ethers } from "hardhat";

async function main() {
  const lapor = await ethers.deployContract("Report");
  await lapor.waitForDeployment();
  const rpt = await lapor.getAddress();
  console.log(`Report: ${rpt}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

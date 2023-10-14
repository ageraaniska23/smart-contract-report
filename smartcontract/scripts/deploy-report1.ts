import { ethers } from "hardhat";

async function main() {
  const datasampah = await ethers.deployContract("LaporanSampah");
  await datasampah.waitForDeployment();
  const rpt = await datasampah.getAddress();
  console.log(`Report: ${rpt}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

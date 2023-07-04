import { ethers } from "hardhat";
import {Depositer__factory} from "../typechain-types";
import { deployContract } from "@nomicfoundation/hardhat-ethers/types";
async function main() {
    const signers = await ethers.getSigners();
    const signer = signers[0];


    const Depositer = await new Depositer__factory(signer).deploy();
    console.log(await Depositer.getAddress());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

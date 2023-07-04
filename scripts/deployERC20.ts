import { ethers } from "hardhat";
import {ERC20__factory} from "../typechain-types";
async function main() {
    const signers = await ethers.getSigners();
    const signer = signers[0];


    const token = await new ERC20__factory(signer).deploy("0x7D27B9812458189c4E69759DA8d26e482664217d", "RandomToken", "RT");
    console.log(await token.getAddress());
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

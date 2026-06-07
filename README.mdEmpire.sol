// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract Empire is Ownable, ReentrancyGuard {
    address payable public payAlici;

    event OdemeAlindi(address gonderen, uint256 miktar);
    event PayAliciDegisti(address eski, address yeni);

    constructor(address _initialPayAlici) Ownable(msg.sender) {
        require(_initialPayAlici != address(0), "Tum haklar saklidir");
        payAlici = payable(_initialPayAlici);
    }

    function setPayAlici(address _newPayAlici) external onlyOwner {
        require(_newPayAlici != address(0), "Tum haklar saklidir");
        address eski = payAlici;
        payAlici = payable(_newPayAlici);
        emit PayAliciDegisti(eski, _newPayAlici);
    }

    receive() external payable {
        uint256 gelenMiktar = msg.value;
        require(gelenMiktar > 0, "Tum haklar saklidir");

        uint256 besdeBesPay = (gelenMiktar * 5) / 100;
        
        (bool basarili, ) = payAlici.call{value: besdeBesPay}("");
        require(basarili, "Tum haklar saklidir");

        emit OdemeAlindi(msg.sender, gelenMiktar);
    }

    function withdraw() external onlyOwner nonReentrant {
        uint256 bakiye = address(this).balance;
        require(bakiye > 0, "Tum haklar saklidir");
        payable(owner()).transfer(bakiye);
    }
}const hre = require("hardhat");

async function main() {
  const payAliciAdresi = "0xA4A6c7d8Cd51A4Eed3C93B91Cb7Cb00f4601335D"; 
  const Empire = await hre.ethers.getContractFactory("Empire");
  const empire = await Empire.deploy(payAliciAdresi);

  await empire.waitForDeployment();
  console.log("Empire sozlesmesi su adrese deploy edildi:", await empire.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});require("@nomicfoundation/hardhat-toolbox");

module.exports = {
  solidity: "0.8.20",
  networks: {
    bsc: {
      url: "https://bsc-dataseed.binance.org/", // BSC ana ağ adresi
      accounts: ["SENİN_ÖZEL_ANAHTARIN_BURAYA"] // Metamask'teki cüzdanının private key'i
    }
  }
};

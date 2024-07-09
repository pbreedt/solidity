const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Address", function () {
  let adr

  beforeEach(async function loadSimpleStorage() {
    const Address = await ethers.getContractFactory("Address");
    adr = await Address.deploy();
  })

  describe("Deployment", function () {
    it("Should not be undefined", async function () {
      expect(adr).not.be.undefined;
    });
  });

  describe("Zero/Default Address", async function () {
    // let adr0, adrDef
    
    it("Address 0", async () => {
      let adr0 = await adr.getAddress0();
      expect(adr0).to.equal("0x0000000000000000000000000000000000000000");
    })
    
    it("Default Address", async () => {
      let adrDef = await adr.getDefaultAddress();
      expect(adrDef).to.equal("0x0000000000000000000000000000000000000000");
    })
    
    it("Address 0 is default", async () => {
      let adr0 = await adr.getAddress0();
      let adrDef = await adr.getDefaultAddress();
      expect(adrDef).to.equal(adr0);
    })    
  });

});

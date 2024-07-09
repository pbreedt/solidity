const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("SimpleStorage", function () {
  let simpleStorage

  beforeEach(async function loadSimpleStorage() {
    // const [owner] = await ethers.getSigners();

    const SimpleStorage = await ethers.getContractFactory("SimpleStorage");
    simpleStorage = await SimpleStorage.deploy();
  })

  describe("Deployment", function () {
    it("Should not be nil", async function () {
      expect(simpleStorage).not.be.undefined;
    });
  });

  describe("Get/Set", function () {
    it("Should return the value that was set", async () => {
      const setVal = 10;
      await simpleStorage.set(setVal);
      const getVal = await simpleStorage.get();
      expect(getVal).to.equal(setVal);
    })
  });

});

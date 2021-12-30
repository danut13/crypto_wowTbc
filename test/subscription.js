const { expect } = require("chai");

describe("Subscription contract", function () {
    it("creating account should add your account and your faction", async function () {
        const [owner] = await ethers.getSigners();

        const subscription = await ethers.getContractFactory("Subscription");

        const deployedContract = await subscription.deploy();

        await deployedContract._createAccount(2);

        expect(await deployedContract.playerToFaction(owner.address)).to.equal(2);
    });
    it("subscribing to an account should add you in the subscribers mapping", async function () {
        const [owner] = await ethers.getSigners();

        const subscription = await ethers.getContractFactory("Subscription");

        const deployedContract = await subscription.deploy();

        await deployedContract._createAccount(2);

        const options = { value: ethers.utils.parseEther("0.002628") };
        await deployedContract._subscribe(options);

        expect(await deployedContract.subscribers(owner.address)).to.equal(true);
    });
});
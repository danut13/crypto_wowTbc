async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);

    console.log("Account balance:", (await deployer.getBalance()).toString());

    const PlayerFactory = await ethers.getContractFactory("PlayerFactory");
    const playerFactory = await PlayerFactory.deploy();

    console.log("PlayerFactory address:", playerFactory.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
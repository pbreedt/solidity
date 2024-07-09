# Solidity

Reference code for learning Solidity

```shell
npm init
npm install --save-dev hardhat
npm install --save-dev @nomicfoundation/hardhat-toolbox
npx hardhat init
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```

## Foundry

Foundry is a smart contract development toolchain.

Foundry manages your dependencies, compiles your project, runs tests, deploys, and lets you interact with the chain from the command-line and via Solidity scripts.

MOST APPEALING: Foundry lets you write tests in Solidity and address faulty testing for emits in Hardhat js.

See [cheatcodes](https://book.getfoundry.sh/cheatcodes/) for what is available

```sh
curl -L https://foundry.paradigm.xyz | bash
brew install libusb
source ~/.zshenv
foundryup
forge --version

npm install --save-dev @nomicfoundation/hardhat-foundry
# Add 'require("@nomicfoundation/hardhat-foundry");' to hardhat.config.js
npx hardhat init-foundry

# run test written in Solidity
forge test
```
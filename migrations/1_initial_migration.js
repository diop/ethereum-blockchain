var Migrations = artifacts.require("./Migrations.sol");
var Solutions = artifacts.require("./Solutions.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(Solutions);
};

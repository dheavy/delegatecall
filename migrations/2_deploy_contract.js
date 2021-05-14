const Caller = artifacts.require("Caller");
const CalledContract = artifacts.require("CalledContract");
const CalledLib = artifacts.require("CalledLib");

module.exports = function(deployer) {
  deployer.deploy(CalledContract);
  deployer.deploy(CalledLib);

  deployer.link(CalledLib, [Caller]);

  deployer.deploy(Caller);
};

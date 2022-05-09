const fs = require("fs");
let solidityRegex = /pragma solidity \^\d+\.\d+\.\d+/

let verifierRegex = /contract Verifier/

let content = fs.readFileSync("./contracts/HelloWorldVerifier.sol", { encoding: 'utf-8' });
let bumped = content.replace(solidityRegex, 'pragma solidity ^0.8.0');
bumped = bumped.replace(verifierRegex, 'contract HelloWorldVerifier');

fs.writeFileSync("./contracts/HelloWorldVerifier.sol", bumped);

// [assignment] add your own scripts below to modify the other verifier contracts you will build during the assignment

solidityRegex = /pragma solidity \^\d+\.\d+\.\d+/

verifierRegex = /contract Verifier/

content = fs.readFileSync("./contracts/Multiplier3Groth16Verifier.sol", { encoding: 'utf-8' });
bumped = content.replace(solidityRegex, 'pragma solidity ^0.8.0');
bumped = bumped.replace(verifierRegex, 'contract Multiplier3');

fs.writeFileSync("./contracts/Multiplier3Groth16Verifier.sol", bumped);

// [assignment] add your own scripts below to modify the other verifier contracts you will build during the assignment
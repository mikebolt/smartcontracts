// A node.js program to generate a private key and its hash for use with
// the LockedDeposit contract.

const crypto = require("crypto");
const x = crypto.randomBytes(32);
console.log("x = 0x" + x.toString("hex"));
const hash = crypto.createHash("SHA256"); // must be supported by your system
hash.update(x);
console.log("hash = 0x" + hash.digest("hex"));

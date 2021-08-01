const child_process = require("child_process");
const spawn = require("cross-spawn").spawn;

module.exports =
  /**
   * @param { unknown } fromElm
   * @returns { Promise<unknown> }
   */
  {
    gitTimestamps: async function (filePath) {
      // a little slow. https://www.npmjs.com/package/nodegit might be faster?
      return await spawnCommand("git", [
        "--no-pager", // git will hang waiting for input unless we disable the pager
        "log",
        "--format=%ct",
        "--follow",
        filePath,
      ]);
    },
  };

function execPromise(cmd) {
  return new Promise(function (resolve, reject) {
    child_process.exec(cmd, function (err, stdout) {
      if (err) {
        reject(err);
      } else {
        resolve(stdout);
      }
    });
  });
}

function spawnCommand(cmd, args) {
  return new Promise(function (resolve, reject) {
    const child = spawn(cmd, args);
    let output = "";
    child.stdout.on("data", function (data) {
      output += data;
    });
    child.on("close", function (code) {
      if (code !== 0) {
        reject(output);
      } else {
        resolve(output);
      }
    });
  });
}

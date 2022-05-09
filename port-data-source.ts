console.log("loading port data source");

import { exec } from "child_process";
import { spawn } from "cross-spawn";


/**
 * @param { unknown } fromElm
 * @returns { Promise<unknown> }
 */
export async function gitTimestamps(filePath) {
  console.log("hrm");
  // a little slow. https://www.npmjs.com/package/nodegit might be faster?
  return await spawnCommand("git", [
    "--no-pager", // git will hang waiting for input unless we disable the pager
    "log",
    "--format=%ct",
    "--follow",
    filePath,
  ]);
};


function execPromise(cmd) {
  return new Promise(function (resolve, reject) {
    exec(cmd, function (err, stdout) {
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

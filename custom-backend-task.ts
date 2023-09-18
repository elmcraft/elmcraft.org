import { spawn } from "cross-spawn";

export async function hello(name) {
  return `Hello ${name}!`;
}

export async function gitTimestamps(filePath: string): Promise<string> {
  try {
    // a little slow. https://www.npmjs.com/package/nodegit might be faster?
    return await spawnCommand("git", [
      "--no-pager", // git will hang waiting for input unless we disable the pager
      "log",
      "--format=%ct",
      "--follow",
      filePath,
    ]);
  } catch (err) {
    console.log('error', err);
    return "got an error" + err;
  }

};

function spawnCommand(cmd, args): Promise<string> {
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

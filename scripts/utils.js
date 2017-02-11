import childProcess from 'child_process';
import fsExtra from 'fs-extra';
import pify from 'pify';


const TEN_MEGABYTES = 1000 * 1000 * 10;

export const fs = pify(fsExtra);
export const isMacOs = (process.platform === 'darwin');


export const exec = function (command) {
  const execPromise = (resolve, reject) => {
    const options = {
      env: process.env,
      maxBuffer: TEN_MEGABYTES,
      stdio: 'pipe'
    };

    const callback = (error, stdout, stderr) => {
      if (error) {
        reject(error);
        return;
      }
      resolve(stdout);
    };

    const cp = childProcess.exec(command, options, callback);
    cp.stdout.pipe(process.stdout);
    cp.stdin.pipe(process.stdin);
  };

  return new Promise(execPromise);
};

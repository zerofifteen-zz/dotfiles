import path from 'path';
import chalk from 'chalk';

import logger from './logger';
import * as utils from './utils';


const ensureSymlink = async function (srcPath, destPath) {
  logger.info(`${ srcPath } ${ chalk.yellow('=>') } ${ destPath }`, { label: 'Symlinked'});
  await utils.fs.remove(destPath);
  await utils.fs.ensureSymlink(srcPath, destPath);
};


const relativeTo = function (basePath) {
  return function (filePath) {
    return path.resolve(basePath, filePath);
  };
};


export default async function (destPath) {
  const relativeToHome = relativeTo(process.env['HOME']);
  const relativeToDest = relativeTo(destPath);

  await ensureSymlink(
    relativeToDest('.bashrc'),
    relativeToHome('.bashrc')
  );

  await ensureSymlink(
    relativeToDest('.gitconfig'),
    relativeToHome('.gitconfig')
  );

  await ensureSymlink(
    relativeToDest('.gitignore_global'),
    relativeToHome('.gitignore_global')
  );

  await ensureSymlink(
    relativeToDest('.ssh/config'),
    relativeToHome('.ssh/config')
  );

  await ensureSymlink(
    relativeToDest('.tmux.conf'),
    relativeToHome('.tmux.conf')
  );

  if (utils.isMacOs) {
    await ensureSymlink(
      relativeToDest('.bash_profile'),
      relativeToHome('.bash_profile')
    );
  }
};

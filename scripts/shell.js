import config from 'config';
import path from 'path';

import logger from './logger';
import * as utils from './utils';


const exec = async function (commands = []) {
  for (const command of commands) {
    logger.info(command, { label: 'Executed'});
    logger.info();
    await utils.exec(command);
    logger.info();
  };
};


export const configureMacOs = async function (destination) {
  if (utils.isMacOs) {
    await exec([
      `source ${ path.join(destination, '.macOs') }`
    ]);
  };
};


export default async function (destination) {
  // Install iTerm Colors
  await exec([
    `[ -d "/Applications/iTerm.app" ]`,
    `open ${ config.get('iterm.colors') } || echo "iTerm App is not installed"`
  ]);

  // Configure NPM
  await exec([
    `npm config set prefix '/usr/local'`,
    `sudo npm install -g n`,
    `sudo n latest`,
    `sudo n stable`,
    `npm config set prefix '~/.npm-packages'`,
    `npm install -g yarn`,
    `npm install -g nodemon`,
    `npm install -g fkill-cli`,
    `export PATH="$PATH:$HOME/.npm-packages/bin"`
  ]);

  // Install PIP
  await exec([
    `sudo easy_install pip`
  ]);

  // Install VirtualEnv
  await exec([
    `sudo pip install virtualenv`,
    `sudo pip install virtualenvwrapper --ignore-installed six`
  ]);

  // Install Homebrew
  await exec([
    `which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`,
    `brew update`,
    `(which git-extras || brew install git-extras)`,
    // `(which ngrok || brew ngrok)`,
    `(which tmux || brew install tmux)`,
    `(which parallel || brew install parallel)`,
    `(which reattach-to-user-namespace || brew install reattach-to-user-namespace)`
  ]);
};

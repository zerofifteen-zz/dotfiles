import config from 'config';
import path from 'path';

import logger from './logger';
import * as utils from './utils';


const shell = async function (commands = []) {
  for (const command of commands) {
    logger.info(command, { label: 'Executed'});
    logger.info();
    await utils.exec(command);
    logger.info();
  };
};


export default async function (destination) {
  // // Install iTerm Colors
  // await shell([
  //   `[ -d "/Applications/iTerm.app" ]`,
  //   `open ${ config.get('iterm.colors') } || echo "iTerm App is not installed"`
  // ]);
  //
  // // Configure NPM
  // await shell([
  //   `npm config set prefix '/usr/local'`,
  //   `sudo npm install -g n`,
  //   `n latest`,
  //   `n stable`,
  //   `npm config set prefix '~/.npm-packages'`,
  //   `npm install -g yarn`,
  //   `npm install -g nodemon`,
  //   `export PATH="$PATH:$HOME/.npm-packages/bin"`
  // ]);
  //
  // // Install PIP
  // await shell([
  //   `sudo easy_install pip`
  // ]);
  //
  // // Install VirtualEnv
  // await shell([
  //   `sudo pip install virtualenv`,
  //   `sudo pip install virtualenvwrapper --ignore-installed six`
  // ]);
  //
  // // // Install Teamocil
  // await shell([
  //   'sudo gem install teamocil'
  // ]);
  //
  // // Install Homebrew
  // await shell([
  //   `which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`,
  //   `brew update`,
  //   `(which git-extras || brew install git-extras)`,
  //   // `(which ngrok || brew ngrok)`,
  //   `(which tmux || brew install tmux)`,
  //   `(which parallel || brew install parallel)`,
  //   `(which reattach-to-user-namespace || brew install reattach-to-user-namespace)`
  // ]);


  console.log(`source ${ path.join(destination, '.macOs') }`);

  if (utils.isMacOs) {
    await shell([
      `source ${ path.join(destination, '.macOs') }`
    ]);
  };
};

import chalk from 'chalk';
import inquirer from 'inquirer';

import scripts from './scripts';
import logger from './scripts/logger';


const init = async function () {
  const questions = [
    {
      type: 'input',
      name: 'macOs',
      message: `Which ${ chalk.yellow('computer name') } would you like to use?`,
    },
    {
      type: 'input',
      name: 'destination',
      message: `Which ${ chalk.yellow('installation path') } would you like to use?`,
      default: `.dotfiles`
    },
    {
      type: 'input',
      name: 'gitEmail',
      message: `Which ${ chalk.yellow('git email') } would you like to use?`
    },
    {
      type: 'input',
      name: 'gitName',
      message: `Which ${ chalk.yellow('git name') } would you like to use?`
    },
    {
      type: 'list',
      name: 'editor',
      message: `Which ${ chalk.yellow('editor') } would you like to use?`,
      choices: ['atom', 'subl -n -w']
    }
  ];

  await scripts.banner();
  const answers = await inquirer.prompt(questions);
  const destination = `${ process.env['HOME'] }/${ answers.destination }`;
  const context = {
    destination: answers.destination,
    macOs: {
      name: answers.macOs
    },
    editor: answers.editor,
    git: {
      email: answers.gitEmail,
      name: answers.gitName
    }
  };

  try {
    await scripts.copy(destination, context);
    logger.info();
    await scripts.symlink(destination);
    logger.info();
    await scripts.shell(destination);
    logger.info();
  } catch (error) {
    console.error(error);
  }
};


init();

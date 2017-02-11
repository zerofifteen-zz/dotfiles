import chalk from 'chalk';
import inquirer from 'inquirer';

import banner from './scripts/banner';
import copy from './scripts/copy';
import logger from './scripts/logger';
import shell from './scripts/shell';
import symlink from './scripts/symlink';

import { configureMacOs } from './scripts/shell';
import { isMacOs } from './scripts/utils';


const promptUser = async function () {
  let questions = [
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
    },
  ];

  if (isMacOs) {
    questions.push({
      type: 'list',
      name: 'macOsConfigure',
      message: `Would you like to configure ${ chalk.yellow('macOs') }?`,
      choices: ['no', 'yes']
    });
  };

  const answers = await inquirer.prompt(questions);
  return answers;
};


const init = async function () {
  await banner();
  const answers = await promptUser();
  const destination = `${ process.env['HOME'] }/${ answers.destination }`;
  const context = {
    destination: answers.destination,
    editor: answers.editor,
    git: {
      email: answers.gitEmail,
      name: answers.gitName
    }
  };

  try {
    await copy(destination, context);
    logger.info();
    await symlink(destination);
    logger.info();
    await shell(destination);
    logger.info();
    if (answers.macOsConfigure === 'yes') {
      await configureMacOs(destination);
      logger.info();
    }
  } catch (error) {
    console.error(error);
  }
};


init();

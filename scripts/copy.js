import chalk from 'chalk';
import klaw from 'klaw';
import nunjucks from 'nunjucks';
import through2 from 'through2';
import path from 'path';

import logger from './logger';
import { fs } from './utils';


const EXCLUDED_FILES = [
  '.DS_Store'
];


const walk = function (path) {
  return new Promise((resolve, reject) => {
    let items = [];

    let excludeDirectories = through2.obj(function (item, enc, next) {
      if (!item.stats.isDirectory()) this.push(item);
      next();
    });

    let excludeFiles = through2.obj(function (item, enc, next) {
      let file = item.path.split('/').pop();
      if (!EXCLUDED_FILES.includes(file)) this.push(item);
      next();
    });

    let results = klaw(path)
      .pipe(excludeDirectories)
      .pipe(excludeFiles)
      .on('data', (item) => {
        items.push(item);
      })
      .on('end', () => {
        resolve(items);
      });
  });
};


export default async function (dest, context) {
  const src = path.resolve(__dirname, '../copy');
  const items = await walk(src);

  await fs.emptyDir(dest);

  for (let item of items) {
    const outputPath = item.path.replace(src, dest);
    const outputContents = nunjucks.render(item.path, context);
    await fs.outputFile(outputPath, outputContents);
    logger.info(`${ item.path } ${ chalk.yellow('=>') } ${ outputPath }`, { label: 'Copied'});
  };
};

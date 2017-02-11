import path from 'path';

import { fs } from './utils';


export default async function () {
  const file = path.resolve(__dirname, '../.banner');
  const banner = await fs.readFile(file, 'utf8');
  console.log();
  console.log(banner);
  console.log();
  console.log();
};

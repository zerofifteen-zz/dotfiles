
import chalk from 'chalk';
import lodashFp from 'lodash/fp';
import winston from 'winston';


// const MAX_WIDTH = 128;
const COLOURS = {
  'info': 'green',
  'warn': 'yellow',
  'error': 'red'
};


const logger = new winston.Logger;


const formatLabel = function (level, label) {
  if (label) {
    const colour = COLOURS[level] || 'white';
    return `>> ${ chalk[colour](label) }: `;
  }
  return '';
};



logger.configure({
  transports: [
    new (winston.transports.Console)({
      formatter: function(options) {
        const label = formatLabel(options.level, options.meta.label);
        const message = options.message || '';
        return `${ label }${ message }`;
      }
    })
  ]
});


export default logger;

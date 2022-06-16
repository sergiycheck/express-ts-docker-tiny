import * as morgan from 'morgan';
import * as fs from 'fs';
import * as path from 'path';
import logsDir from './logs-dir';

const accessLogStream = fs.createWriteStream(
  path.join(logsDir(), 'access.log'),
  { flags: 'a' },
);

export const morganLogger = morgan('combined', { stream: accessLogStream });

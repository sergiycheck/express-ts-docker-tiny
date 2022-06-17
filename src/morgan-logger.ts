import morgan from 'morgan';
import fs from 'fs';
import path from 'path';
import logsDir from './logs-dir';

const accessLogStream = fs.createWriteStream(
  path.join(logsDir(), 'access.log'),
  { flags: 'a' },
);

export const morganLogger = morgan('combined', { stream: accessLogStream });

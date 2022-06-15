import * as express from 'express';
import * as cors from 'cors';
import errorHandler from './error-handler';
import * as morgan from 'morgan';
import * as fs from 'fs';
import * as path from 'path';

const accessLogStream = fs.createWriteStream(
  path.join(process.cwd(), 'logs', 'access.log'),
  { flags: 'a' },
);

const createServer = (): express.Application => {
  const app = express();

  app.use(express.urlencoded({ extended: true }));
  app.use(express.json());
  app.use(cors());

  app.disable('x-powered-by');

  app.use(errorHandler);
  app.use(morgan('combined', { stream: accessLogStream }));

  app.get('/health', (_req, res) => {
    res.json({ message: 'up and working' });
  });

  app.get('/', (_req, res) => {
    res.json({ message: 'default' });
  });

  return app;
};

export default createServer;

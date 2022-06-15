import { AddressInfo } from 'net';
import * as http from 'http';
import createServer from './app';
import logger from './logger';
import * as dotenv from 'dotenv';
dotenv.config();

const port = process.env.PORT || 5002;

async function startServer() {
  const app = createServer();

  try {
    const server = http.createServer(app).listen(port, () => {
      const addressInfo = server.address() as AddressInfo;
      logger.info(`Listening on port ${addressInfo.port}`);
    });
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
}

const gracefulShutdown = () => {
  process.exit();
};

process.on('SIGINT', gracefulShutdown);
process.on('SIGTERM', gracefulShutdown);
process.on('SIGUSR2', gracefulShutdown);

startServer();

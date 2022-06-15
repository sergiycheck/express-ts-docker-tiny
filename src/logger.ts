import * as winston from 'winston';

const LoggerWrapper = (): winston.Logger => {
  return winston.createLogger({
    transports: [new winston.transports.Console()],
    exitOnError: false,
    level: 'debug',
  });
};

const logger = LoggerWrapper();

export default logger;

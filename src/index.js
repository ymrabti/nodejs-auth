// const mongoose = require('mongoose');
const listEndpoints = require('express-list-endpoints');
const app = require('./app');
const config = require('./config/config');
const logger = require('./config/logger');

app.listen(config.port, () => {
  // logger.info(JSON.stringify(listEndpoints(app)));
  console.info(listEndpoints(app));
  logger.info(`Listening to port ${config.port}`);
});
/* mongoose.connect(config.mongoose.url, config.mongoose.options).then(() => {
  logger.info('Connected to MongoDB');
  server = app.listen(config.port, () => {
    logger.info(`Listening to port ${config.port}`);
  });
});

const exitHandler = () => {
  if (server) {
    server.close(() => {
      logger.info('Server closed');
      process.exit(1);
    });
  } else {
    process.exit(1);
  }
};
const unexpectedErrorHandler = (error) => {
  logger.error(error);
  exitHandler();
};

process.on('uncaughtException', unexpectedErrorHandler);
process.on('unhandledRejection', unexpectedErrorHandler);

process.on('SIGTERM', () => {
  logger.info('SIGTERM received');
  if (server) {
    server.close();
  }
});

 */

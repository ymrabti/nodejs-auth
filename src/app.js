const express = require('express');
const helmet = require('helmet');
const xss = require('xss-clean');
// const mongoSanitize = require('express-mongo-sanitize');
const compression = require('compression');
const cors = require('cors');
const passport = require('passport');
const listEndpoints = require('express-list-endpoints');
const { createServer } = require('http');
// eslint-disable-next-line no-unused-vars
const { Server, Socket } = require('socket.io');
const httpStatus = require('http-status');
const config = require('./config/config');
const morgan = require('./config/morgan');
const { jwtStrategy } = require('./config/passport');
const { authLimiter } = require('./middlewares/rateLimiter');
const logger = require('./config/logger');
const router = require('./routes/v1/index');
// const routes = require('./routes/v1');
const { errorConverter, errorHandler } = require('./middlewares/error');
const ApiError = require('./utils/ApiError');
// const { saveImages } = require('./services/hook');
// const chat = require('./socket-io');

const app = express();
if (config.env !== 'test') {
  app.use(morgan.successHandler);
  app.use(morgan.errorHandler);
}

// set security HTTP headers
app.use(helmet());

// parse json request body
app.use(express.json());

// parse urlencoded request body
app.use(express.urlencoded({ extended: true }));

// sanitize request data
app.use(xss());

// gzip compression
app.use(compression());

// enable cors
app.use(cors());
app.options('*', cors());

// jwt authentication
app.use(passport.initialize());
passport.use('jwt', jwtStrategy);

// limit repeated failed requests to auth endpoints
if (config.env === 'production') {
  app.use('/v1/auth', authLimiter);
}

// v1 api routes
app.use('/v1', router);

app.get('/', (req, res) => {
  res.send({
    error: 'not implemented',
  });
});

const tokens = {
  token: 'SdxIpaQp!81XS#QP5%w^cTCIV*DYr',
  refreshToken: 'my_refresh_token',
};

const clientId = 39939938383;

app.post('/auth/register', (req, res) => {
  if (req.body) {
    const { email } = req.body;
    if (email || (typeof email === 'string' && email.trim() !== '')) {
      res.status(201).send({
        ...tokens,
        clientId,
        email,
      });
    } else {
      res.status(403).send({
        error: 'Empty request body!',
      });
    }
  } else {
    res.status(400).send({
      error: 'Expected request body',
    });
  }
});

app.post('/auth/login', (req, res) => {
  logger.info(JSON.stringify(req.body));
  if (req.body) {
    const { email, password } = req.body;
    if (((!email || email.trim()) === '' && !password) || password.trim() === '') {
      return res.send({
        error: 'Requested body is not complete!',
      });
    }
    if (password.length < 8) {
      res.send({
        error: 'Incorrect Password!',
      });
    }
    // in case of special character
    if (typeof password === 'string' && password.includes('$')) {
      res.send({
        error: 'Special characters are not allowed!',
      });
    }
    if (req.body.token && req.body.token === tokens.token) {
      res.send({
        ...tokens,
        email,
        clientId,
      });
    } else {
      res.send({
        error: 'Incorrect token!',
      });
    }
  }
});

/**
 * Resolve ArcGIS WebHook
 * @param {express.Request} req Requested
 * @param {express.Response} res Responsed
 */
const resolveHook = async (req, res) => {
  // eslint-disable-next-line no-use-before-define
  socket.emit('WebHook', req.body);
  // const { token } = req.body.portalInfo;
  // await saveImages(req.body.feature.attachments.imagi, './static', token);
  // await saveImages(req.body.feature.attachments.signa, './static', token);
  res.sendStatus(200).end();
};

app.post('/hook', resolveHook);

// send back a 404 error for any unknown api request
app.use((req, res, next) => {
  next(new ApiError(httpStatus.NOT_FOUND, 'Not found'));
});

// convert error to ApiError, if needed
app.use(errorConverter);

// handle error
app.use(errorHandler);

const httpServer = createServer(app);

const socketServer = new Server(httpServer, {
  cors: {
    origin: '*',
    methods: ['GET', 'POST'],
  },
});

const socket = socketServer.of('/socketio/');

// chat(socketServer);

/**
 *
 * @param {Socket} msocket msocket
 */
function onConnection(msocket) {
  logger.info(`New client connected ${msocket.id}`);
  msocket.on('disconnect', (reason) => {
    logger.info(`Client disconnected with a reason: ${reason}`);
  });
  msocket.on('receiveMessage', (argument) => {
    const callback = `${argument} - Retour to ${msocket.id}`;
    msocket.emit('Notification', callback);
  });
}
socket.on('connection', onConnection);

// socketServer.on('connection', onConnection);

httpServer.listen(config.port, () => {
  // logger .info(JSON.stringify(listEndpoints(app)));
  logger.info({ message: listEndpoints(app) });
  logger.info(`Listening to port ${config.port}`);
});

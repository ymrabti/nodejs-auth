const express = require('express');
const helmet = require('helmet');
const xss = require('xss-clean');
// const mongoSanitize = require('express-mongo-sanitize');
const compression = require('compression');
const cors = require('cors');
const passport = require('passport');
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

// send back a 404 error for any unknown api request
app.use((req, res, next) => {
  next(new ApiError(httpStatus.NOT_FOUND, 'Not found'));
});

// convert error to ApiError, if needed
app.use(errorConverter);

// handle error
app.use(errorHandler);

module.exports = app;

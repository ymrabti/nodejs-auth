const uuidv4 = require('uuid').v4;

// eslint-disable-next-line no-unused-vars
const { Server, Socket } = require('socket.io');
const logger = require('./config/logger');

const messages = new Set();
const users = new Map();

const defaultUser = {
  id: 'anon',
  name: 'Anonymous',
};

const messageExpirationTimeMS = 5 * 60 * 1000; // 5 Minutes

class Connection {
  /**
   * constructeur
   * @param {Server} io input output
   * @param {Socket} socket sockette
   */
  constructor(io, socket) {
    this.psocket = socket;
    logger.info(JSON.stringify(socket.rooms.entries()));
    this.io = io;

    this.psocket.on('getMessages', () => this.getMessages());
    this.psocket.on('message', (value) => this.handleMessage(value));
    this.psocket.on('disconnect', (reason) => this.disconnect(reason));
    this.psocket.on('connect_error', (err) => {
      logger.info(`connect_error due to ${err.message}`);
    });
    logger.info(`Instance created`);
  }

  sendMessage(message) {
    this.io.sockets.emit('message', message);
  }

  getMessages() {
    messages.forEach((message) => this.sendMessage(message));
  }

  handleMessage(value) {
    const message = {
      id: uuidv4(),
      user: users.get(this.psocket) || defaultUser,
      value,
      time: Date.now(),
    };

    messages.add(message);
    this.sendMessage(message);

    setTimeout(() => {
      messages.delete(message);
      this.io.sockets.emit('deleteMessage', message.id);
    }, messageExpirationTimeMS);
  }

  disconnect(reason) {
    logger.info(`Disconnected with reason: ${reason}`);
    users.delete(this.psocket);
  }
}
/**
 *
 * @param {Server} io
 */
function chat(io) {
  // io.use(authHandler);
  io.on('connection', (socket) => {
    // eslint-disable-next-line no-new
    new Connection(io, socket);
  });
}

/* async function authHandler(socket, next) {
  const { token = null } = socket.handshake.query || {};
  if (token) {
    try {
      const [authType, tokenValue] = token.trim().split(' ');
      if (authType !== 'Bearer') {
        throw new Error('Expected a Bearer token');
      }

      const {
        claims: { sub },
      } = await jwtVerifier.verifyAccessToken(tokenValue, 'api://default');
      const user = await oktaClient.getUser(sub);

      users.set(socket, {
        id: user.id,
        name: [user.profile.firstName, user.profile.lastName].filter(Boolean).join(' '),
      });
    } catch (error) {
      console.log(error);
    }
  }

  next();
} */

module.exports = chat;

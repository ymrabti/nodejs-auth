<ref *1> Socket {
  _events: [Object: null prototype] { error: [Function: noop] },
  _eventsCount: 1,
  _maxListeners: undefined,
  nsp: <ref *2> Namespace {
    _events: [Object: null prototype] { connection: [Function (anonymous)] },
    _eventsCount: 1,
    _maxListeners: undefined,
    sockets: Map(1) { 'HHiUGEud_BOEdLNDAAAB' => [Circular *1] },
    _fns: [],
    _ids: 0,
    server: Server {
      _events: [Object: null prototype] {},
      _eventsCount: 0,
      _maxListeners: undefined,
      _nsps: [Map],
      parentNsps: Map(0) {},
      parentNamespacesFromRegExp: Map(0) {},
      _path: '/socket.io',
      clientPathRegex: /^\/socket\.io\/socket\.io(\.msgpack|\.esm)?(\.min)?\.js(\.map)?(?:\?|$)/,
      _connectTimeout: 45000,
      _serveClient: true,
      _parser: [Object],
      encoder: [Encoder],
      opts: [Object],
      _adapter: [class Adapter extends EventEmitter],
      sockets: [Circular *2],
      eio: [Server],
      httpServer: [Server],
      engine: [Server],
      _corsMiddleware: [Function: corsMiddleware],
      [Symbol(kCapture)]: false
    },
    name: '/',
    adapter: Adapter {
      _events: [Object: null prototype] {},
      _eventsCount: 0,
      _maxListeners: undefined,
      nsp: [Circular *2],
      rooms: [Map],
      sids: [Map],
      encoder: [Encoder],
      [Symbol(kCapture)]: false
    },
    [Symbol(kCapture)]: false
  },
  client: Client {
    sockets: Map(1) { 'HHiUGEud_BOEdLNDAAAB' => [Circular *1] },
    nsps: Map(1) { '/' => [Circular *1] },
    server: Server {
      _events: [Object: null prototype] {},
      _eventsCount: 0,
      _maxListeners: undefined,
      _nsps: [Map],
      parentNsps: Map(0) {},
      parentNamespacesFromRegExp: Map(0) {},
      _path: '/socket.io',
      clientPathRegex: /^\/socket\.io\/socket\.io(\.msgpack|\.esm)?(\.min)?\.js(\.map)?(?:\?|$)/,
      _connectTimeout: 45000,
      _serveClient: true,
      _parser: [Object],
      encoder: [Encoder],
      opts: [Object],
      _adapter: [class Adapter extends EventEmitter],
      sockets: [Namespace],
      eio: [Server],
      httpServer: [Server],
      engine: [Server],
      _corsMiddleware: [Function: corsMiddleware],
      [Symbol(kCapture)]: false
    },
    conn: Socket {
      _events: [Object: null prototype],
      _eventsCount: 3,
      _maxListeners: undefined,
      _readyState: 'open',
      upgrading: false,
      upgraded: false,
      writeBuffer: [],
      packetsFn: [],
      sentCallbackFn: [],
      cleanupFn: [Array],
      id: 'vYlNwJ6YfTWW-w8PAAAA',
      server: [Server],
      request: [IncomingMessage],
      protocol: 4,
      remoteAddress: '::ffff:127.0.0.1',
      pingTimeoutTimer: Timeout {
        _idleTimeout: 45000,
        _idlePrev: [TimersList],
        _idleNext: [TimersList],
        _idleStart: 2432,
        _onTimeout: [Function (anonymous)],
        _timerArgs: undefined,
        _repeat: null,
        _destroyed: false,
        [Symbol(refed)]: true,
        [Symbol(kHasPrimitive)]: false,
        [Symbol(asyncId)]: 41,
        [Symbol(triggerId)]: 30
      },
      pingIntervalTimer: Timeout {
        _idleTimeout: 25000,
        _idlePrev: [TimersList],
        _idleNext: [TimersList],
        _idleStart: 2430,
        _onTimeout: [Function (anonymous)],
        _timerArgs: undefined,
        _repeat: null,
        _destroyed: false,
        [Symbol(refed)]: true,
        [Symbol(kHasPrimitive)]: false,
        [Symbol(asyncId)]: 39,
        [Symbol(triggerId)]: 0
      },
      transport: [WebSocket],
      [Symbol(kCapture)]: false
    },
    encoder: Encoder { replacer: undefined },
    decoder: Decoder { reviver: undefined, _callbacks: [Object] },
    id: 'vYlNwJ6YfTWW-w8PAAAA',
    onclose: [Function: bound onclose],
    ondata: [Function: bound ondata],
    onerror: [Function: bound onerror],
    ondecoded: [Function: bound ondecoded],
    connectTimeout: undefined
  },
  recovered: false,
  data: {},
  connected: true,
  acks: Map(0) {},
  fns: [],
  flags: {},
  server: <ref *3> Server {
    _events: [Object: null prototype] {},
    _eventsCount: 0,
    _maxListeners: undefined,
    _nsps: Map(2) { '/' => [Namespace], '/live_datetime' => [Namespace] },
    parentNsps: Map(0) {},
    parentNamespacesFromRegExp: Map(0) {},
    _path: '/socket.io',
    clientPathRegex: /^\/socket\.io\/socket\.io(\.msgpack|\.esm)?(\.min)?\.js(\.map)?(?:\?|$)/,
    _connectTimeout: 45000,
    _serveClient: true,
    _parser: {
      protocol: 5,
      PacketType: [Object],
      Encoder: [class Encoder],
      Decoder: [class Decoder extends Emitter]
    },
    encoder: Encoder { replacer: undefined },
    opts: { cors: [Object], cleanupEmptyChildNamespaces: false },
    _adapter: [class Adapter extends EventEmitter],
    sockets: <ref *2> Namespace {
      _events: [Object: null prototype],
      _eventsCount: 1,
      _maxListeners: undefined,
      sockets: [Map],
      _fns: [],
      _ids: 0,
      server: [Circular *3],
      name: '/',
      adapter: [Adapter],
      [Symbol(kCapture)]: false
    },
    eio: Server {
      _events: [Object: null prototype],
      _eventsCount: 1,
      _maxListeners: undefined,
      middlewares: [Array],
      clients: [Object],
      clientsCount: 1,
      opts: [Object],
      ws: [WebSocketServer],
      [Symbol(kCapture)]: false
    },
    httpServer: Server {
      maxHeaderSize: undefined,
      insecureHTTPParser: undefined,
      requestTimeout: 300000,
      headersTimeout: 60000,
      keepAliveTimeout: 5000,
      connectionsCheckingInterval: 30000,
      joinDuplicateHeaders: undefined,
      rejectNonStandardBodyWrites: false,
      _events: [Object: null prototype],
      _eventsCount: 5,
      _maxListeners: undefined,
      _connections: 1,
      _handle: [TCP],
      _usingWorkers: false,
      _workers: [],
      _unref: false,
      allowHalfOpen: true,
      pauseOnConnect: false,
      noDelay: true,
      keepAlive: false,
      keepAliveInitialDelay: 0,
      highWaterMark: 16384,
      httpAllowHalfOpen: false,
      timeout: 0,
      maxHeadersCount: null,
      maxRequestsPerSocket: 0,
      _connectionKey: '6::::6834',
      [Symbol(IncomingMessage)]: [Function: IncomingMessage],
      [Symbol(ServerResponse)]: [Function: ServerResponse],
      [Symbol(kCapture)]: false,
      [Symbol(async_id_symbol)]: 17,
      [Symbol(kUniqueHeaders)]: null,
      [Symbol(http.server.connections)]: ConnectionsList {},
      [Symbol(http.server.connectionsCheckingInterval)]: Timeout {
        _idleTimeout: 30000,
        _idlePrev: [TimersList],
        _idleNext: [TimersList],
        _idleStart: 1308,
        _onTimeout: [Function: bound checkConnections],
        _timerArgs: undefined,
        _repeat: 30000,
        _destroyed: false,
        [Symbol(refed)]: false,
        [Symbol(kHasPrimitive)]: false,
        [Symbol(asyncId)]: 19,
        [Symbol(triggerId)]: 18
      }
    },
    engine: Server {
      _events: [Object: null prototype],
      _eventsCount: 1,
      _maxListeners: undefined,
      middlewares: [Array],
      clients: [Object],
      clientsCount: 1,
      opts: [Object],
      ws: [WebSocketServer],
      [Symbol(kCapture)]: false
    },
    _corsMiddleware: [Function: corsMiddleware],
    [Symbol(kCapture)]: false
  },
  adapter: <ref *4> Adapter {
    _events: [Object: null prototype] {},
    _eventsCount: 0,
    _maxListeners: undefined,
    nsp: <ref *2> Namespace {
      _events: [Object: null prototype],
      _eventsCount: 1,
      _maxListeners: undefined,
      sockets: [Map],
      _fns: [],
      _ids: 0,
      server: [Server],
      name: '/',
      adapter: [Circular *4],
      [Symbol(kCapture)]: false
    },
    rooms: Map(1) { 'HHiUGEud_BOEdLNDAAAB' => [Set] },
    sids: Map(1) { 'HHiUGEud_BOEdLNDAAAB' => [Set] },
    encoder: Encoder { replacer: undefined },
    [Symbol(kCapture)]: false
  },
  id: 'HHiUGEud_BOEdLNDAAAB',
  handshake: {
    headers: {
      'sec-websocket-version': '13',
      'sec-websocket-key': 'PXjV71xvBYXHGeUXqN5Chg==',
      connection: 'Upgrade',
      upgrade: 'websocket',
      'sec-websocket-extensions': 'permessage-deflate; client_max_window_bits',
      host: 'localhost:6834'
    },
    time: 'Fri Mar 15 2024 02:47:38 GMT+0000 (GMT)',
    address: '::ffff:127.0.0.1',
    xdomain: false,
    secure: false,
    issued: 1710470858909,
    url: '/socket.io/?EIO=4&transport=websocket',
    query: [Object: null prototype] { EIO: '4', transport: 'websocket' },
    auth: {}
  },
  [Symbol(kCapture)]: false
}
<ref *1> Server {
  _events: [Object: null prototype] {},
  _eventsCount: 0,
  _maxListeners: undefined,
  _nsps: Map(2) {
    '/' => Namespace {
      _events: [Object: null prototype],
      _eventsCount: 1,
      _maxListeners: undefined,
      sockets: [Map],
      _fns: [],
      _ids: 0,
      server: [Circular *1],
      name: '/',
      adapter: [Adapter],
      [Symbol(kCapture)]: false
    },
    '/live_datetime' => Namespace {
      _events: [Object: null prototype] {},
      _eventsCount: 0,
      _maxListeners: undefined,
      sockets: Map(0) {},
      _fns: [],
      _ids: 0,
      server: [Circular *1],
      name: '/live_datetime',
      adapter: [Adapter],
      [Symbol(kCapture)]: false
    }
  },
  parentNsps: Map(0) {},
  parentNamespacesFromRegExp: Map(0) {},
  _path: '/socket.io',
  clientPathRegex: /^\/socket\.io\/socket\.io(\.msgpack|\.esm)?(\.min)?\.js(\.map)?(?:\?|$)/,
  _connectTimeout: 45000,
  _serveClient: true,
  _parser: {
    protocol: 5,
    PacketType: {
      '0': 'CONNECT',
      '1': 'DISCONNECT',
      '2': 'EVENT',
      '3': 'ACK',
      '4': 'CONNECT_ERROR',
      '5': 'BINARY_EVENT',
      '6': 'BINARY_ACK',
      CONNECT: 0,
      DISCONNECT: 1,
      EVENT: 2,
      ACK: 3,
      CONNECT_ERROR: 4,
      BINARY_EVENT: 5,
      BINARY_ACK: 6
    },
    Encoder: [class Encoder],
    Decoder: [class Decoder extends Emitter]
  },
  encoder: Encoder { replacer: undefined },
  opts: {
    cors: { origin: '*', methods: [Array] },
    cleanupEmptyChildNamespaces: false
  },
  _adapter: [class Adapter extends EventEmitter],
  sockets: <ref *2> Namespace {
    _events: [Object: null prototype] { connection: [Function (anonymous)] },
    _eventsCount: 1,
    _maxListeners: undefined,
    sockets: Map(1) { 'HHiUGEud_BOEdLNDAAAB' => [Socket] },
    _fns: [],
    _ids: 0,
    server: [Circular *1],
    name: '/',
    adapter: Adapter {
      _events: [Object: null prototype] {},
      _eventsCount: 0,
      _maxListeners: undefined,
      nsp: [Circular *2],
      rooms: [Map],
      sids: [Map],
      encoder: [Encoder],
      [Symbol(kCapture)]: false
    },
    [Symbol(kCapture)]: false
  },
  eio: Server {
    _events: [Object: null prototype] {
      connection: [Function: bound onconnection]
    },
    _eventsCount: 1,
    _maxListeners: undefined,
    middlewares: [ [Function: corsMiddleware] ],
    clients: { 'vYlNwJ6YfTWW-w8PAAAA': [Socket] },
    clientsCount: 1,
    opts: {
      wsEngine: [class WebSocketServer extends EventEmitter],
      pingTimeout: 20000,
      pingInterval: 25000,
      upgradeTimeout: 10000,
      maxHttpBufferSize: 1000000,
      transports: [Array],
      allowUpgrades: true,
      httpCompression: [Object],
      cors: [Object],
      allowEIO3: false,
      cleanupEmptyChildNamespaces: false,
      path: '/socket.io'
    },
    ws: WebSocketServer {
      _events: [Object: null prototype],
      _eventsCount: 1,
      _maxListeners: undefined,
      options: [Object],
      _state: 0,
      [Symbol(kCapture)]: false
    },
    [Symbol(kCapture)]: false
  },
  httpServer: <ref *3> Server {
    maxHeaderSize: undefined,
    insecureHTTPParser: undefined,
    requestTimeout: 300000,
    headersTimeout: 60000,
    keepAliveTimeout: 5000,
    connectionsCheckingInterval: 30000,
    joinDuplicateHeaders: undefined,
    rejectNonStandardBodyWrites: false,
    _events: [Object: null prototype] {
      connection: [Function: connectionListener],
      listening: [Array],
      close: [Function: bound close],
      upgrade: [Function (anonymous)],
      request: [Function (anonymous)]
    },
    _eventsCount: 5,
    _maxListeners: undefined,
    _connections: 1,
    _handle: TCP {
      reading: false,
      onconnection: [Function: onconnection],
      [Symbol(owner_symbol)]: [Circular *3]
    },
    _usingWorkers: false,
    _workers: [],
    _unref: false,
    allowHalfOpen: true,
    pauseOnConnect: false,
    noDelay: true,
    keepAlive: false,
    keepAliveInitialDelay: 0,
    highWaterMark: 16384,
    httpAllowHalfOpen: false,
    timeout: 0,
    maxHeadersCount: null,
    maxRequestsPerSocket: 0,
    _connectionKey: '6::::6834',
    [Symbol(IncomingMessage)]: [Function: IncomingMessage],
    [Symbol(ServerResponse)]: [Function: ServerResponse],
    [Symbol(kCapture)]: false,
    [Symbol(async_id_symbol)]: 17,
    [Symbol(kUniqueHeaders)]: null,
    [Symbol(http.server.connections)]: ConnectionsList {},
    [Symbol(http.server.connectionsCheckingInterval)]: Timeout {
      _idleTimeout: 30000,
      _idlePrev: [TimersList],
      _idleNext: [TimersList],
      _idleStart: 1308,
      _onTimeout: [Function: bound checkConnections],
      _timerArgs: undefined,
      _repeat: 30000,
      _destroyed: false,
      [Symbol(refed)]: false,
      [Symbol(kHasPrimitive)]: false,
      [Symbol(asyncId)]: 19,
      [Symbol(triggerId)]: 18
    }
  },
  engine: Server {
    _events: [Object: null prototype] {
      connection: [Function: bound onconnection]
    },
    _eventsCount: 1,
    _maxListeners: undefined,
    middlewares: [ [Function: corsMiddleware] ],
    clients: { 'vYlNwJ6YfTWW-w8PAAAA': [Socket] },
    clientsCount: 1,
    opts: {
      wsEngine: [class WebSocketServer extends EventEmitter],
      pingTimeout: 20000,
      pingInterval: 25000,
      upgradeTimeout: 10000,
      maxHttpBufferSize: 1000000,
      transports: [Array],
      allowUpgrades: true,
      httpCompression: [Object],
      cors: [Object],
      allowEIO3: false,
      cleanupEmptyChildNamespaces: false,
      path: '/socket.io'
    },
    ws: WebSocketServer {
      _events: [Object: null prototype],
      _eventsCount: 1,
      _maxListeners: undefined,
      options: [Object],
      _state: 0,
      [Symbol(kCapture)]: false
    },
    [Symbol(kCapture)]: false
  },
  _corsMiddleware: [Function: corsMiddleware],
  [Symbol(kCapture)]: false
}
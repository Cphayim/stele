"use strict";

var _apolloServer = require("apollo-server");

var _utils = require("./utils");

var _schema = _interopRequireDefault(require("./schema"));

var _resolvers = _interopRequireDefault(require("./resolvers"));

var _launch = _interopRequireDefault(require("./datasources/launch"));

var _user = _interopRequireDefault(require("./datasources/user"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const store = (0, _utils.createStore)();
const server = new _apolloServer.ApolloServer({
  typeDefs: _schema.default,
  resolvers: _resolvers.default,
  dataSources: () => ({
    launchAPI: new _launch.default(),
    userAPI: new _user.default({
      store
    })
  })
});
server.listen().then(({
  url
}) => {
  console.log(`🚀 Server ready at ${url}`);
});
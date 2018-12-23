import express from 'express';
import { ApolloServer } from 'apollo-server-express';

import typeDefs from './api/schema';
import resolvers from './api/resolvers';

const app = express();
const PORT = 4000;
const server = new ApolloServer({ typeDefs, resolvers });

server.applyMiddleware({ app, path: '/graphql' });

app.listen(PORT, () =>
  console.log(`🚀 Server ready at http://localhost:${PORT}${server.graphqlPath}`)
);

import React from 'react';
import ReactDOM from 'react-dom';
import { Query, ApolloProvider } from 'react-apollo';
import gql from 'graphql-tag';

import { ApolloClient } from 'apollo-client';
import { HttpLink } from 'apollo-link-http';
import { InMemoryCache } from 'apollo-cache-inmemory';

import injectStyles from './styles';
import Pages from './pages';
import Login from './pages/login';
import { resolvers } from './resolvers';

const client = new ApolloClient({
  cache: new InMemoryCache(),
  link: new HttpLink({
    uri: 'http://localhost:4000',
    headers: {
      authorization: localStorage.getItem('token')
    }
  }),
  // initializers将在ApolloClient创建后立即调用。如果重置商店，它们也会运行
  initializers: {
    isLoggedIn: () => !!localStorage.getItem('token'),
    cartItems: () => []
  },
  resolvers
});

const IS_LOGGED_IN = gql`
  query IsUserLoggedIn {
    isLoggedIn @client
  }
`;

injectStyles();
ReactDOM.render(
  <ApolloProvider client={client}>
    <Query query={IS_LOGGED_IN}>
      {({ data }) => {
        // console.log('data.isLoggedIn: ', data.isLoggedIn);
        return data.isLoggedIn ? <Pages /> : <Login />;
      }}
    </Query>
  </ApolloProvider>,
  document.getElementById('root')
);

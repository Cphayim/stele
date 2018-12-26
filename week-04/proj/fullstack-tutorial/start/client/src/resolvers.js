import gql from 'graphql-tag';
import { GET_CART_ITEMS } from './pages/cart';

export const typeDefs = gql`
  # extend 用于扩展 服务器 schema 的类型
  extend type Query {
    isLoggedIn: Boolean!
    cartItems: [ID]!
  }

  extend type Launch {
    isInCart: Boolean!
  }

  extend type Mutation {
    addOrRemoveFromCart(id: ID!): [Launch]
  }
`;

export const resolvers = {
  Launch: {
    isInCart: (launch, _, { cache }) => {
      const { cartItems } = cache.readQuery({ query: GET_CART_ITEMS });
      console.log('cartItems: ', cartItems);
      console.log('launch.id: ', launch.id);
      console.log(cartItems.includes(launch.id));

      return cartItems.includes(launch.id);
    }
  },
  Mutation: {
    addOrRemoveFromCart: (_, { id }, { cache }) => {
      const { cartItems } = cache.readQuery({ query: GET_CART_ITEMS });
      const data = {
        cartItems: cartItems.includes(id) ? cartItems.filter(i => i !== id) : [...cartItems, id]
      };
      cache.writeQuery({ query: GET_CART_ITEMS, data });
      return data.cartItems;
    }
  }
};

import { ApolloServer } from 'apollo-server';
import isEmail from 'isemail';

import { createStore } from './utils';
import typeDefs from './schema';
import resolvers from './resolvers';
import LaunchAPI from './datasources/launch';
import UserAPI from './datasources/user';

const store = createStore();
const server = new ApolloServer({
  typeDefs,
  resolvers,
  dataSources: () => ({
    launchAPI: new LaunchAPI(),
    userAPI: new UserAPI({ store })
  }),
  context: async ({ req }) => {
    // 对每个请求进行简单的身份验证
    const auth = (req.headers && req.headers.authorization) || '';
    const email = Buffer.from(auth, 'base64').toString('ascii');

    // 如果 email 不是一个有效值，则返回 user -> null
    if (!isEmail.validate(email)) return { user: null };
    // 通过 email 找到或创建用户
    const users = await store.users.findOrCreate({ where: { email } });
    const user = users && users[0] ? users[0] : null;

    return { user: { ...user.dataValues } };
  }
});

server.listen().then(({ url }) => {
  console.log(`🚀 Server ready at ${url}`);
});

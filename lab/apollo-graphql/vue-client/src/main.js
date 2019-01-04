import Vue from 'vue';
import ApolloClient from 'apollo-boost';
import VueApollo from 'vue-apollo';

import App from './App.vue';

Vue.config.productionTip = false;
Vue.use(VueApollo);

const apolloClient = new ApolloClient({
  uri: 'http://localhost:4000/graphql',
  connectToDevTools: false
});
const apolloProvider = new VueApollo({
  defaultClient: apolloClient
});

new Vue({
  render: h => h(App),
  apolloProvider
}).$mount('#app');

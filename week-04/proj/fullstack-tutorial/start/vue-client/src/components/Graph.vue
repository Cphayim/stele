<template>
  <div>
    <p>Loading Number: {{$apolloData.loading}}</p>
    <!-- <img alt="Vue logo" src="./assets/logo.png"> -->
    <!-- <HelloWorld msg="Welcome to Your Vue.js App"/> -->
    <ul v-if="launches">
      <li
        v-for="(launch, index) of launches.launches"
        :key="launch.id"
      >{{ index }} - {{launch.id}} - {{launch.site}}</li>
    </ul>
    <hr>
    <div>
      <input type="text" v-model="searchId" @keydown.enter="search">
    </div>
  </div>
</template>

<script>
import { gql } from "apollo-boost";
// import HelloWorld from "./components/HelloWorld.vue";

export default {
  name: "graph",
  props: {
    after: {
      type: String
    }
  },
  apollo: {
    // 直接传入对象
    // launches: {
    //   query: gql`
    //     query GetLaunchesList($after: String) {
    //       launches(after: $after) {
    //         cursor
    //         hasMore
    //         launches {
    //           id
    //           site
    //         }
    //       }
    //     }
    //   `,
    //   variables: {
    //     after: this.after
    //   },
    //   fetchPolicy: "cache-and-network"
    // }
    // 传入一个函数，将在创建组件时被调用一次
    launches() {
      return {
        // gql 查询
        // query: gql`
        //   query GetLaunchesList($after: String) {
        //     launches(after: $after) {
        //       cursor
        //       hasMore
        //       launches {
        //         id
        //         site
        //       }
        //     }
        //   }
        // `,
        query: require('@/graphql/launches.graphql'),
        // 静态参数
        variables: {
          after: this.after
        },
        // fetchPolicy: "cache-and-network"
        update: data => {
          return data.launches;
        }
        // 轮询
        // pollInterval: 3000
      };
    },
    launch() {
      return {
        query: gql`
          query GetLaunchById($id: ID!) {
            launch(id: $id) {
              id
              site
              rocket {
                name
              }
            }
          }
        `,
        variables() {
          // console.log(this.searchId);
          return { id: this.searchId };
        },
        // throttle: 300
        debounce: 300,
        skip() {
          return !this.searchId;
        }
      };
    }
  },
  data() {
    return {
      searchId: ""
    };
  },
  components: {
    // HelloWorld
  },
  computed: {
    a: () => 123
  },
  methods: {
    search() {
      this.$apollo.queries.launch.refetch({
        id: this.searchId
      });
    }
  },
  mounted() {
    // eslint-disable-next-line
    // console.log(this.$apollo.queries);
    // eslint-disable-next-line
    // console.log(this.after);
  }
};
</script>

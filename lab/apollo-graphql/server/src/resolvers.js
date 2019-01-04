import { paginateResults } from './utils';

export default {
  Query: {
    launches: async (_, { pageSize = 20, after }, { dataSources }) => {
      const allLaunches = await dataSources.launchAPI.getAllLaunches();
      // 我们希望按照时间倒序排列
      allLaunches.reverse();

      const launches = paginateResults({
        after,
        pageSize,
        results: allLaunches
      });
      return {
        launches,
        cursor: launches.length ? launches[launches.length - 1].cursor : null,
        // 如果分页后的数据中最后一条数据的 cursor 与所有数据中的最后一条数据的 cursor 相同
        // 那么说明没有更多数据了
        hasMore: launches.length
          ? launches[launches.length - 1].cursor !== allLaunches[allLaunches.length - 1].cursor
          : false
      };
    },
    launch: async (_, { id }, { dataSources }) => {
      return dataSources.launchAPI.getLaunchById({ launchId: id });
    },
    me: async (_, __, { dataSources }) => {
      return dataSources.userAPI.findOrCreateUser();
    }
  },

  Mutation: {
    // 登录
    login: async (_, { email }, { dataSources }) => {
      /**
       * 通过 email 找到或创建一个用户并返回令牌
       */
      const user = await dataSources.userAPI.findOrCreateUser({ email });
      if (user) return Buffer.from(email).toString('base64');
    },
    // 预定行程
    bookTrips: async (_, { launchIds }, { dataSources }) => {
      const results = await dataSources.userAPI.bookTrips({ launchIds });
      const launches = await dataSources.launchAPI.getLaunchesByIds({ launchIds });

      const success = results && results.length === launchIds.length;
      return {
        success,
        message: success
          ? '行程预定成功！'
          : `无法预定以下行程: ${launchIds.filter(id => !results.includes(id))}`,
        launches
      };
    },
    // 取消行程
    cancelTrip: async (_, { launchId }, { dataSources }) => {
      const result = dataSources.userAPI.cancelTrip({ launchId });
      if (!result) {
        return {
          success: false,
          message: '取消行程失败！'
        };
      }
      const launch = await dataSources.launchAPI.getLaunchById({ launchId });
      return {
        success: true,
        message: '行程已取消！',
        launches: [launch]
      };
    }
  },

  Mission: {
    // 当没有指定 size 时确保默认是 'large'
    missionPatch: (mission, { size } = { size: 'LARGE' }) => {
      return size === 'SMALL' ? mission.missionPatchSmall : mission.missionPatchLarge;
    }
  },
  Launch: {
    isBooked: async (launch, _, { dataSources }) => {
      return dataSources.userAPI.isBookedOnLaunch({ launchId: launch.id });
    }
  },
  User: {
    trips: async (_, __, { dataSources }) => {
      // 获取当前用户的所有 launchId
      const launchIds = await dataSources.userAPI.getLaunchIdsByUser();

      if (!launchIds.length) return [];

      // 通过 launchIds 找到所有对应的 launch
      return (
        dataSources.launchAPI.getLaunchesByIds({
          launchIds
        }) || []
      );
    }
  }
};

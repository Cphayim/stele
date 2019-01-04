"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _utils = require("./utils");

var _default = {
  Query: {
    launches: async (_, {
      pageSize = 20,
      after
    }, {
      dataSources
    }) => {
      const allLaunches = await dataSources.launchAPI.getAllLaunches(); // we want these in reverse chronological order

      allLaunches.reverse();
      const launches = (0, _utils.paginateResults)({
        after,
        pageSize,
        results: allLaunches
      });
      return {
        launches,
        cursor: launches.length ? launches[launches.length - 1].cursor : null,
        // if the cursor of the end of the paginated results is the same as the
        // last item in _all_ results, then there are no more results after this
        hasMore: launches.length ? launches[launches.length - 1].cursor !== allLaunches[allLaunches.length - 1].cursor : false
      };
    },
    launch: async (_, {
      id
    }, {
      dataSources
    }) => {
      return dataSources.launchAPI.getLaunchById({
        launchId: id
      });
    },
    me: async (_, __, {
      dataSources
    }) => {
      return dataSources.userAPI.findOrCreateUser();
    }
  }
};
exports.default = _default;
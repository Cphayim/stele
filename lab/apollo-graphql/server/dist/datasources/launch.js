"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;

var _apolloDatasourceRest = require("apollo-datasource-rest");

class LaunchAPI extends _apolloDatasourceRest.RESTDataSource {
  constructor() {
    super();
    this.baseURL = 'https://api.spacexdata.com/v2/';
  }

  async getAllLaunches() {
    const res = await this.get('launches');
    return res && res.length ? res.map(l => this.launchReducer(l)) : [];
  }

  async getLaunchById({
    launchId
  }) {
    const res = await this.get('launches', {
      flight_number: launchId
    });
    return res[0] ? this.launchReducer(res[0]) : null;
  }

  async getLaunchesByIds({
    launchIds
  }) {
    return Promise.all(launchIds.map(launchId => this.getLaunchById({
      launchId
    })));
  }
  /**
   * Launch 数据转换
   * @param {*} launch
   */


  launchReducer(launch) {
    return {
      id: launch.flight_number || 0,
      cursor: `${launch.launch_date_unix}`,
      site: launch.launch_site && launch.launch_site.site_name,
      mission: {
        name: launch.mission_name,
        missionPatchSmall: launch.links.mission_patch_small,
        missionPatchLarge: launch.links.mission_patch
      },
      rocket: {
        id: launch.rocket.rocket_id,
        name: launch.rocket.rocket_name,
        type: launch.rocket.rocket_type
      }
    };
  }

}

exports.default = LaunchAPI;
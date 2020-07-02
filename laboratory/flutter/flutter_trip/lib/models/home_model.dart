/*
 * @Author: Cphayim
 * @Date: 2020-06-29 16:51:31
 * @LastEditTime: 2020-06-30 10:56:54
 * @Description:
 */
import 'package:flutter_trip/models/common_model.dart';
import 'package:flutter_trip/models/config_model.dart';
import 'package:flutter_trip/models/grid_nav_model.dart';
import 'package:flutter_trip/models/sales_box_model.dart';

class HomeModel {
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final GridNavModel gridNav;
  final List<CommonModel> subNavList;
  final SalesBoxModel salesBox;

  HomeModel({
    this.config,
    this.bannerList,
    this.localNavList,
    this.gridNav,
    this.subNavList,
    this.salesBox,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    var bannerListJson = json['bannerList'] as List;
    List<CommonModel> bannerList =
        bannerListJson.map((x) => CommonModel.fromJson(x)).toList();

    var localNavListJson = json['localNavList'] as List;
    List<CommonModel> localNavList =
        localNavListJson.map((x) => CommonModel.fromJson(x)).toList();

    var subNavListJson = json['subNavList'] as List;
    List<CommonModel> subNavList =
        subNavListJson.map((x) => CommonModel.fromJson(x)).toList();

    return HomeModel(
      config: ConfigModel.fromJson(json['config']),
      bannerList: bannerList,
      localNavList: localNavList,
      gridNav: GridNavModel.fromJson(json['gridNav']),
      subNavList: subNavList,
      salesBox: SalesBoxModel.fromJson(json['salesBox']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'config': config.toJson(),
      'bannerList': bannerList.map((x) => x.toJson()).toList(),
      'localNavList': localNavList.map((x) => x.toJson()).toList(),
      'gridNav': gridNav.toJson(),
      'subNavList': subNavList.map((x) => x.toJson()).toList(),
      'salesBox': salesBox.toJson(),
    };
  }
}

/*
 * @Author: Cphayim
 * @Date: 2020-06-29 16:52:24
 * @LastEditTime: 2020-06-30 10:45:26
 * @Description:
 */
class ConfigModel {
  final String searchUrl;

  ConfigModel({this.searchUrl});

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(searchUrl: json['searchUrl']);
  }

  Map<String, dynamic> toJson() {
    return {'searchUrl': searchUrl};
  }
}

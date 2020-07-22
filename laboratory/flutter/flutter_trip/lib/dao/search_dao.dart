/*
 * @Author: Cphayim
 * @Date: 2020-07-10 01:07:38
 * @LastEditTime: 2020-07-10 15:20:57
 * @Description: 搜索 DAO
 */
import 'dart:convert';

import 'package:flutter_trip/models/search_model.dart';
import 'package:http/http.dart' as http;

const SEARCH_URL =
    "https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=";

class SearchDao {
  static Future<SearchModel> fetch(String keyword) async {
    final response = await http.get(SEARCH_URL + keyword);
    if (response.statusCode == 200) {
      // fix 中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      Map<String, dynamic> result =
          json.decode(utf8decoder.convert(response.bodyBytes));
      SearchModel model = SearchModel.fromJson(result);
      // 因为多个请求中，可能较早的请求较晚响应，
      // 所以需要在外面判断外面当前输入框 keyword 和本次请求的 keyword 一致时才渲染
      model.keyword = keyword;
      return model;
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}

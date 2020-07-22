/*
 * @Author: Cphayim
 * @Date: 2020-06-30 10:00:52
 * @LastEditTime: 2020-07-10 01:07:59
 * @Description: 首页 DAO
 */

import 'dart:convert';

import 'package:flutter_trip/models/home_model.dart';
import 'package:http/http.dart' as http;

const HOME_URL = 'http://www.devio.org/io/flutter_app/json/home_page.json';

class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(HOME_URL);
    if (response.statusCode == 200) {
      // fix 中文乱码
      Utf8Decoder utf8decoder = Utf8Decoder();
      Map<String, dynamic> result =
          json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      throw Exception('Failed to load home_page.json');
    }
  }
}

/*
 * @Author: Cphayim
 * @Date: 2020-06-05 15:06:03
 * @LastEditTime: 2020-06-10 16:45:23
 * @Description:
 */
import 'package:dio/dio.dart';
import 'package:flutter_shop/model/res_body.dart';
import 'package:flutter_shop/services/my_dio.dart';

class HomeAPI {
  static Future<Map> getHomePageContent() async {
    try {
      Response response = await myDio.get('/home');
      ResBody res = response.data;
      return res.data;
    } catch (e) {
      return null;
    }
  }
}

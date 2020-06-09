/*
 * @Author: Cphayim
 * @Date: 2020-06-05 15:06:03
 * @LastEditTime: 2020-06-09 16:49:42
 * @Description:
 */
import 'package:dio/dio.dart';
import 'package:flutter_shop/model/res_body.dart';
import 'package:flutter_shop/model/user.dart';
import 'package:flutter_shop/services/my_dio.dart';

Future<List<User>> getHomePageContent() async {
  try {
    Response response = await myDio.get('/home');
    ResBody res = response.data;
    List<User> users =
        (res.data as List).map((item) => User.fromMap(item)).toList();
    return users;
  } catch (e) {
    return [];
  }
}

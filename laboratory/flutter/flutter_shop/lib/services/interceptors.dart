/*
 * @Author: Cphayim
 * @Date: 2020-06-05 17:07:08
 * @LastEditTime: 2020-06-09 17:25:32
 * @Description:
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/res_body.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Response Body 转换拦截器
class ResponseInterceptor extends Interceptor {
  @override
  Future onResponse(Response response) async {
    print('进了转换拦截器');
    ResBody resBody = ResBody.fromMap(response.data);
    if (resBody.code != 0) {
      throw DioError(
        request: response.request,
        response: response,
        type: DioErrorType.RESPONSE,
      );
    }
  }
}


class ExceptionInterceptor extends Interceptor {}

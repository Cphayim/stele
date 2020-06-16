/*
 * @Author: Cphayim
 * @Date: 2020-06-05 17:07:08
 * @LastEditTime: 2020-06-10 15:48:03
 * @Description:
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/model/res_body.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 响应体转换拦截器
class ResponseInterceptor extends Interceptor {
  @override
  Future onResponse(Response response) async {
    print('进了转换拦截器');
    ResBody resBody = ResBody.fromMap(response.data);
    response.data = resBody;
    if (resBody.code != 0) {
      throw DioError(
        request: response.request,
        response: response,
        type: DioErrorType.RESPONSE,
      );
    }
    return response;
  }
}

/// 异常处理拦截器
class ExceptionInterceptor extends Interceptor {
  static const timeoutTip = '请求超时，检查网络';
  static const cancelTip = '请求已被取消';
  static const unknownTip = '未知错误，请求异常';
  static const unauthorizationTip = '登录态过期，请重新登录';

  @override
  Future onError(DioError err) {
    patch(err);
    return super.onError(err);
  }

  void patch(DioError err) {
    switch (err.type) {
      case DioErrorType.CONNECT_TIMEOUT:
      case DioErrorType.SEND_TIMEOUT:
      case DioErrorType.RECEIVE_TIMEOUT:
        toast(timeoutTip);
        break;
      case DioErrorType.RESPONSE:
        handleResponseException(err);
        break;
      case DioErrorType.CANCEL:
        toast(cancelTip);
        break;
      case DioErrorType.DEFAULT:
        toast(unknownTip);
        break;
    }
  }

  handleResponseException(DioError err) {
    ResBody resBody = err.response?.data;
    // 响应体为空或结构异常
    if (err.response == null || resBody.code == null) {
      toast(unknownTip);
      return;
    }

    // token 无效或过期
    if (resBody.code == 401) {
      // TODO: 回到登录页面
      toast(unauthorizationTip);
    } else {
      toast(unknownTip);
    }
  }

  void toast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.black38,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

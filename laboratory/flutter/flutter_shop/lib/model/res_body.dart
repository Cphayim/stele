/*
 * @Author: Cphayim
 * @Date: 2020-06-05 16:22:14
 * @LastEditTime: 2020-06-05 16:27:22
 * @Description:
 */
import 'dart:convert';

class ResBody {
  ResBody({
    this.code,
    this.msg,
    this.data,
  });

  int code;
  String msg;
  dynamic data;

  ResBody copyWith({
    int code,
    String msg,
    dynamic data,
  }) =>
      ResBody(
        code: code ?? this.code,
        msg: msg ?? this.msg,
        data: data ?? this.data,
      );

  factory ResBody.fromJson(String str) => ResBody.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResBody.fromMap(Map<String, dynamic> json) => ResBody(
      code: json["code"] == null ? null : json["code"],
      msg: json["msg"] == null ? null : json["msg"],
      data: json["data"] == null ? null : json["data"]);

  Map<String, dynamic> toMap() => {
        "code": code == null ? null : code,
        "msg": msg == null ? null : msg,
        "data": data == null ? null : data,
      };
}

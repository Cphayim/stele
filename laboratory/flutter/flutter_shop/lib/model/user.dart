/*
 * @Author: Cphayim
 * @Date: 2020-06-05 17:14:46
 * @LastEditTime: 2020-06-05 17:14:46
 * @Description:
 */
import 'dart:convert';

class User {
  User({
    this.name,
    this.age,
  });

  String name;
  int age;

  User copyWith({
    String name,
    int age,
  }) =>
      User(
        name: name ?? this.name,
        age: age ?? this.age,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "age": age == null ? null : age,
      };
}

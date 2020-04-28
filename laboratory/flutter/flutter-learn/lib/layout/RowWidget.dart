/*
 * @Author: Cphayim
 * @Date: 2020-04-24 16:42:29
 * @LastEditTime: 2020-04-24 16:50:27
 * @Description: 线性布局
 */
import 'package:flutter/material.dart';

void main() => runApp(RowWidget());

class RowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter布局Widget -- 线性布局")),
        body: Row(
          children: <Widget>[
            Text("Hello Flutter"),
            Image.asset(
              "assets/images/flutter.png",
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}

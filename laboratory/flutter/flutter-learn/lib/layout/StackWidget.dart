/*
 * @Author: Cphayim
 * @Date: 2020-03-31 14:30:27
 * @LastEditTime: 2020-04-26 10:46:23
 * @Description: 层叠布局
 */
import 'package:flutter/material.dart';

void main() => runApp(StackWidget());

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter布局Widget -- 层叠布局")),
        body: Container(
          color: Colors.green,
          width: 300,
          height: 500,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned(
                left: 50,
                bottom: 0,
                child: Image.asset(
                  "assets/images/flutter.png",
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Text('Hello Flutter'),
            ],
          ),
        ),
      ),
    );
  }
}

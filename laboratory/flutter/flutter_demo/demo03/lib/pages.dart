/*
 * @Author: Cphayim
 * @Date: 2020-05-20 16:03:17
 * @LastEditTime: 2020-05-21 10:36:15
 * @Description:
 */

import 'package:demo03/custom_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('First Page', /* style: TextStyle(fontSize: 36) */),
        elevation: 4,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              CustomRoute(SecondPage()),
            );
          },
          child: Icon(
            Icons.navigate_next,
            color: Colors.white,
            size: 64,
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('SecondPage', /* style: TextStyle(fontSize: 36) */),
        backgroundColor: Colors.pinkAccent,
        // centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.navigate_before,
            color: Colors.white,
            size: 64,
          ),
        ),
      ),
    );
  }
}

/*
 * @Author: Cphayim
 * @Date: 2020-06-11 16:47:15
 * @LastEditTime: 2020-06-15 13:49:43
 * @Description:
 */

import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final list = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              child: Container(
                constraints: BoxConstraints(
                  minWidth: double.infinity,
                  minHeight: 100,
                  maxHeight: 300,
                ),
                color: Colors.green,
                child: Text('123'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
 * @Author: Cphayim
 * @Date: 2020-05-22 15:48:43
 * @LastEditTime: 2020-05-22 15:55:40
 * @Description:
 */
import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
      ),
      body: Center(
        child: ExpansionTile(
          title: Text('ExpansionTile'),
          leading: Icon(Icons.ac_unit),
          backgroundColor: Colors.white12,
          children: <Widget>[
             ListTile(
               title: Text('First'),
               subtitle: Text('content'),
             ),
             ListTile(
               title: Text('Second'),
               subtitle: Text('content'),
             ),
          ],
        ),
      ),
    );
  }
}

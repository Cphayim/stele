/*
 * @Author: Cphayim
 * @Date: 2020-05-20 14:51:56
 * @LastEditTime: 2020-05-20 15:45:33
 * @Description:
 */

import 'package:flutter/material.dart';
import 'each_view.dart';

class BottomAppBarDemo extends StatefulWidget {
  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  List<Widget> _eachView = [];
  int _curIndex = 0;

  @override
  void initState() {
    _eachView..add(EachView('Home'))..add(EachView('Airport'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _eachView[_curIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return EachView('New Page');
              },
            ),
          );
        },
        tooltip: 'Cphayim',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _curIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.airport_shuttle,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _curIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

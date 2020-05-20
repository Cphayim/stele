/*
 * @Author: Cphayim
 * @Date: 2020-05-20 14:14:55
 * @LastEditTime: 2020-05-20 14:42:29
 * @Description:
 */

import 'package:demo01/pages/airplay_screen.dart';
import 'package:demo01/pages/email_screen.dart';
import 'package:demo01/pages/home_screen.dart';
import 'package:demo01/pages/pages_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final Color _bottomNavigationColor = Colors.blue;
  int _curIndex = 0;
  List<Widget> list = [];

  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_curIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _curIndex,
        onTap: (int index) {
          setState(() {
            _curIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor,
            ),
            title: Text(
              'Home',
              style: TextStyle(color: _bottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _bottomNavigationColor,
            ),
            title: Text(
              'Email',
              style: TextStyle(color: _bottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _bottomNavigationColor,
            ),
            title: Text(
              'Pages',
              style: TextStyle(color: _bottomNavigationColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _bottomNavigationColor,
            ),
            title: Text(
              'Airplay',
              style: TextStyle(color: _bottomNavigationColor),
            ),
          ),
        ],
        // type: BottomNavigationBarType.shifting,
      ),
    );
  }
}

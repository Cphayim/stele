/*
 * @Author: Cphayim
 * @Date: 2020-05-21 16:33:23
 * @LastEditTime: 2020-05-21 16:47:28
 * @Description:
 */

import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> /* with AutomaticKeepAliveClientMixin */ {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '$_count',
            style: Theme.of(context).textTheme.display1,
          ),
          FloatingActionButton(
            onPressed: _increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      _count++;
    });
  }

  // @override
  // bool get wantKeepAlive => true;
}

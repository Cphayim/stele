/*
 * @Author: Cphayim
 * @Date: 2020-05-22 15:22:03
 * @LastEditTime: 2020-05-22 15:39:47
 * @Description:
 */
import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  @override
  _WrapDemoState createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {
  List<Widget> list;

  @override
  void initState() {
    super.initState();
    list = []..add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('WrapDemo'),
      ),
      body: Opacity(
        opacity: 0.8,
        child: Container(
          width: width,
          height: height / 2,
          color: Colors.grey,
          child: Wrap(
            children: list,
            spacing: 25.0,
          ),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (list.length >= 9) {
            list.removeLast();
          }
          list.insert(list.length - 1, buildPhoto());
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80,
          height: 80,
          color: Colors.black54,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 80,
        height: 80,
        color: Colors.amber,
        child: Center(
          child: Text('照片'),
        ),
      ),
    );
  }
}

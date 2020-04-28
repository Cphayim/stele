import 'package:flutter/material.dart';

void main() => runApp(PopupMenuButtonWidget());

enum MenuItem { menuA, menuB, menuC, menuD }

class PopupMenuButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text("Flutter UI基础Widget -- 按钮")),
          body: PopupMenuButton<MenuItem>(
            child: Text('更多'),
            tooltip: '提示',
            onSelected: (MenuItem result) {
              print('click ' + result.toString());
            },
            onCanceled: () {
              print('cancel');
            },
            // offset: Offset(-50,0),
            // initialValue: MenuItem.menuA,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
              const PopupMenuItem<MenuItem>(
                value: MenuItem.menuA,
                child: Text('menu A'),
              ),
              const PopupMenuItem<MenuItem>(
                value: MenuItem.menuB,
                child: Text('menu B'),
              ),
              const PopupMenuItem<MenuItem>(
                value: MenuItem.menuC,
                child: Text('menu C'),
              ),
              const PopupMenuItem(
                value: MenuItem.menuD,
                child: Text('menu D'),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(ShowAboutDialogWidget());

class ShowAboutDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter UI Widget -- 对话框")),
        body: Builder(
            builder: (BuildContext context) => RaisedButton(
                child: Text('RaisedButton'),
                onPressed: () {
                  showAboutDialog(
                      context: context,
                      applicationIcon: Icon(Icons.android),
                      applicationName: 'Flutter UI Widget -- 对话框',
                      applicationVersion: '1.0.0',
                      applicationLegalese: '我是法律信息',
                      children: [Text('哈哈哈'), Text('哈哈哈')]);
                })),
      ),
    );
  }
}

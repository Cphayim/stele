import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(SnackBarNoBuilderWidget());

class SnackBarNoBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter UI Widget -- SnackBar 及 Builder")),
        body: CenterWidget(),
      ),
    );
  }
}

class CenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: SnackBarWidget(),
    );
  }
}

class SnackBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text('Show SnackBar'),
      onPressed: () {

        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('SnackBar'),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 5),
          action: SnackBarAction(
              label: '确认',
              textColor: Colors.white,
              onPressed: () {
                Scaffold.of(context).hideCurrentSnackBar();
              }),
        ));

      },
    );
  }
}

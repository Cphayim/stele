import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      // home 相当于 '/' 路由
      home: FirstPage(),
      routes: {
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
        '/fourth': (context) => FourthPage(),
      },
      // initialRoute: '/first',
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route -- FirstPage'),
      ),
      body: RaisedButton(
        child: Text('Jump to SecondPage'),
        onPressed: () {
          // 简单路由跳转
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SecondPage(),
          //     settings: RouteSettings(
          //       arguments:
          //           PassArgumnets('Data from FirstPage Navigator.push()'),
          //     ),
          //   ),
          // );

          // 命名路由跳转
          Navigator.pushNamed(
            context,
            '/second',
            arguments: PassArgumnets('Data from FirstPage Navigator.push()'),
          ).then((dynamic passArgumnets) {
            print(passArgumnets.content);
          });
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PassArgumnets passArgumnets =
        ModalRoute.of(context).settings.arguments;
    print(passArgumnets.content);

    return Scaffold(
        appBar: AppBar(
          title: Text('Route -- SecondPage'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.pop(
                    context, PassArgumnets('Return Data from SecondPage'));
              },
            ),
            RaisedButton(
              child: Text('Jump to ThirdPage'),
              onPressed: () {
                // 命名路由跳转
                Navigator.pushNamed(
                  context,
                  '/third',
                  arguments:
                      PassArgumnets('Data from SecondPage Navigator.push()'),
                );
              },
            ),
          ],
        ));
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PassArgumnets passArgumnets =
        ModalRoute.of(context).settings.arguments;
    print(passArgumnets.content);

    return Scaffold(
        appBar: AppBar(
          title: Text('Route -- ThirdPage'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.pop(
                    context, PassArgumnets('Return Data from ThirdPage'));
              },
            ),
            RaisedButton(
              child: Text('Jump to FourthPage'),
              onPressed: () {
                // 命名路由跳转
                Navigator.pushNamed(
                  context,
                  '/fourth',
                  arguments:
                      PassArgumnets('Data from ThirdPage Navigator.push()'),
                );
              },
            ),
          ],
        ));
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PassArgumnets passArgumnets =
        ModalRoute.of(context).settings.arguments;
    print(passArgumnets.content);

    return Scaffold(
        appBar: AppBar(
          title: Text('Route -- FourthPage'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Go back'),
              onPressed: () {
                Navigator.pop(
                    context, PassArgumnets('Return Data from FourthPage'));
              },
            ),
          ],
        ));
  }
}

class PassArgumnets {
  String content;

  PassArgumnets(this.content);
}

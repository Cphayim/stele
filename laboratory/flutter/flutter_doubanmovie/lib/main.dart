import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣电影',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '豆瓣电影'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('热映')),
          BottomNavigationBarItem(
              icon: Icon(Icons.panorama_fish_eye), title: Text('找片')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的')),
        ],
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        onTap: _onNavBarItemTapped,
      ),
    );
  }

  void _onNavBarItemTapped(int index) {
    print(index);
  }
}

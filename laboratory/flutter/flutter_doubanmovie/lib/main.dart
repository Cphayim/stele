import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:flutter_doubanmovie/citys/CitysWidget.dart';
import 'package:flutter_doubanmovie/hot/HotWidget.dart';
import 'package:flutter_doubanmovie/mine/MineWidget.dart';
import 'package:flutter_doubanmovie/movies/MoviesWidget.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

CityModel cityModel = CityModel();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showPerformanceOverlay: true,
      title: '豆瓣电影',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '豆瓣电影'),
      routes: {
        '/citys': (context) => ScopedModel(
              model: cityModel,
              child: ScopedModelDescendant<CityModel>(
                builder: (context, child, model) {
                  return CitysWidget();
                },
              ),
            ),
      },
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
  int _selectedIndex = 0;
  final List<Widget> _widgetItems = [HotWidget(), MoviesWidget(), MineWidget()];

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
    //     .copyWith(statusBarBrightness: Brightness.light));

    return Scaffold(
      // appBar: AppBar(title: Text(widget.title)),
      body: ScopedModel<CityModel>(
        model: cityModel,
        child: SafeArea(child: _widgetItems[_selectedIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('热映')),
          BottomNavigationBarItem(
              icon: Icon(Icons.panorama_fish_eye), title: Text('找片')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        onTap: _onNavBarItemTapped,
      ),
    );
  }

  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class CityModel extends Model {
  String curCity;

  CityModel() {
    initData();
  }

  void initData() async {
    final prefs = await SharedPreferences.getInstance();
    String city = prefs.getString('curCity');

    if (city != null && city.isNotEmpty) {
      setCurCity(city);
    } else {
      setCurCity('深圳');
    }
  }

  void setCurCity(String city) {
    if (city != curCity) {
      curCity = city;
      // 通知状态发生变化
      notifyListeners();
    }
  }

  static CityModel of(BuildContext context) {
    return ScopedModel.of<CityModel>(context);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/main.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_doubanmovie/hot/hotlist/HotMoviesListWidget.dart';

class HotWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotWidgetState();
  }
}

class HotWidgetState extends State<HotWidget> {

  @override
  void initState() {
    super.initState();
    print('HotWidgetState initState');
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CityModel>(
      builder: (context, child, model) {
        // print(model.curCity);
        if (model.curCity != null && model.curCity.isNotEmpty) {
          return buildContent(model);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget buildContent(CityModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // 搜索栏
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: <Widget>[
              GestureDetector(
                child: Text(
                  model.curCity,
                  style: TextStyle(fontSize: 16),
                ),
                // 跳转到城市选择页
                onTap: () {
                  _jumpToCitysWidget(model);
                },
              ),
              Icon(Icons.arrow_drop_down),
              Expanded(
                flex: 1,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    hintText: '\ue8b6 电影 / 电视剧 / 影人',
                    hintStyle: TextStyle(
                      fontFamily: 'MaterialIcons',
                      fontSize: 16,
                    ),
                    contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    filled: true,
                    fillColor: Colors.black12,
                  ),
                ),
              ),
            ],
          ),
        ),
        // 数据
        Expanded(
          flex: 1,
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 50),
                  child: TabBar(
                      unselectedLabelColor: Colors.black38,
                      labelColor: Colors.black87,
                      indicatorColor: Colors.black87,
                      tabs: <Widget>[Tab(text: '正在热映'), Tab(text: '即将上映')]),
                ),
                Expanded(
                  child: Container(
                    child: TabBarView(
                      children: <Widget>[
                        HotMoviesListWidget(),
                        Center(
                          child: Text('即将上映'),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 跳转到城市选择页
  void _jumpToCitysWidget(CityModel model) async {
    var selectCity =
        await Navigator.pushNamed(context, '/citys', arguments: model.curCity);
    if (selectCity == null) return;

    // 把数据存储起来
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('curCity', selectCity);

    model.setCurCity(selectCity);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/main.dart';

class CitysWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CitysWidgetState();
  }
}

class CitysWidgetState extends State<CitysWidget> {
  // 当前城市
  String curCity;

  @override
  Widget build(BuildContext context) {
    // 从路由传参中获取当前城市
    curCity = CityModel.of(context).curCity;

    List<String> hotCitys = [
      '北京',
      '上海',
      '广州',
      '深圳',
      '成都',
      '武汉',
      '杭州',
      '重庆',
      '郑州',
      '南京',
      '西安',
      '苏州',
      '长沙',
      '天津',
      '福州',
    ];

    return Scaffold(
      backgroundColor: Color(0xE3FFFFFF),
      appBar: AppBar(
        title: Text(
          '城市选择',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.green),
        backgroundColor: Colors.white,
        elevation: 1,
        // centerTitle: false,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              constraints: BoxConstraints.expand(height: 50),
              child: TabBar(
                unselectedLabelColor: Colors.black38,
                labelColor: Colors.black87,
                indicatorColor: Colors.green,
                tabs: <Widget>[Tab(text: '国内'), Tab(text: '国外')],
              ),
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  // physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    // 国内
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 50,
                          child: TextField(
                            cursorColor: Colors.green,
                            decoration: InputDecoration(
                              hintText: '输入城市名查询',
                              hintStyle: TextStyle(fontSize: 14),
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black38,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: Text(
                            'GPS定位城市',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                          child: MaterialButton(
                            color: Colors.white,
                            elevation: 0,
                            child: Container(
                              width: 80,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: Colors.green,
                                  ),
                                  Expanded(
                                    flex: 0,
                                    child: Text(
                                      curCity,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5, left: 20),
                          child: Text(
                            '热门城市',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 10),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 3,
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                              ),
                              itemCount: hotCitys.length,
                              itemBuilder: (context, index) {
                                return MaterialButton(
                                  color: Colors.white,
                                  elevation: 0,
                                  child: Text(
                                    hotCitys[index],
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  onPressed: () {
                                    // 返回结果
                                    Navigator.pop(context, hotCitys[index]);
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    // 国外
                    Center(
                      child: Text('国外'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

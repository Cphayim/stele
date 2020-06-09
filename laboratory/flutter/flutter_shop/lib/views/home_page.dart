/*
 * @Author: Cphayim
 * @Date: 2020-06-03 10:47:49
 * @LastEditTime: 2020-06-05 15:58:51
 * @Description:
 */

import 'package:flutter/material.dart';
import 'package:flutter_shop/apis/home.api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = '正在获取数据';

  @override
  void initState() {
    super.initState();
    getHomePageContent().then((data) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('百姓生活+')),
      // body: FutureBuilder(
      //   future: getHomePageContent(),
      //   builder: (BuildContext context, snapshot) {
      //     if(snapshot.hasData) {

      //     }
      //   },
      // ),
      body: Center(child: Text('123')),
    );
  }
}

// 首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network('');
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

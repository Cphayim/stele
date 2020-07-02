/*
 * @Author: Cphayim
 * @Date: 2020-06-22 16:13:19
 * @LastEditTime: 2020-07-02 16:41:27
 * @Description: 首页
 */

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'package:flutter_trip/models/common_model.dart';
import 'package:flutter_trip/models/grid_nav_model.dart';
import 'package:flutter_trip/models/home_model.dart';
import 'package:flutter_trip/widgets/grid_nav.dart';
import 'package:flutter_trip/widgets/local_nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin<HomePage> {
  // appBar 高度
  final double _appBarHeight = 80;
  // 轮播图高度
  final double _swiperHeight = 160;
  // 顶部条透明度
  double _appBarAlpha = 0;

  // 轮播图列表
  List<CommonModel> bannerList = [];
  // 本地导航列表
  List<CommonModel> localNavList = [];
  // 格子导航
  GridNavModel gridNav = null;

  void loadData() async {
    try {
      HomeModel model = await HomeDao.fetch();
      setState(() {
        bannerList = model.bannerList;
        localNavList = model.localNavList;
        gridNav = model.gridNav;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    print('init');
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: Stack(
        children: <Widget>[
          // 注意层级，Stack children 中索引越大的层级越高（可以理解为 z-index）
          _buildPage(),
          _buildTopBar()
        ],
      ),
    );
  }

  // 顶部栏
  Widget _buildTopBar() {
    return Opacity(
      // opacity: 1,
      opacity: _appBarAlpha,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          // color: Color(Colors.white.value).withOpacity(_appBarAlpha),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('首页', style: TextStyle(fontSize: 16.0)),
          ),
        ),
      ),
    );
  }

  // 页面主体
  Widget _buildPage() {
    return MediaQuery.removePadding(
      // 移除刘海屏的顶部预留区
      removeTop: true,
      context: context,
      child: NotificationListener(
        onNotification: (scrollNotification) {
          // 只处理 ScrollUpdateNotification 类型 且 深度为 1 （仅 ListView 事件） 的通知
          if (scrollNotification is ScrollUpdateNotification &&
              scrollNotification.depth == 0) {
            _onScroll(scrollNotification.metrics.pixels);
          }
          return true;
        },
        child: ListView(
          children: <Widget>[
            // 顶部轮播图
            _buildSwiper(),
            // 周边游导航
            Padding(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 4),
              child: LocalNav(localNavList: localNavList),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: GridNav(
                gridNavModel: gridNav,
              ),
            ),
            Container(
              height: 800,
              child: ListTile(
                title: Text('哈哈'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 顶部轮播图
  Widget _buildSwiper() {
    return Container(
      height: _swiperHeight,
      child: Swiper(
        key: UniqueKey(),
        autoplay: true,
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          CommonModel banner = bannerList[index];
          return Image.network(banner.icon, fit: BoxFit.cover);
        },
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            size: 8.0,
            activeSize: 8.0,
            color: Colors.white.withOpacity(0.3),
            activeColor: Colors.white,
          ),
        ),
      ),
    );
  }

  // 当 ListView 滚动时设置 AppBar 透明度
  void _onScroll(double offset) {
    final double threshold = _swiperHeight - _appBarHeight;
    double alpha = offset / threshold;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      _appBarAlpha = alpha;
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

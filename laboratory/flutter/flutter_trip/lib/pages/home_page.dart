/*
 * @Author: Cphayim
 * @Date: 2020-06-22 16:13:19
 * @LastEditTime: 2020-07-22 11:19:18
 * @Description: 首页
 */

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/home_dao.dart';
import 'package:flutter_trip/models/common_model.dart';
import 'package:flutter_trip/models/grid_nav_model.dart';
import 'package:flutter_trip/models/home_model.dart';
import 'package:flutter_trip/models/sales_box_model.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/widgets/grid_nav.dart';
import 'package:flutter_trip/widgets/loading_container.dart';
import 'package:flutter_trip/widgets/local_nav.dart';
import 'package:flutter_trip/widgets/sales_box.dart';
import 'package:flutter_trip/widgets/search_bar.dart';
import 'package:flutter_trip/widgets/sub_nav.dart';
import 'package:flutter_trip/widgets/web_view.dart';

const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  // appBar 高度
  final double _appBarHeight = 80;
  // 轮播图高度
  final double _swiperHeight = 200;
  // 顶部条透明度
  double _appBarAlpha = 0;

  // 轮播图列表
  List<CommonModel> bannerList = [];
  // 本地导航列表
  List<CommonModel> localNavList = [];
  // 格子导航
  GridNavModel gridNavModel;
  // 子导航
  List<CommonModel> subNavList = [];
  // 营销卡片
  SalesBoxModel salesBoxModel;

  bool _loading = true;

  Future<void> loadData() async {
    try {
      HomeModel model = await HomeDao.fetch();
      bannerList = model.bannerList;
      localNavList = model.localNavList;
      gridNavModel = model.gridNav;
      subNavList = model.subNavList;
      salesBoxModel = model.salesBox;
    } catch (e) {
      print(e);
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: LoadingContainer(
        isLoading: _loading,
        child: Stack(
          children: <Widget>[
            // 注意层级，Stack children 中索引越大的层级越高（可以理解为 z-index）
            _buildPage(context),
            _buildTopBar(context),
          ],
        ),
      ),
    );
  }

  // 顶部栏
  Widget _buildTopBar(BuildContext context) {
    double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x88000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.only(
              top: statusBarHeight,
            ),
            height: statusBarHeight + kToolbarHeight,
            decoration:
                BoxDecoration(color: Colors.white.withOpacity(_appBarAlpha)),
            child: SearchBar(
              searchBarType: _appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpTpSpeak,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {},
            ),
          ),
        ),
        // 底部阴影
        Container(
          height: _appBarAlpha > 0.2 ? 0.5 : 0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 0.5, offset: Offset(0, 1))
            ],
          ),
        )
      ],
    );
  }

  // 页面主体
  Widget _buildPage(BuildContext context) {
    return MediaQuery.removePadding(
      // 移除刘海屏的顶部预留区
      removeTop: true,
      context: context,
      child: RefreshIndicator(
        onRefresh: loadData,
        child: NotificationListener(
          onNotification: (scrollNotification) {
            // 只处理 ScrollUpdateNotification 类型 且 深度为 1 （仅 ListView 事件） 的通知
            if (scrollNotification is ScrollUpdateNotification &&
                scrollNotification.depth == 0) {
              _onScroll(scrollNotification.metrics.pixels);
            }
            // 返回 true 事件不再冒泡（类似）
            return false;
          },
          child: _buildListView(context),
        ),
      ),
    );
  }

  // 顶部轮播图
  Widget _buildSwiper(BuildContext context) {
    return Container(
      height: _swiperHeight,
      child: Swiper(
        autoplay: true,
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          CommonModel banner = bannerList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebView(
                    url: banner.url,
                    title: banner.title,
                    hideAppBar: banner.hideAppBar,
                  ),
                ),
              );
            },
            child: Image.network(banner.icon, fit: BoxFit.cover),
          );
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

  /// 列表
  Widget _buildListView(BuildContext context) {
    return ListView(
      children: <Widget>[
        // 顶部轮播图
        _buildSwiper(context),
        // 周边游导航
        Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 4),
          child: LocalNav(localNavList: localNavList),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: GridNav(gridNavModel: gridNavModel),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: SubNav(subNavList: subNavList),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: SalesBox(salesBox: salesBoxModel),
        ),
      ],
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

  _jumpToSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(
          hint: SEARCH_BAR_DEFAULT_TEXT,
        ),
      ),
    );
  }

  _jumpTpSpeak() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(
          hint: SEARCH_BAR_DEFAULT_TEXT,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

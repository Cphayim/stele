/*
 * @Author: Cphayim
 * @Date: 2020-06-22 16:13:19
 * @LastEditTime: 2020-06-28 17:21:53
 * @Description: 首页
 */

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _imageUrls = [
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592825959191&di=391023a8e6ff42dd63cdc221d24fac80&imgtype=0&src=http%3A%2F%2F02imgmini.eastday.com%2Fmobile%2F20181109%2F20181109121713_6c7d66328e9e89f3577e8ef8e35c044b_1.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592825959191&di=391023a8e6ff42dd63cdc221d24fac80&imgtype=0&src=http%3A%2F%2F02imgmini.eastday.com%2Fmobile%2F20181109%2F20181109121713_6c7d66328e9e89f3577e8ef8e35c044b_1.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592825959191&di=391023a8e6ff42dd63cdc221d24fac80&imgtype=0&src=http%3A%2F%2F02imgmini.eastday.com%2Fmobile%2F20181109%2F20181109121713_6c7d66328e9e89f3577e8ef8e35c044b_1.jpeg',
    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1592825959191&di=391023a8e6ff42dd63cdc221d24fac80&imgtype=0&src=http%3A%2F%2F02imgmini.eastday.com%2Fmobile%2F20181109%2F20181109121713_6c7d66328e9e89f3577e8ef8e35c044b_1.jpeg',
  ];

  // appBar 高度
  final double _appBarHeight = 80;
  // 轮播图高度
  final double _swiperHeight = 160;

  double _appBarAlpha = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(child: _buildPage()),
        Positioned(child: _buildTopBar()),
      ],
    );
  }

  Widget _buildTopBar() {
    return Opacity(
      // opacity: 1,
      opacity: _appBarAlpha,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            // color: Color(Colors.white.value).withOpacity(_appBarAlpha),
            ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('首页'),
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
            _buildSwiper(),
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
        autoplay: false,
        itemCount: _imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(_imageUrls[index], fit: BoxFit.cover);
        },
        pagination: SwiperPagination(),
      ),
    );
  }

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
}

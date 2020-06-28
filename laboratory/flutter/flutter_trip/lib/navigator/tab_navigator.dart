/*
 * @Author: Cphayim
 * @Date: 2020-06-22 16:09:47
 * @LastEditTime: 2020-06-28 17:01:46
 * @Description:
 */
import 'package:flutter/material.dart';
import 'package:flutter_trip/pages/home_page.dart';
import 'package:flutter_trip/pages/my_page.dart';
import 'package:flutter_trip/pages/search_page.dart';
import 'package:flutter_trip/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final Color _defaultColor = Colors.grey;
  final Color _activeColor = Colors.blue;

  final PageController _controller = PageController(
    initialPage: 0,
  );

  // 当前 tab 页面索引
  int _currentIndex = 0;

  final List<TabItemData> _tabs = [
    TabItemData(title: '首页', iconData: Icons.home, page: HomePage()),
    TabItemData(title: '搜索', iconData: Icons.search, page: SearchPage()),
    TabItemData(title: '旅拍', iconData: Icons.camera_alt, page: TravelPage()),
    TabItemData(title: '我的', iconData: Icons.person, page: MyPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 页面视图
      body: PageView(
        controller: _controller,
        children: _tabs.map((tabItemData) => tabItemData.page).toList(),
      ),
      // 底部 tab 栏
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        items: _tabs.asMap().keys.map((index) {
          TabItemData tabItemData = _tabs[index];
          return BottomNavigationBarItem(
            icon: Icon(tabItemData.iconData, color: _defaultColor),
            activeIcon: Icon(tabItemData.iconData, color: _activeColor),
            title: Text(
              tabItemData.title,
              style: TextStyle(
                  color: _currentIndex == index ? _activeColor : _defaultColor),
            ),
          );
        }).toList(),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class TabItemData {
  // 图标数据，例如 Icons.home
  final IconData iconData;
  // 标题
  final String title;
  // 页面视图 widget
  final Widget page;

  const TabItemData({this.iconData, this.title, this.page});
}

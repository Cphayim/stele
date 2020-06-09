/*
 * @Author: Cphayim
 * @Date: 2020-06-03 10:37:01
 * @LastEditTime: 2020-06-03 13:49:51
 * @Description:
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/views/cart_page.dart';
import 'package:flutter_shop/views/category_page.dart';
import 'package:flutter_shop/views/home_page.dart';
import 'package:flutter_shop/views/member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> _tabItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('我的'),
    ),
  ];

  final List<Widget> _tabPages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  int _curIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('百姓生活+'),
      // ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      body: _tabPages[_curIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _curIndex,
        items: _tabItems,
        onTap: (int index) {
          setState(() {
            _curIndex = index;
          });
        },
      ),
    );
  }
}

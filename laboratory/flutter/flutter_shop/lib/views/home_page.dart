/*
 * @Author: Cphayim
 * @Date: 2020-06-03 10:47:49
 * @LastEditTime: 2020-06-15 14:36:15
 * @Description:
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/apis/home_api.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    return Scaffold(
      appBar: AppBar(title: Text('百姓生活+')),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: HomeAPI.getHomePageContent(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return _buildLoading();

            List<Map> swiperDataList = (snapshot.data['slides'] as List).cast();
            List<Map> navigatorList =
                (snapshot.data['category'] as List).cast();
            Map adPicture = snapshot.data['advertsPicture'];
            Map leaderInfo = snapshot.data['leaderInfo'];
            List<Map> recommendList =
                (snapshot.data['recommend'] as List).cast();

            return Column(
              children: <Widget>[
                SwiperDiy(
                  swiperDataList: swiperDataList,
                ),
                TopNavigator(
                  navigatorList: navigatorList,
                ),
                AdBanner(adPicture: adPicture),
                LeaderPhone(
                  leaderImage: leaderInfo['leaderImage'],
                  leaderPhoneNumber: leaderInfo['leaderPhone'].toString(),
                ),
                Recommend(
                  recommendList: recommendList,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Text(
        '加载中...',
        style: TextStyle(fontSize: 28.sp),
      ),
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
      height: 333.w,
      width: 750.w,
      child: Swiper(
        // fix: Failed assertion: line 110 pos 12: '_positions.isNotEmpty'
        key: UniqueKey(),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            swiperDataList[index]['image'],
            fit: BoxFit.cover,
          );
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// 顶部导航
class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.w,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        physics: NeverScrollableScrollPhysics(),
        children: navigatorList
            .map(
              (item) => _gridViewItem(context, item),
            )
            .toList(),
      ),
    );
  }

  Widget _gridViewItem(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: 90.w,
            height: 90.w,
          ),
          Text(item['mallCategoryName']),
        ],
      ),
    );
  }
}

// 广告条
class AdBanner extends StatelessWidget {
  final Map adPicture;

  AdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Image.network(
          adPicture['picture_address'] as String,
          fit: BoxFit.cover,
          // width: 750.w,
          height: 140.w,
        ),
        onTap: () {
          print('点击了广告');
        },
      ),
    );
  }
}

// 店长电话
class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhoneNumber;

  LeaderPhone({Key key, this.leaderImage, this.leaderPhoneNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(
          leaderImage,
          // height: 750.w,
        ),
      ),
    );
  }

  void _launchURL() async {
    String url = 'http://baidu.com';
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'url 不能进行访问';
    }
  }
}

// 商品推荐
class Recommend extends StatelessWidget {
  final List recommendList;

  Recommend({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleWidget(),
          _recommedList(),
        ],
      ),
    );
  }

  // 标题
  Widget _titleWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  // 商品项
  Widget _item(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: Column(
          children: <Widget>[
            Image.network(
              recommendList[index]['image'],
              width: 300.w,
              height: 300.w,
            ),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 横向列表
  Widget _recommedList() {
    return Container(
      constraints: BoxConstraints(
        minHeight: 300.w,
        maxHeight: 490.w,
        minWidth: double.infinity,
      ),
      margin: EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (BuildContext context, int index) {
          return _item(index);
        },
      ),
    );
  }
}

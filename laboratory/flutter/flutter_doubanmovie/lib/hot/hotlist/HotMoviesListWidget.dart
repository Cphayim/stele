import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_doubanmovie/hot/hotlist/data/HotMovieData.dart';
import 'package:flutter_doubanmovie/hot/hotlist/item/HotMovieItemWidget.dart';

class HotMoviesListWidget extends StatefulWidget {
  // 当前城市
  final String curCity;

  HotMoviesListWidget(this.curCity);

  @override
  State<StatefulWidget> createState() {
    return HotMoviesListWidgetState();
  }
}

class HotMoviesListWidgetState extends State<HotMoviesListWidget>
    with AutomaticKeepAliveClientMixin {
  // 电影列表
  List<HotMovieData> hotMovies = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    List<HotMovieData> serverDataList = [];
    http.Response response = await http.get(
        'https://api.douban.com/v2/movie/in_theaters?apikey=0b2bdeda43b5688921839c8ecb20399b&city=${widget.curCity}&start=0&count=10');
    //成功获取数据
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      for (Map<String, dynamic> data in responseJson['subjects']) {
        HotMovieData hotMovieData = HotMovieData.fromJson(data);
        serverDataList.add(hotMovieData);
      }
      setState(() {
        hotMovies = serverDataList;
      });
    }
  }

  @override
  void didUpdateWidget(HotMoviesListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 当外部传递的 curCity 更新时刷新页面数据
    print(oldWidget.curCity);
    print(widget.curCity);
    if(oldWidget.curCity == widget.curCity) return;
    setState(() {
      hotMovies = [];
    });
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // 因为 http 请求是异步的，所以这里加一个加载动画
    if (hotMovies == null || hotMovies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return buildList();
    }
  }

  Widget buildList() {
    // 当 ListView 没有和 AppBar 或 SafeArea 一起使用的时候
    // 头部就会有一个 padding，为了去掉 padding ,可以使用 MediaQuery.removePadding
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.separated(
        itemCount: hotMovies.length,
        itemBuilder: (context, index) {
          return HotMovieItemWidget(hotMovies[index]);
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.black26,
          );
        },
      ),
    );
  }

  /*
    在加了刷新界面后，发现 TabBar 每次切换，Widget 都会重新加载，会重新请求数据，
    是因为 DefaultTabController 在切换 Widget 的时候，为了回收内存，
    会将不显示的 Widget 回收掉，但是这个不是我们想见到的，
    我们要切换 Widget 的时候，不会回收不显示的 Widget，
    这就需要让 HotMoviesListWidgetState mixin AutomaticKeepAliveClientMixin
   */
  @override
  bool get wantKeepAlive => true;
}

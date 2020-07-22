/*
 * @Author: Cphayim
 * @Date: 2020-06-22 16:14:27
 * @LastEditTime: 2020-07-22 11:19:10
 * @Description: 搜索
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_trip/dao/search_dao.dart';
import 'package:flutter_trip/models/search_model.dart';
import 'package:flutter_trip/widgets/search_bar.dart';
import 'package:flutter_trip/widgets/web_view.dart';

const TYPES = [
  'channelgroup',
  'cruise',
  'huodong',
  'travelgroup',
  'channelgs',
  'district',
  'shop',
  'channelplane',
  'food',
  'sight',
  'channeltrain',
  'hotel',
  'ticket',
];

class SearchPage extends StatefulWidget {
  final bool hideLeft;
  final String keyword;
  final String hint;

  const SearchPage({Key key, this.hideLeft, this.keyword, this.hint})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel searchModel;
  String keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: <Widget>[
          _buildAppBar(context),
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: searchModel?.data?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return _buildItem(context, index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.only(top: statusBarHeight),
            height: statusBarHeight + kToolbarHeight,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SearchBar(
              searchBarType: SearchBarType.normal,
              hideLeft: widget.hideLeft,
              defaultText: widget.keyword,
              hint: widget.hint,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChange,
            ),
          ),
        ),
      ],
    );
  }

  /// 搜索列表子项
  Widget _buildItem(BuildContext context, int index) {
    if (searchModel == null || searchModel.data == null) return null;
    SearchItem item = searchModel.data[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebView(
            url: item.url,
            title: '详情',
          );
        }));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey)),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Image(
                image: AssetImage(_typeImage(item.type)),
                width: 26,
                height: 26,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: _itemTitle(item),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: _itemSubTitle(item),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemTitle(SearchItem item) {
    if (item == null) return null;
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(item.word, searchModel.keyword));
    spans.add(TextSpan(
      text: ' ${item.disrictname ?? ''} ${item.zonename ?? ''}',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    ));
    return RichText(
        text: TextSpan(children: spans), overflow: TextOverflow.ellipsis);
  }

  Widget _itemSubTitle(SearchItem item) {
    if (item == null) return null;
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: item.price != null ? item.price + ' ' : '',
            style: TextStyle(fontSize: 16, color: Colors.orange)),
        TextSpan(
            text: item.star ?? '',
            style: TextStyle(fontSize: 16, color: Colors.grey)),
      ]),
    );
  }

  /// 输入框 change
  void _onTextChange(String text) {
    keyword = text;
    if (keyword.length == 0) {
      setState(() {
        searchModel = null;
      });
      return;
    }
    SearchDao.fetch(keyword).then((SearchModel model) {
      if (model.keyword != keyword) return;
      setState(() {
        searchModel = model;
      });
    }).catchError((e) {
      print(e);
    });
  }

  _typeImage(String type) {
    if (type == null || !TYPES.contains(type)) {
      return 'assets/images/type_travelgroup.png';
    } else {
      return 'assets/images/type_$type.png';
    }
  }

  _keywordTextSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    if (word == null || word.length == 0) return spans;

    // 'wordwoc'.split('w') -> ['', 'ord', 'oc']
    List<String> arr = word.split(keyword);

    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle = TextStyle(fontSize: 16, color: Colors.orange);

    for (int i = 0; i < arr.length; i++) {
      if (i != 0) {
        spans.add(TextSpan(text: keyword, style: keywordStyle));
      }
      if (arr[i] != null && arr[i].length > 0) {
        spans.add(TextSpan(text: arr[i], style: normalStyle));
      }
    }
    return spans;
  }
}

/*
 * @Author: Cphayim
 * @Date: 2020-06-30 11:01:11
 * @LastEditTime: 2020-07-02 15:52:40
 * @Description: 网格卡片
 */
import 'package:flutter/material.dart';
import 'package:flutter_trip/models/common_model.dart';
import 'package:flutter_trip/models/grid_nav_model.dart';
import 'package:flutter_trip/widgets/web_view.dart';

// 网格卡片
class GridNav extends StatelessWidget {
  final GridNavModel gridNavModel;

  const GridNav({
    Key key,
    @required this.gridNavModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 圆角
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: _gridNavItems(context),
      ),
    );
  }

  List<Widget> _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (gridNavModel == null) return items;
    if (gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel.hotel, true));
    }
    if (gridNavModel.flight != null) {
      items.add(_gridNavItem(context, gridNavModel.flight, false));
    }
    if (gridNavModel.travel != null) {
      items.add(_gridNavItem(context, gridNavModel.travel, false));
    }
    return items;
  }

  Widget _gridNavItem(
      BuildContext context, GridNavItem gridNavItem, bool isFirst) {
    List<Widget> items = [];
    items
      ..add(_mainItem(context, gridNavItem.mainItem))
      ..add(_doubleItem(context, gridNavItem.item1, gridNavItem.item2, true))
      ..add(_doubleItem(context, gridNavItem.item3, gridNavItem.item4, false));

    List<Expanded> expandedList =
        items.map((item) => Expanded(child: item, flex: 1)).toList();

    // 渐变颜色
    Color startColor = Color(int.parse('0xff${gridNavItem.startColor}'));
    Color endColor = Color(int.parse('0xff${gridNavItem.endColor}'));

    return Container(
      height: 88,
      margin: isFirst ? null : EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
        // 线性渐变
        gradient: LinearGradient(colors: [startColor, endColor]),
      ),
      child: Row(
        children: expandedList,
      ),
    );
  }

  /// 左侧主项 mainItem
  Widget _mainItem(BuildContext context, CommonModel model) {
    return _wrapGesture(
      context,
      model,
      Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Image.network(
            model.icon,
            fit: BoxFit.contain,
            height: 88,
            width: 120,
            alignment: AlignmentDirectional.bottomCenter,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              model.title,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  /// 中间和右侧 的一列 item
  Widget _doubleItem(BuildContext context, CommonModel topItem,
      CommonModel bottomItem, bool isCenterItem) {
    return Column(
      children: <Widget>[
        Expanded(child: _item(context, topItem, true, isCenterItem)),
        Expanded(child: _item(context, topItem, false, isCenterItem)),
      ],
    );
  }

  Widget _item(
      BuildContext context, CommonModel item, bool isFirst, bool isCenterItem) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      // 宽度撑满父布局的宽度
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: borderSide,
            // 是当前这列的第一个时设置底部 border
            bottom: isFirst ? borderSide : BorderSide.none,
          ),
        ),
        child: _wrapGesture(
          context,
          item,
          Center(
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  // 包装层，用于处理点击跳转
  Widget _wrapGesture(BuildContext context, CommonModel model, Widget widget) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebView(
              url: model.url,
              statusBarColor: model.statusBarColor,
              title: model.title,
              hideAppBar: model.hideAppBar,
            ),
          ),
        );
      },
      child: widget,
    );
  }
}

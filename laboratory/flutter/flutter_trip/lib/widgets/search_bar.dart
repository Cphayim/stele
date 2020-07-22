/*
 * @Author: Cphayim
 * @Date: 2020-07-03 16:39:40
 * @LastEditTime: 2020-07-22 10:55:25
 * @Description: 搜索条
 */
import 'dart:ui';

import 'package:flutter/material.dart';

enum SearchBarType {
  home, // 首页搜索条
  homeLight, // 首页高亮搜索条
  normal, // 搜索页搜索条
}

class SearchBar extends StatefulWidget {
  // 是否启用搜索条
  final bool enabled;
  // 是否隐藏左侧图标
  final bool hideLeft;
  // 搜索条类型
  final SearchBarType searchBarType;
  // 输入框占位符
  final String hint;
  // 输入框默认文字
  final String defaultText;
  // 左侧按钮点击回调
  final void Function() leftButtonClick;
  // 右侧按钮点击回调
  final void Function() rightButtonClick;
  // 语音按钮点击回调
  final void Function() speakClick;
  // 输入框点击回调
  final void Function() inputBoxClick;
  // 内容变化回调
  final ValueChanged<String> onChanged;

  const SearchBar(
      {Key key,
      this.enabled = true,
      this.hideLeft,
      this.searchBarType = SearchBarType.normal,
      this.hint,
      this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  // 输入框控制器
  final TextEditingController _controller = TextEditingController();
  // 是否显示 clear 按钮
  bool showClear = false;

  @override
  void initState() {
    super.initState();
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _buildNormalSearch(context)
        : _buildHomeSearch(context);
  }

  /// 搜索页搜索条 ( SearchBarType.normal )
  Widget _buildNormalSearch(BuildContext context) {
    return Row(
      children: <Widget>[
        // 左侧返回按钮
        _wrapTap(
          onTap: widget.leftButtonClick,
          child: Container(
            padding: EdgeInsets.fromLTRB(6, 5, 10, 5),
            child: widget.hideLeft ?? false
                ? null
                : Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey,
                    size: 26,
                  ),
          ),
        ),
        // 输入框
        Expanded(flex: 1, child: _inputBox()),
        // 搜索按钮
        _wrapTap(
          onTap: widget.rightButtonClick,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
            child:
                Text('搜索', style: TextStyle(fontSize: 16, color: Colors.blue)),
          ),
        ),
      ],
    );
  }

  /// 首页搜索条 ( SearchBarType.home SearchBarType.homeLight )
  Widget _buildHomeSearch(BuildContext context) {
    return Row(
      children: <Widget>[
        // 左侧返回按钮
        _wrapTap(
          onTap: widget.leftButtonClick,
          child: Container(
            padding: EdgeInsets.fromLTRB(6, 5, 6, 5),
            child: Row(
              children: <Widget>[
                Text(
                  '上海',
                  style: TextStyle(color: _homeFontColor(), fontSize: 14),
                ),
                Icon(Icons.expand_more, size: 22, color: _homeFontColor()),
              ],
            ),
          ),
        ),
        // 输入框
        Expanded(flex: 1, child: _inputBox()),
        // 搜索按钮
        _wrapTap(
          onTap: widget.rightButtonClick,
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
            child: Icon(Icons.comment, size: 26, color: _homeFontColor()),
          ),
        ),
      ],
    );
  }

  /// 输入框
  Widget _inputBox() {
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(0xFFEDEDED);
    }
    return Container(
      height: 34,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(
        color: inputBoxColor,
        borderRadius: BorderRadius.circular(
            widget.searchBarType == SearchBarType.normal ? 5 : 15),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            size: 22,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xFFA9A9A9)
                : Colors.blue,
          ),
          Expanded(
            flex: 1,
            child: widget.searchBarType == SearchBarType.normal
                ? TextField(
                    controller: _controller,
                    onChanged: _onChanged,
                    autofocus: false,
                    // 键盘主题为白色
                    keyboardAppearance: Brightness.light,
                    // 键盘右下角按钮类型
                    textInputAction: TextInputAction.search,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: InputDecoration(
                      // fix: 解决使用 contentPadding 垂直高度变大的问题
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(horizontal: 4),
                      border: InputBorder.none,
                      hintText: widget.hint ?? '',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : _wrapTap(
                    onTap: widget.inputBoxClick,
                    child: Container(
                      child: Text(
                        widget.defaultText,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                  ),
          ),
          !showClear
              ? _wrapTap(
                  child: Icon(
                    Icons.mic,
                    size: 22,
                    color: widget.searchBarType == SearchBarType.normal
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  onTap: widget.speakClick)
              : _wrapTap(
                  child: Icon(
                    Icons.clear,
                    size: 22,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    setState(() {
                      _controller.clear();
                    });
                    _onChanged(_controller.text);
                  }),
        ],
      ),
    );
  }

  Widget _wrapTap({@required Widget child, void Function() onTap}) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: child,
    );
  }

  _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  _homeFontColor() {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black54
        : Colors.white;
  }
}

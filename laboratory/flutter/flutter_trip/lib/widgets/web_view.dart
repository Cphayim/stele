/*
 * @Author: Cphayim
 * @Date: 2020-06-30 15:33:11
 * @LastEditTime: 2020-07-02 16:34:21
 * @Description:
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5', 'm.ctrip.com/html5/'];

class WebView extends StatefulWidget {
  // webview 要打开的页面 url
  final String url;
  // 状态栏颜色
  final String statusBarColor;
  // 标题
  final String title;
  // 是否隐藏 appBar
  final bool hideAppBar;
  // 显示返回控制
  final bool backForbid;

  const WebView(
      {Key key,
      this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForbid = false})
      : super(key: key);

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  // webview 实例
  final webviewReference = FlutterWebviewPlugin();

  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  // 是否已经退出（防止重复调用 Navigator.pop()）
  bool _exiting = false;

  @override
  void initState() {
    super.initState();
    webviewReference.close();
    // 当 webview url 变化
    _onUrlChanged = webviewReference.onUrlChanged.listen((String url) {
      print(url);
    });
    // 当 webview 状态变化
    _onStateChanged =
        webviewReference.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.startLoad:
          // 如果打开的 url 在 CATCH_URLS 中
          if (_isToMain(state.url) && !_exiting) {
            // 如果禁止返回，则打开最初的 url
            if (widget.backForbid) {
              webviewReference.launch(widget.url);
            } else {
              Navigator.pop(context);
              _exiting = true;
            }
          }
          break;
        default:
          break;
      }
    });
    // 当 webview 出现 http 错误时
    _onHttpError = webviewReference.onHttpError.listen((WebViewHttpError err) {
      print("error: " + err.url);
    });
  }

  @override
  void dispose() {
    // widget 销毁时取消事件监听，销毁 webview
    if (_onUrlChanged != null) {
      _onUrlChanged.cancel();
    }
    if (_onStateChanged != null) {
      _onStateChanged.cancel();
    }
    if (_onHttpError != null) {
      _onHttpError.cancel();
    }
    webviewReference.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if (statusBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          // appBar
          _appBar(
            backgroundColor: Color(
                // 字符串转 16 进制颜色
                int.parse('0xff$statusBarColorStr')),
            backButtonColor: backButtonColor,
          ),
          // 内容
          Expanded(
            child: WebviewScaffold(
              url: widget.url,
              withZoom: true, // 是否能够缩放
              withLocalStorage: true, // 是否启用本地存储
              hidden: true, // 默认状态是否隐藏
              initialChild: Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar({Color backgroundColor, Color backButtonColor}) {
    // 隐藏状态栏
    if (widget.hideAppBar ?? false) {
      return Container(
        // color: backgroundColor,
        // height: 40,
      );
      // return null;
    }
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
      // 撑满屏幕宽度
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Stack(
          children: <Widget>[
            // 左侧按钮
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(Icons.close, color: backButtonColor, size: 26),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.title ?? '',
                  style: TextStyle(color: backButtonColor, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 判断 url 是不是在 CATCH_URLS 中
  bool _isToMain(String url) {
    bool contain = false;
    for (String value in CATCH_URLS) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  Widget _safeArea(Widget child) {
    return SafeArea(child: child);
  }
}

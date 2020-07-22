/*
 * @Author: Cphayim
 * @Date: 2020-07-03 09:37:44
 * @LastEditTime: 2020-07-03 09:46:25
 * @Description:
 */
import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final Widget child;
  // 是否显示 loading
  final bool isLoading;
  // 是否覆盖整个页面
  final bool cover;

  const LoadingContainer({
    Key key,
    @required this.isLoading,
    @required this.child,
    this.cover = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!cover) {
      return isLoading ? _loadingView : child;
    } else {
      return Stack(
        children: <Widget>[
          child,
          isLoading ? _loadingView : null,
        ],
      );
    }
  }

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

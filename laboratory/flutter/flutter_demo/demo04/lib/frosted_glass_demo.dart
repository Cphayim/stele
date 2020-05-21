/*
 * @Author: Cphayim
 * @Date: 2020-05-21 11:14:38
 * @LastEditTime: 2020-05-21 16:12:21
 * @Description:
 */

import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590057998573&di=79010c699c1e55c00dfd9a6afd27600b&imgtype=0&src=http%3A%2F%2Fpicture.ik123.com%2Fuploads%2Fallimg%2F180330%2F4-1P330160644.jpg'),
          ),
          Center(
            // 可裁切的矩形
            child: ClipRect(
              // 背景过滤器
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.7,
                  child: Container(
                    width: 500,
                    height: 700,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200
                    ),
                    child: Center(
                      child: Text('Cphayim', style: Theme.of(context).textTheme.display3,),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

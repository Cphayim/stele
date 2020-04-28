/*
 * @Author: Cphayim
 * @Date: 2020-03-31 14:30:27
 * @LastEditTime: 2020-04-26 16:32:18
 * @Description: 懒加载列表
 *  ListView.builder 可以用于构建大量或无限的列表，
 *  是因为 ListView.builder 只会构建那些实际可见的 子Widget
 */

import 'package:flutter/material.dart';

void main() => runApp(ListViewBuilderWidget(
      items: List<String>.generate(100, (i) =>   "Item ${i+1}"),
    ));

class ListViewBuilderWidget extends StatelessWidget {
  final List<String> items;

  ListViewBuilderWidget({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(title: new Text('Flutter 可滚动Widget -- ListView')),
        body: ListView.builder(
          // 可以在此处指定列表长度，将有助于提升性能
          // 也可以设置为 null，此时列表长度将取决于 itemBuilder 第一次返回 null 时的索引
          itemCount: null,
          itemBuilder: (context, index) {
            print(index);
            if(index >= items.length) return null;
            return ListTile(
              title: Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}

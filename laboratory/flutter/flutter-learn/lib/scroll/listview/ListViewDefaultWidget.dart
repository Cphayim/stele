import 'package:flutter/material.dart';

main() => runApp(new ListViewWidget());

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add((i + 1).toString());
    }
    List<Widget> widgets = list.map((item) => Text(item)).toList();
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Flutter 容器Widget -- Center')),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('标题'),
              subtitle: Text('副标题'),
              // 是否显示第三行内容
              // isThreeLine: true,
              // 左侧图标
              leading: CircleAvatar(),
              // 右侧图标
              trailing: Icon(Icons.chevron_right),
              // 是否密集显示（小的列表项）
              dense: true,
              // enabled: false,
              selected: true,
            ),
            // 分割线
            Divider(),
            ListTile(
              title: Text('标题'),
              // subtitle: Text('副标题'),
              leading: Icon(Icons.android),
            ),
            // 步骤条
            Stepper(steps: [
              Step(title: Text('一'), content: Text('内容一')),
              Step(title: Text('二'), content: Text('内容二')),
            ]),
          ],
        ),
      ),
    );
  }
}

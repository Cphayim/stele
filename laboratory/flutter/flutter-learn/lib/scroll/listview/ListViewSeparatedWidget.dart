import 'package:flutter/material.dart';

void main() => runApp(ListViewSeparatedWidget(
      items: List<String>.generate(100, (i) => "Item $i"),
    ));

class ListViewSeparatedWidget extends StatelessWidget {
  final List<String> items;

  ListViewSeparatedWidget({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(title: new Text('Flutter 可滚动Widget -- ListView')),
        body: ListView.separated(
          // reverse: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${items[index]}'),
            );
          },
          // 创建分隔符
          separatorBuilder: (context, index) {
            // return Container(
            //   constraints: BoxConstraints.tightFor(height: 10),
            //   color: Colors.orange,
            // );
            return Divider(color: Colors.red,);
          },
        ),
      ),
    );
  }
}

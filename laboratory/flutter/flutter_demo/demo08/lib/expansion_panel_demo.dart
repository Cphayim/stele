/*
 * @Author: Cphayim
 * @Date: 2020-05-22 15:58:46
 * @LastEditTime: 2020-05-22 16:28:02
 * @Description:
 */

import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<int> mList;
  List<ExpandStateBean> expandStateList;
  _ExpansionPanelDemoState() {
    mList = List();
    expandStateList = List();
    for (var i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
      ),
      body: SingleChildScrollView(
        // ExpansionPanel 必须放在可滚动容器内
        child: ExpansionPanelList(
          expansionCallback: (index, isOpen) {
            _switchPanelByIndex(index, isOpen);
          },
          children: mList.map((index) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isOpen) {
                return ListTile(
                  title: Text('This is No.${index}'),
                );
              },
              body: ListTile(
                title: Text('expansion no.${index}'),
              ),
              isExpanded: expandStateList[index].isOpen,
              canTapOnHeader: true,
            );
          }).toList(),
        ),
      ),
    );
  }

  void _switchPanelByIndex(int index, bool curIsOpen) {
    setState(() {
      if(index < expandStateList.length) {
        expandStateList[index].isOpen = !expandStateList[index].isOpen;
      }
    });
  }
}

class ExpandStateBean {
  int index;
  bool isOpen;

  ExpandStateBean(this.index, this.isOpen);
}

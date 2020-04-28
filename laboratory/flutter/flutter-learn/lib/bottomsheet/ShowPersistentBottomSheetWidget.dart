import 'package:flutter/material.dart';

main() => runApp(new ShowPersistentBottomSheetWidget());

class ShowPersistentBottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: new Scaffold(
          appBar: AppBar(title: new Text('Flutter UI Widget -- BottomSheet')),
          body: Builder(
            builder: (context) {
              return RaisedButton(
                onPressed: () {
                  openButtonSheet(context);
                },
                child: Text('showBottomSheet'),
              );
            },
          )),
    );
  }

  void openButtonSheet(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.red,
          child: Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('dismissBottomSheet'),
            ),
          ),
        ),
      ),
    );
  }
}

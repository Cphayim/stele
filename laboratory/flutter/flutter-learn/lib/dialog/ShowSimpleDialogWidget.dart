import 'package:flutter/material.dart';

main() => runApp(new ShowSimpleDialogWidget());

class ShowSimpleDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('Test')),
        body: Builder(
          builder: (context) => RaisedButton(
                child: Text('Open SimpleDialog'),
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => SimpleDialog(
                      title: Text('SimpleDialog Demo'),
                      children: <Widget>[
                        SimpleDialogOption(
                          child: Text('Confirm'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        SimpleDialogOption(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
        ),
      ),
    );
  }
}

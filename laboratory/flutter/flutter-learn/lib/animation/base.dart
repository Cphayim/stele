import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  AnimationStatus _animationStatus;
  double _animationValue;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller)
      ..addListener(() {
        // print(_animation.value);
        setState(() {
          _animationValue = _animation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        print(status);
        // if (status == AnimationStatus.completed) {
        //   _controller.reverse();
        // } else if (status == AnimationStatus.dismissed) {
        //   _controller.forward();
        // }
        setState(() {
          _animationStatus = status;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (_controller.isCompleted) {
                _controller
                  // ..reset()
                  ..reverse();
              }else if(_controller.isDismissed) {
                _controller
                  // ..reset()
                  ..forward();
              }
            },
            child: Text(
              'Start',
              textDirection: TextDirection.ltr,
            ),
          ),
          Text(
            'Status: ${_animationStatus.toString()}',
            textDirection: TextDirection.ltr,
          ),
          Text(
            'Value: ${_animationValue.toString()}',
            textDirection: TextDirection.ltr,
          ),
          Container(
            height: _animationValue,
            width: _animationValue,
            color: Colors.blue,
          ),
          Text(
            '123',
            textDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

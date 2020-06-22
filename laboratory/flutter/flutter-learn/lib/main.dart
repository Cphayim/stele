import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RadialExpansionDemo(),
    );
  }
}

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   description,
        //   style: TextStyle(color: Colors.black),
        // ),
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: Theme.of(context).canvasColor,
          child: Center(
            child: Card(
              elevation: 8.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: kMaxRadius * 2.0,
                    height: kMaxRadius * 2.0,
                    child: Hero(
                      tag: imageName,
                      createRectTween: _createRectTween,
                      child: RadialExpansion(
                        maxRadius: kMaxRadius,
                        child: Photo(
                          photo: imageName,
                          onTap: () {
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 3.0,
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return Container(
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(
        tag: imageName,
        createRectTween: _createRectTween,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(pageBuilder: (
                  BuildContext context,
                  Animation<double> animation1,
                  Animation<double> animation2,
                ) {
                  return AnimatedBuilder(
                    animation: animation1,
                    builder: (BuildContext context, Widget child) {
                      return Opacity(
                        opacity: opacityCurve.transform(animation1.value),
                        child: _buildPage(context, imageName, description),
                      );
                    },
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 4.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Transition Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: FractionalOffset.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildHero(
              context,
              'https://www.easyicon.net/api/resizeApi.php?id=1225576&size=128',
              '水果',
            ),
            _buildHero(
              context,
              'https://www.easyicon.net/api/resizeApi.php?id=1225574&size=128',
              '动物',
            ),
            _buildHero(
              context,
              'https://www.easyicon.net/api/resizeApi.php?id=1225578&size=128',
              '飞碟',
            ),
          ],
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  final double maxRadius;
  final double clipRectSize;
  final Widget child;

  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  })  : clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(child: child),
        ),
      ),
    );
  }
}

class Photo extends StatelessWidget {
  final String photo;
  final Color color;
  final VoidCallback onTap;

  Photo({Key key, this.photo, this.color, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      // color: Theme.of(context).primaryColor.withOpacity(0.25),
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
        onTap: onTap,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints size) {
            return Image.network(photo, fit: BoxFit.contain);
          },
        ),
      ),
    );
  }
}

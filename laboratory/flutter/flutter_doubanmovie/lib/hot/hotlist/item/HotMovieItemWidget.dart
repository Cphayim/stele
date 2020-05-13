import 'package:flutter/material.dart';
import 'package:flutter_doubanmovie/hot/hotlist/data/HotMovieData.dart';

class HotMovieItemWidget extends StatefulWidget {
  final HotMovieData hotMovieData;

  HotMovieItemWidget(this.hotMovieData);

  @override
  State<StatefulWidget> createState() {
    return HotMovieItemWidgetState();
  }
}

class HotMovieItemWidgetState extends State<HotMovieItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          // 封面图
          Image.network(
            widget.hotMovieData.images.small,
            width: 80,
            height: 120,
            fit: BoxFit.cover,
          ),
          // 中间简介
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.hotMovieData.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.hotMovieData.rating.average.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  Expanded(
                    flex: 0,
                    child: Text(
                      '导演: ${widget.hotMovieData.getDirectors()}',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      '主演: ${widget.hotMovieData.getCasts()}',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  )
                ],
              ),
            ),
          ),
          // 右侧人数和购票
          Container(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${widget.hotMovieData.collectCount.toString()}人看过',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
                OutlineButton(
                  child: Text('购票'),
                  color: Colors.red,
                  textColor: Colors.red,
                  highlightedBorderColor: Colors.red,
                  borderSide: BorderSide(color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/avatar.dart';

class HeaderSliver extends StatelessWidget {
  const HeaderSliver({Key key, this.opacity}) : super(key: key);
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: AnimatedOpacity(
        opacity: opacity,
        duration: Duration(seconds: 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Avatar(
              'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg',
              width: 30.0,
              borderRadius: 15.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('外卖'),
            ),
          ],
        ),
      ),
      elevation: 0,
      actions: <Widget>[
        AnimatedOpacity(
          opacity: opacity,
          duration: Duration(seconds: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.location_on,
                size: 18.0,
              ),
              Text(
                '中国电信大厦',
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
        AnimatedOpacity(
          opacity: opacity,
          duration: Duration(seconds: 0),
          child: Padding(
            padding: EdgeInsets.only(
              right: 10.0,
            ),
            child: GestureDetector(
              child: Icon(Icons.add_alert),
            ),
          ),
        ),
      ],
    );
  }
}

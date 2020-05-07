import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/avatar.dart';
import 'package:flutter_meituan/config/application.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _HeaderDelegate(
        minHeight: 80,
        maxHeight: 100,
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  _HeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
  });

  final double minHeight;
  final double maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return shrinkOffset == 0
        ? Container(
            height: maxHeight,
            padding: EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 0.0),
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Avatar(
                            "http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg"),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'kiq2273434394',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5.0),
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 3.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFA27A01),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  '成长值 3873',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Application.router
                                .navigateTo(context, 'me/color-setting');
                          },
                          child: Icon(Icons.settings),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Icon(Icons.headset_mic),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        : AppBar(
            centerTitle: true,
            elevation: 0.0,
            title: Text('kiq2273434394'),
            actions: [
              GestureDetector(
                onTap: () {
                  Application.router.navigateTo(context, 'me/color-setting');
                },
                child: Icon(Icons.settings),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 15.0),
                child: Icon(Icons.headset_mic),
              ),
            ],
          );
  }

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_HeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}

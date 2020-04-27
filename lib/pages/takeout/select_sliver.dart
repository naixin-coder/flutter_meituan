import 'dart:math';

import 'package:flutter/material.dart';

class SelectSliverDelegate extends SliverPersistentHeaderDelegate {
  SelectSliverDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    // @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  // final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(
        child: Container(
      padding: EdgeInsets.all(15.0),
      color: shrinkOffset > 0 ? Colors.white : Color(0xFFF6F4F6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Text(
              '附近商铺',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 4.0),
                decoration: BoxDecoration(
                  color: shrinkOffset > 0 ? Color(0xFFF6F4F6) : Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  '满减优惠',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 4.0),
                decoration: BoxDecoration(
                  color: shrinkOffset > 0 ? Color(0xFFF6F4F6) : Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  '会员红包',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 4.0),
                decoration: BoxDecoration(
                  color: shrinkOffset > 0 ? Color(0xFFF6F4F6) : Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  '减配送费',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 4.0),
                decoration: BoxDecoration(
                  color: shrinkOffset > 0 ? Color(0xFFF6F4F6) : Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  '30分钟内',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SelectSliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
    //  ||
    // child != oldDelegate.child;
  }
}

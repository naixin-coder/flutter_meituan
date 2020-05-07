import 'package:flutter/material.dart';
import 'package:flutter_meituan/pages/home/index/banner.dart';
import 'package:flutter_meituan/pages/me/index/interactive.dart';
import 'package:flutter_meituan/pages/me/index/my_order.dart';
import 'package:flutter_meituan/pages/me/index/my_wallet.dart';
import 'package:flutter_meituan/pages/me/index/tools.dart';

class Content extends StatelessWidget {
  const Content({Key key, this.bannerImages, this.tools}) : super(key: key);

  final List bannerImages;
  final List tools;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F3F5),
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
      child: Column(
        children: [
          MyOrder(),
          MyWallet(),
          MeiTuanBanner(
            bannerImages,
            height: 100.0,
            autoplay: true,
            margin: EdgeInsets.only(top: 10.0),
          ),
          Interactive(),
          Tools(tools),
        ],
      ),
    );
  }
}

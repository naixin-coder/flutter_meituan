import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/custom_icondata.dart';
import 'package:flutter_meituan/common/refresh.dart';
import 'package:flutter_meituan/pages/home/index/banner.dart';
import 'package:flutter_meituan/pages/me/index/content.dart';
import 'package:flutter_meituan/pages/me/index/header.dart';
import 'package:flutter_meituan/pages/me/index/toolbar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  RefreshController _refreshController = RefreshController();
  static EdgeInsetsGeometry bottomPadding =
      EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0);
  static double bottomNavSize = 25.0;
  static TextStyle menuTextStyle =
      TextStyle(color: Color(0xFF6B6A6B), fontSize: 12.0);

  List bannerImages = [
    RadiusImage(
      'http://img.zcool.cn/community/0180e15970239fa8012193a363de40.jpg@1280w_1l_2o_100sh.jpg',
      type: 'network',
      height: 100,
    ),
    RadiusImage(
      'http://img.zcool.cn/community/013c805970239fa8012193a3adeb5c.jpg@1280w_1l_2o_100sh.jpg',
      type: 'network',
      height: 100,
    ),
    RadiusImage(
      'http://img.zcool.cn/community/01b056597023a2a8012193a3fa44d7.jpg@2o.jpg',
      type: 'network',
      height: 100,
    ),
    RadiusImage(
      'http://img.zcool.cn/community/013c805970239fa8012193a3adeb5c.jpg@2o.jpg',
      type: 'network',
      height: 100,
    ),
  ];

  static List navMenusCenter = [
    {
      "icon": CustomIconData.chongzhi,
      "backgroundColor": Colors.white,
      "text": '充值',
      "color": Color(0xFFFF8402),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
      "callback": () {}
    },
    {
      "icon": CustomIconData.gongjiao,
      "backgroundColor": Colors.white,
      "text": '公交',
      "color": Color(0xFFFF9D50),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.shuishou,
      "backgroundColor": Colors.white,
      "text": '税收',
      "color": Color(0xFFF56E5F),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.tianqi,
      "backgroundColor": Colors.white,
      "text": '天气',
      "color": Color(0xFF08A0E7),
      "padding": bottomPadding,
      "size": 20.0,
      "textStyle": menuTextStyle,
    },
  ];

  static List navMenusBottom = [
    {
      "icon": CustomIconData.fapiao,
      "backgroundColor": Colors.white,
      "text": '发票',
      "color": Color(0xFF16C0EF),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.xiwang,
      "backgroundColor": Colors.white,
      "text": '美团大学',
      "color": Color(0xFFFFC30F),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.hezuo,
      "backgroundColor": Colors.white,
      "text": '我要合作',
      "color": Color(0xFFF8AD1A),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: DaiyaRefresh(
          backgroundColor: Theme.of(context).primaryColor,
          controller: _refreshController,
          onRefresh: () {
            _refreshController.refreshCompleted();
          },
          onLoading: () {
            _refreshController.loadComplete();
          },
          child: CustomScrollView(
            slivers: [
              Header(),
              SliverToBoxAdapter(
                child: Toolbar(),
              ),
              SliverToBoxAdapter(
                child: Content(
                  bannerImages: bannerImages,
                  tools: [navMenusCenter, navMenusBottom],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

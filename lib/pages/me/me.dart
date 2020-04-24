import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/avatar.dart';
import 'package:flutter_meituan/config/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  @override
  _MePageState createState() => _MePageState();
}

List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
  return <Widget>[
    SliverAppBar(
      elevation: 0,
      centerTitle: true, //标题居中
      expandedHeight: 30.0, //展开高度200
      backgroundColor: Theme.of(context).primaryColor,
      floating: false, //不随着滑动隐藏标题
      pinned: true, //不固定在顶部
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Image.asset(
          "assets/pic.jpg",
          fit: BoxFit.cover,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: () {
              Application.router.navigateTo(context, "color-setting");
            },
            child: Icon(Icons.settings),
          ),
        ),
      ],
    )
  ];
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('我的'),
      //   elevation: 0,
      //   actions: <Widget>[
      //     Padding(
      //       padding: EdgeInsets.only(right: 10.0),
      //       child: GestureDetector(
      //         onTap: () {
      //           Application.router.navigateTo(context, "color-setting");
      //         },
      //         child: Icon(Icons.settings),
      //       ),
      //     ),
      //   ],
      // ),
      // body: Container(
      //   color: Theme.of(context).primaryColor,
      //   height: ScreenUtil.screenHeight,
      //   width: ScreenUtil.screenWidth,
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: <Widget>[],
      //     ),
      //   ),
      // ),
      body: NestedScrollView(
        headerSliverBuilder: _sliverBuilder,
        body: Center(
          child: Text('hahaha'),
        ),
      ),
    );
  }
}

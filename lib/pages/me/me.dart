import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/avatar.dart';
import 'package:flutter_meituan/common/custom_icondata.dart';
import 'package:flutter_meituan/common/refresh.dart';
import 'package:flutter_meituan/config/application.dart';
import 'package:flutter_meituan/pages/home/index/banner.dart';
import 'package:flutter_meituan/pages/home/index/menus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  List<Widget> _sliverBuilder(BuildContext context) {
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

  Widget _buildPersistentHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverDelegate(
        minHeight: 80,
        maxHeight: 100,
      ),
    );
  }

  Widget myOrder() {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(0.0),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '我的订单',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '查看全部订单',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF9A989A),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 20.0,
                      color: Color(0xFF9A989A),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.payment,
                        color: Color(0xFFFFBA03),
                        size: 40.0,
                      ),
                      Text(
                        '待付款',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.payment,
                        color: Color(0xFFFFBA03),
                        size: 40.0,
                      ),
                      Text(
                        '待使用',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.payment,
                        color: Color(0xFFFFBA03),
                        size: 40.0,
                      ),
                      Text(
                        '待评价',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.payment,
                        color: Color(0xFFFFBA03),
                        size: 40.0,
                      ),
                      Text(
                        '退款/售后',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myWallet() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '我的钱包',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '进入钱包',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF9A989A),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 20.0,
                      color: Color(0xFF9A989A),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Row(
                        // crossAxisAlignment: ,
                        children: [
                          Text(
                            '3.84',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '万',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 3.0),
                        child: Text(
                          '借钱',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w100),
                        ),
                      ),
                      Text(
                        '大约可借',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFB9B8B9),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '218',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '元',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 3.0),
                        child: Text(
                          '账单',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w100),
                        ),
                      ),
                      Text(
                        '最近支付',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFB9B8B9),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        // crossAxisAlignment: ,
                        children: [
                          Text(
                            '5',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '元',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 3.0),
                        child: Text(
                          '免费领红包',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w100),
                        ),
                      ),
                      Text(
                        '全场通用',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFB9B8B9),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        // crossAxisAlignment: ,
                        children: [
                          Text(
                            '254',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '元',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 3.0),
                        child: Text(
                          '美食享优惠',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w100),
                        ),
                      ),
                      Text(
                        '最高随机减',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFB9B8B9),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //互动签到
  Widget interactive() {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '互动签到',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '袋鼠快跑',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  '领大额外面红包',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Color(0xFFE74B00),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Image.network(
                              'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg',
                              width: 40.0,
                              height: 40.0,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        width: 1.0,
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '袋鼠快跑',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  '领大额外面红包',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Color(0xFFE74B00),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Image.network(
                              'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg',
                              width: 40.0,
                              height: 40.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '袋鼠快跑',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    '领大额外面红包',
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Color(0xFFE74B00),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Image.network(
                                'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg',
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          width: 1.0,
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '袋鼠快跑',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    '领大额外面红包',
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Color(0xFFE74B00),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Image.network(
                                'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg',
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget tools() {
    List list = [navMenusCenter, navMenusBottom];
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 30.0,
      ),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '推荐工具',
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
          ),
          ...menus(list),
        ]),
      ),
    );
  }

  List<Widget> menuItems(items) {
    List<Widget> list = [];
    // icon,backgroundColor,text
    for (var item in items) {
      Widget widget = MenuItem(
        item["text"],
        icon: item["icon"],
        iconSize: item["size"],
        iconColor: item["color"],
        borderRadius: 15.0,
        backgroundColor: item["backgroundColor"],
        iconPadding: item["padding"],
        textPadding: EdgeInsets.only(top: 5.0),
        useCustomIcon: true,
        textStyle: item['textStyle'],
        badge: item["badge"],
        callback: item["callback"],
      );
      list.add(widget);
    }
    return list;
  }

  List<Widget> menus(menuList) {
    List<Widget> rows = [];
    for (var menu in menuList) {
      Widget widget = Flex(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,

        direction: Axis.horizontal,
        children: menuItems(menu),
      );
      rows.add(widget);
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   title: Text('15823138353'),
      // ),
      body: Container(
        // margin: EdgeInsets.only(top: 30.0),
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
              _buildPersistentHeader(),
              SliverToBoxAdapter(
                child: Container(
                  height: 110,
                  color: Color(0xFFF5F3F5),
                  child: Stack(
                    children: [
                      Container(
                        color: Theme.of(context).primaryColor,
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.star_border,
                                  size: 35.0,
                                ),
                                Text('收藏'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.star_border,
                                  size: 35.0,
                                ),
                                Text('收藏'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.star_border,
                                  size: 35.0,
                                ),
                                Text('收藏'),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.star_border,
                                  size: 35.0,
                                ),
                                Text('收藏'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        child: Card(
                          shadowColor: Color(0xFFD6D5D6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 0.1,
                          margin: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Container(
                            width: ScreenUtil.mediaQueryData.size.width - 30.0,
                            padding:
                                EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.add_alert,
                                      color: Color(0xFFFFAD02),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        '点击进入消息中心',
                                        style: TextStyle(fontSize: 13.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFFD6D5D6),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Color(0xFFF5F3F5),
                  padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                  child: Column(
                    children: [
                      myOrder(),
                      myWallet(),
                      MeiTuanBanner(
                        bannerImages,
                        height: 100.0,
                        autoplay: true,
                        margin: EdgeInsets.only(top: 10.0),
                      ),
                      interactive(),
                      tools()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverDelegate extends SliverPersistentHeaderDelegate {
  _SliverDelegate({
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
                        Icon(Icons.settings),
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
              Icon(Icons.settings),
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
  bool shouldRebuild(_SliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}

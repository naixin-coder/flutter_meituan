import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/avatar.dart';
import 'package:flutter_meituan/common/custom_icondata.dart';
import 'package:flutter_meituan/common/refresh.dart';
import 'package:flutter_meituan/pages/home/banner.dart';
import 'package:flutter_meituan/pages/home/menus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Takeout extends StatefulWidget {
  Takeout({Key key}) : super(key: key);

  @override
  _TakeoutState createState() => _TakeoutState();
}

class _TakeoutState extends State<Takeout> {
  static Color searchColor = Color(0xFF999795);
  static List<String> tagTexts = ["口罩", "奶茶", "烧烤", "炸鸡", "乡村基", "米线", "蛋糕"];
  static EdgeInsetsGeometry topNavPadding = EdgeInsets.all(10.0);
  static double topNavSize = 35.0;
  static EdgeInsetsGeometry bottomPadding =
      EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0);
  static double bottomNavSize = 25.0;
  static TextStyle menuTextStyle =
      TextStyle(color: Color(0xFF6B6A6B), fontSize: 12.0);
  static double navIconSize = 40.0;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  ScrollController _scrollController;
  Color background = Color(0xFFF6F4F6);
  Color tagsBackground = Colors.white;

  static List navMenus = [
    {
      "icon": CustomIconData.takeOut,
      "backgroundColor": Color(0xFFFFC107),
      "text": '外卖',
      "color": Colors.white,
      "size": topNavSize,
      "padding": topNavPadding,
      "textStyle": menuTextStyle,
      "callback": () {
        // Navigator.of(context)
      }
    },
    {
      "icon": CustomIconData.meishi,
      "backgroundColor": Color(0xFFFF7E00),
      "text": '美食',
      "color": Colors.white,
      "size": topNavSize,
      "padding": topNavPadding,
      "textStyle": menuTextStyle,
      "callback": () {
        print('美食');
      }
    },
    {
      "icon": CustomIconData.jiudian,
      "backgroundColor": Color(0xFFAF6A4B),
      "text": '酒店住宿',
      "color": Colors.white,
      "size": topNavSize,
      "padding": topNavPadding,
      "textStyle": menuTextStyle,
      "callback": () {
        print('住宿');
      }
    },
    {
      "icon": CustomIconData.yule,
      "backgroundColor": Color(0xFF01CCA4),
      "text": '休闲/娱乐',
      "color": Colors.white,
      "size": topNavSize,
      "padding": topNavPadding,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.maoyan,
      "backgroundColor": Color(0XFFFF440A),
      "text": '电影/演出',
      "color": Colors.white,
      "size": topNavSize,
      "padding": topNavPadding,
      "textStyle": menuTextStyle,
    },
  ];

  static List navMenusCenter = [
    {
      "icon": CustomIconData.car,
      "backgroundColor": Colors.white,
      "text": '打车',
      "color": Color(0xFF14B1F6),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.money,
      "backgroundColor": Colors.white,
      "text": '红包签到',
      "color": Color(0xFFFF541A),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.yaodian,
      "backgroundColor": Colors.white,
      "text": '超市/药店',
      "color": Color(0xFF336799),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.jieqian,
      "backgroundColor": Colors.white,
      "text": '借钱',
      "color": Color(0xFFFF8805),
      "padding": bottomPadding,
      "size": 20.0,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.tickets,
      "backgroundColor": Colors.white,
      "text": '火车票/机票',
      "color": Color(0xFF14B1F6),
      "padding": bottomPadding,
      "size": 20.0,
      "textStyle": menuTextStyle,
    },
  ];

  static List navMenusBottom = [
    {
      "icon": CustomIconData.daishu,
      "backgroundColor": Colors.white,
      "text": '免费领水果',
      "color": Color(0xFF11C09D),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.daishu,
      "backgroundColor": Colors.white,
      "text": '袋鼠快跑',
      "color": Color(0xFFFFB400),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.meirong,
      "backgroundColor": Colors.white,
      "text": '医学美容',
      "color": Color(0xFFFF5E98),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.zuanshi,
      "backgroundColor": Colors.white,
      "text": '结婚摄影',
      "color": Color(0xFFFF5E98),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
    {
      "icon": CustomIconData.more,
      "backgroundColor": Colors.white,
      "text": '更多',
      "color": Color(0xFFC2C3D1),
      "padding": bottomPadding,
      "size": bottomNavSize,
      "textStyle": menuTextStyle,
    },
  ];

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

  List list = [navMenus, navMenusCenter, navMenusBottom];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // _scrollController.addListener(() {
    //   double offset = _scrollController.offset;
    //   if (offset > 1150) {
    //     setState(() {
    //       background = Colors.white;
    //       tagsBackground = Color(0xFFF6F4F6);
    //     });
    //   } else {
    //     background = Color(0xFFF6F4F6);
    //     tagsBackground = Colors.white;
    //   }
    // });
  }

  Widget getAppBar() {
    return AppBar(
      title: Row(
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
      elevation: 0,
      actions: <Widget>[
        Row(
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
        Padding(
          padding: EdgeInsets.only(
            right: 10.0,
          ),
          child: GestureDetector(
            child: Icon(Icons.add_alert),
          ),
        ),
      ],
    );
  }

  Widget _search() => GestureDetector(
        onTap: () {
          print("搜索");
        },
        child: Container(
          height: 40.0,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Color(0xFFF2F0F2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.search,
                  // size: 1.0,
                  color: searchColor,
                ),
              ),
              Text(
                '煎饼摊  满20减15',
                style: TextStyle(fontSize: 12.0, color: searchColor),
              )
            ],
          ),
        ),
      );

  Widget _buildSliver() => SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFFAF8FA), Color(0xFFF6F4F6)],
              stops: [0, 0.7],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            children: [
              _search(),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  children: _getTags(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: RadiusImage(
                  'http://img.zcool.cn/community/0180e15970239fa8012193a363de40.jpg@1280w_1l_2o_100sh.jpg',
                  type: 'network',
                  height: 100,
                  width: ScreenUtil.screenWidth - 30.0,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0), child: menuCard()),
              MeiTuanBanner(
                bannerImages,
                height: 100.0,
                autoplay: true,
                margin: EdgeInsets.only(top: 10.0),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                ),
                child: recommCard(),
              ),
              featCard(),
            ],
          ),
        ),
      );

  Widget _buildProductSliver() => SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0),
          color: Color(0xFFF6F4F6),
          child: Column(
            children: getProducts(),
          ),
        ),
      );

  Widget menuCard() => Card(
        elevation: 0,
        margin: EdgeInsets.all(0.0),
        child: Menus(
          list,
          padding: EdgeInsets.all(10.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
      );

  List<Widget> _getTags() {
    List<Widget> tags = [];
    for (String tagText in tagTexts) {
      tags.add(GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          print(tagText);
        },
        child: Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: _tags(tagText),
        ),
      ));
    }
    return tags;
  }

  Widget _tags(String text) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xFFF2F0F2),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 3.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 11.0),
          ),
        ),
      );

  Widget _widget() => SliverPersistentHeader(
        pinned: true,
        delegate: _SliverDelegate(
          minHeight: 100,
          maxHeight: 100,
          // child: ,
        ),
      );

  Widget _buildTitleSliver() => SliverAppBar(
        elevation: 0.0,
        expandedHeight: 60,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(color: Color(0xFFF6F4F6)),
        ),
        title: Text("附近商家"),
      );

  Widget _buildSelectSliver() => SliverAppBar(
        pinned: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: background,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding:
              EdgeInsets.only(left: 15.0, right: 15.0, top: 0, bottom: 15.0),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 4.0),
                decoration: BoxDecoration(
                  color: tagsBackground,
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
                  color: tagsBackground,
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
                  color: tagsBackground,
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
                  color: tagsBackground,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  '满减优惠',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
            ],
          ),
        ),
      );

  Widget recommCard() => Card(
        elevation: 0.0,
        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        child: Container(
          height: 265.0,
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  recommItem(),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '超值工作餐',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            "低至9.9元",
                            style: TextStyle(
                                color: Color(0xFF999695), fontSize: 12.0),
                          ),
                          RadiusImage(
                            'http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1403/30/c38/32630185_1396185964905_mthumb.jpg',
                            type: 'network',
                            borderRadius: 5.0,
                            height: 60.0,
                            width:
                                ((ScreenUtil.mediaQueryData.size.width - 70) /
                                    2),
                          ),
                        ],
                      )),
                ],
              ),
              VerticalDivider(
                width: 20.0,
                indent: 10.0,
                endIndent: 10.0,
                color: Color(0xFFF9F7F9),
                thickness: 1.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '大牌特惠',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Text(
                        "解锁高分美食",
                        style:
                            TextStyle(color: Color(0xFF999695), fontSize: 12.0),
                      ),
                      RadiusImage(
                        'http://img1.juimg.com/161023/330777-1610230H14338.jpg',
                        type: 'network',
                        borderRadius: 5.0,
                        height: 80.0,
                        width:
                            ((ScreenUtil.mediaQueryData.size.width - 70) / 2),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    width: ((ScreenUtil.mediaQueryData.size.width - 70) / 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '大额满减',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              "超值推荐",
                              style: TextStyle(
                                  color: Color(0xFF999695), fontSize: 12.0),
                            ),
                            RadiusImage(
                              'http://img1.juimg.com/161023/330777-1610230H14338.jpg',
                              type: 'network',
                              borderRadius: 5.0,
                              height: 60.0,
                              width:
                                  ((ScreenUtil.mediaQueryData.size.width - 80) /
                                      4),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '美食榜单',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              "让选择变简单",
                              style: TextStyle(
                                  color: Color(0xFF999695), fontSize: 12.0),
                            ),
                            RadiusImage(
                              'http://img1.juimg.com/161023/330777-1610230H14338.jpg',
                              type: 'network',
                              borderRadius: 5.0,
                              height: 60.0,
                              width:
                                  ((ScreenUtil.mediaQueryData.size.width - 80) /
                                      4),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget recommItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '限时免费',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            "距本场结束",
            style: TextStyle(color: Color(0xFFEE534B), fontSize: 12.0),
          ),
          RadiusImage(
            'http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1403/30/c38/32630185_1396185964905_mthumb.jpg',
            type: 'network',
            borderRadius: 5.0,
            height: 80.0,
            width: ((ScreenUtil.mediaQueryData.size.width - 70) / 2),
          ),
        ],
      );

  Widget featCard() => Card(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
        elevation: 0.0,
        child: Container(
          height: 260,
          padding: EdgeInsets.only(bottom: 10.0),
          width: ScreenUtil.mediaQueryData.size.width - 30,
          child: Swiper(
            itemBuilder: (_, int index) {
              return Stack(
                children: [
                  RadiusImage(
                    'http://www.hb-flavors.com/uploadfiles/%E8%B0%83%E5%91%B3%E6%96%99/201510251215161516.jpg',
                    type: 'network',
                    height: 260,
                    width: ScreenUtil.mediaQueryData.size.width - 30,
                    borderRadius: 5.0,
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      height: 180,
                      padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
                      width: ScreenUtil.mediaQueryData.size.width - 30,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '全城免配送，特价吃大鸡翅',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RadiusImage(
                                  'http://www.hb-flavors.com/uploadfiles/%E8%B0%83%E5%91%B3%E6%96%99/201510251215161516.jpg',
                                  type: 'network',
                                  height: 80,
                                  borderRadius: 5.0,
                                ),
                                RadiusImage(
                                  'http://www.hb-flavors.com/uploadfiles/%E8%B0%83%E5%91%B3%E6%96%99/201510251215161516.jpg',
                                  type: 'network',
                                  height: 80,
                                  borderRadius: 5.0,
                                ),
                                RadiusImage(
                                  'http://www.hb-flavors.com/uploadfiles/%E8%B0%83%E5%91%B3%E6%96%99/201510251215161516.jpg',
                                  type: 'network',
                                  height: 80,
                                  borderRadius: 5.0,
                                ),
                              ],
                            ),
                          ),
                          Text('￥69元')
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    child: Container(
                      height: 55.0,
                      padding: EdgeInsets.only(left: 10.0),
                      child: Row(
                        children: [
                          RadiusImage(
                            'http://pic1.win4000.com/pic/8/f2/2d23855536.jpg',
                            type: 'network',
                            height: 50.0,
                            width: 50.0,
                            borderRadius: 5.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  // padding: EdgeInsets.only(right: 100.0),
                                  width: 250.0,
                                  child: Text(
                                    '霹雳火烧烤.龙虾,江湖菜,特色干锅',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 5.0, bottom: 5.0),
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Color(0xFFFF5340),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8.0, 0.0, 8.0, 2.0),
                                            child: Text(
                                              '22减5',
                                              style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 5.0, bottom: 5.0),
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Color(0xFFFF5340),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8.0, 0.0, 8.0, 2.0),
                                            child: Text(
                                              '40减18',
                                              style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 5.0, bottom: 5.0),
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Color(0xFFFF5340),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8.0, 0.0, 8.0, 2.0),
                                            child: Text(
                                              '65减28',
                                              style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: 5.0, bottom: 5.0),
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3.0),
                                            color: Color(0xFFFF5340),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                8.0, 0.0, 8.0, 2.0),
                                            child: Text(
                                              '5元优惠券',
                                              style: TextStyle(
                                                  fontSize: 11.0,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            itemCount: 2,
          ),
        ),
      );

  List<Widget> getProducts() {
    List items = [
      {
        "imageUrl":
            'http://hbimg.b0.upaiyun.com/9b9a3114f27b8bd358cc491eed1f56d6db82327125cf9-G61O3t_fw658',
        "title": "茶百道（源著天街店）"
      }
    ];
    List<Widget> cards = [];
    for (int i = 0; i < 20; i++) {
      Widget productItem = product(items[0]["imageUrl"], items[0]["title"]);
      cards.add(productItem);
    }
    return cards;
  }

  Widget product(
    String imageUrl,
    String title,
  ) =>
      Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.all(15.0),
          // height: 150.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadiusImage(
                imageUrl,
                type: 'network',
                width: 90.0,
                height: 67.5,
                borderRadius: 5.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    width: ScreenUtil.mediaQueryData.size.width - 170,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Color(0xFFCDCBCB),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, top: 5.0),
                    width: ScreenUtil.mediaQueryData.size.width - 170,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star,
                                size: 12.0, color: Color(0xFFFFA002)),
                            Text(
                              '4.8',
                              style: TextStyle(
                                color: Color(0xFFFFA002),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                '月售5770',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Color(0xFF57585B),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '54分钟 4.0km',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF57585B),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, top: 5.0),
                    width: ScreenUtil.mediaQueryData.size.width - 170,
                    child: Row(
                      children: [
                        Text(
                          '起送￥15',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF57585B),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                          child: Text(
                            '配送￥15',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xFF57585B),
                            ),
                          ),
                        ),
                        Text(
                          '人均￥15',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF57585B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10.0, top: 5.0),
                    width: ScreenUtil.mediaQueryData.size.width - 170,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF7E1),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          child: Text(
                            '江北区奶茶果汁人气第3名',
                            style: TextStyle(
                              color: Color(0xFFFDA71C),
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          padding: EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF0EA),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          child: Text(
                            '点评高分店铺',
                            style: TextStyle(
                              color: Color(0xFFFE7436),
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 21.0,
                    margin: EdgeInsets.only(left: 10.0, top: 5.0),
                    // width: ScreenUtil.mediaQueryData.size.width - 170,
                    padding: EdgeInsets.fromLTRB(3.0, 1.0, 3.0, 2.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFF5E7E8),
                      ),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          '28减2',
                          style: TextStyle(
                            color: Color(0xFFEA583C),
                            fontSize: 11.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: VerticalDivider(
                            width: 1.0,
                            indent: 3.0,
                            endIndent: 2.0,
                            color: Color(0xFFEFE0E1),
                            // thickness: 1.0,
                          ),
                        ),
                        Text(
                          '38减3',
                          style: TextStyle(
                            color: Color(0xFFEA583C),
                            fontSize: 11.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5.0),
                          child: VerticalDivider(
                            width: 1.0,
                            indent: 3.0,
                            endIndent: 2.0,
                            color: Color(0xFFEFE0E1),
                            // thickness: 1.0,
                          ),
                        ),
                        Text(
                          '58减5',
                          style: TextStyle(
                            color: Color(0xFFEA583C),
                            fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Theme.of(context).primaryColor, Color(0xFFF6F4F6)],
            stops: [0, 0.08],
          ),
        ),
        child: DaiyaRefresh(
          backgroundColor: Theme.of(context).primaryColor,
          controller: _refreshController,
          onLoading: () {
            _refreshController.loadComplete();
          },
          onRefresh: () {
            _refreshController.refreshCompleted();
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              _buildSliver(),
              _widget(),
              // _buildTitleSliver(),
              // _buildSelectSliver(),
              _buildProductSliver(),
              // _buildSliver(),
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
  bool shouldRebuild(_SliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
    //  ||
    // child != oldDelegate.child;
  }
}

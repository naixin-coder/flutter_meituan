import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/avatar.dart';
import 'package:flutter_meituan/common/custom_icondata.dart';
import 'package:flutter_meituan/common/refresh.dart';
import 'package:flutter_meituan/mock/product_mock.dart';
import 'package:flutter_meituan/model/product.dart';
import 'package:flutter_meituan/pages/home/banner.dart';
import 'package:flutter_meituan/pages/home/grid_item.dart';
import 'package:flutter_meituan/pages/home/location.dart';
import 'package:flutter_meituan/pages/home/menus.dart';
import 'package:flutter_meituan/pages/home/search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static EdgeInsetsGeometry topNavPadding = EdgeInsets.all(10.0);
  static double topNavSize = 35.0;
  static EdgeInsetsGeometry bottomPadding =
      EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 10.0);
  static double bottomNavSize = 25.0;
  static TextStyle menuTextStyle =
      TextStyle(color: Color(0xFF6B6A6B), fontSize: 12.0);
  static double navIconSize = 40.0;
  static TextStyle navTextStyle =
      TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600);
  List<Card> cards = [];
  static Products listData = Products([]);

  static List navs = [
    {
      "icon": CustomIconData.scan,
      "size": navIconSize,
      "text": '扫一扫',
      "textStyle": navTextStyle,
    },
    {
      "icon": CustomIconData.paycode,
      "size": navIconSize,
      "text": '付款码',
      "textStyle": navTextStyle,
    },
    {
      "icon": CustomIconData.bike,
      "size": navIconSize,
      "text": '骑车',
      "textStyle": navTextStyle,
      "badge": "骑车点"
    },
    {
      "icon": CustomIconData.bus,
      "size": navIconSize,
      "text": '查公交',
      "textStyle": navTextStyle,
      "badge": "查路线"
    },
  ];

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
        print('外卖');
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
      "color": Colors.white,
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

  List list = [navMenus, navMenusCenter, navMenusBottom];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List bannerImages = [
    RadiusImage(
      'http://img.zcool.cn/community/0180e15970239fa8012193a363de40.jpg@1280w_1l_2o_100sh.jpg',
      type: 'network',
      // width: (ScreenUtil.screenWidth - 50),
      height: 100,
    ),
    RadiusImage(
      'http://img.zcool.cn/community/013c805970239fa8012193a3adeb5c.jpg@1280w_1l_2o_100sh.jpg',
      type: 'network',
      // width: (ScreenUtil.screenWidth - 50),
      height: 100,
    ),
    RadiusImage(
      'http://img.zcool.cn/community/01b056597023a2a8012193a3fa44d7.jpg@2o.jpg',
      type: 'network',
      // width: (ScreenUtil.screenWidth - 50),
      height: 100,
    ),
    RadiusImage(
      'http://img.zcool.cn/community/013c805970239fa8012193a3adeb5c.jpg@2o.jpg',
      type: 'network',
      // width: (ScreenUtil.screenWidth - 50),
      height: 100,
    ),
  ];

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    List json = ProductMock().mockProducts();
    Products list = Products.fromJson(json);
    setState(() {
      listData.data = list.data;
    });
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    List json = ProductMock().mockProducts();
    Products list = Products.fromJson(json);
    setState(() {
      listData.data.addAll(list.data);
    });
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
    List json = ProductMock().mockProducts();
    Products list = Products.fromJson(json);
    listData.data.addAll(list.data);
  }

  static List<Widget> actions = <Widget>[
    Icon(
      Icons.mic,
      color: Colors.black,
      size: 30.0,
    ),
    Container(
      margin: EdgeInsets.only(right: 10.0, left: 10.0),
      child: Icon(
        Icons.add,
        size: 30.0,
        color: Colors.black,
      ),
    )
  ];

  List<Widget> textWidgets(texts) {
    TextStyle textStyles = TextStyle(color: Colors.black, fontSize: 13.0);
    Widget verticalDivider = Container(
      height: 13,
      padding: EdgeInsets.only(bottom: 5.0),
      child: VerticalDivider(
        color: Color(0xFF695205),
        thickness: 1.0,
      ),
    );
    Widget defaultDivider = VerticalDivider();
    Widget defalutText = Text('热搜：', style: textStyles);
    List<Widget> list = [defaultDivider, defalutText];
    for (int i = 0; i < texts.length; i++) {
      list.add(Text(texts[i], style: textStyles));
      if (i < texts.length - 1) list.add(verticalDivider);
    }
    return list;
  }

  Widget tips() {
    const texts = ['火锅', '草莓', '下午茶', '汉堡外卖', 'KTV'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: textWidgets(texts),
    );
  }

  Widget grid() {
    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 4,
      itemCount: listData.data.length,
      itemBuilder: (BuildContext context, int index) {
        return GridItem(
          margin: EdgeInsets.only(
            left: !index.isEven ? 5.0 : 10.0,
            right: index.isEven ? 5.0 : 10.0,
            bottom: 10.0,
          ),
          product: listData.data[index],
        );
      },
      staggeredTileBuilder: (int index) {
        String oldPrice = listData.data[index].oldPrice;
        return StaggeredTile.count(
          2,
          (oldPrice != 'null') ? 2.95 : 3,
        );
      },
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFCF00),
          ),
        ),
        elevation: 0, //去掉Appbar底部阴影
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              child: Avatar(
                  'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg'),
              onTap: () => {print('头像')},
            ),
            Location(
              onTap: () {
                // TODO
                print('定位');
              },
            ),
            Search()
          ],
        ),
        actions: actions,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: DaiyaRefresh(
              backgroundColor: Color(0xFFFFCF00),
              enablePullUp: true,
              controller: _refreshController,
              onRefresh: () {
                _onRefresh();
              },
              onLoading: _onLoading,
              child: SingleChildScrollView(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFFFCF00),
                        Colors.white,
                        Color(0xFFF5F3F5)
                      ],
                      stops: [0.05, 0.15, 1],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 50.0),
                    child: Column(
                      children: <Widget>[
                        tips(),
                        Navs(navs),
                        Menus(list),
                        MeiTuanBanner(
                          bannerImages,
                          height: 100.0,
                          autoplay: true,
                        ),
                        grid(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

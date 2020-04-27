import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/avatar.dart';
import 'package:flutter_meituan/common/custom_icondata.dart';
import 'package:flutter_meituan/common/refresh.dart';
import 'package:flutter_meituan/pages/home/index/banner.dart';
import 'package:flutter_meituan/pages/home/index/menus.dart';
import 'package:flutter_meituan/pages/home/takeout/feat_card.dart';
import 'package:flutter_meituan/pages/home/takeout/header_sliver.dart';
import 'package:flutter_meituan/pages/home/takeout/product.dart';
import 'package:flutter_meituan/pages/home/takeout/recomm_card.dart';
import 'package:flutter_meituan/pages/home/takeout/search.dart';
import 'package:flutter_meituan/pages/home/takeout/select_sliver.dart';
import 'package:flutter_meituan/pages/home/takeout/takeout_menus.dart';
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
  double opacity = 1.0;

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
    _scrollController.addListener(() {
      double offset = _scrollController.offset; // 54
      // print(offset);
      if (offset >= 14 && offset <= 50) {
        setState(() {
          opacity = (50 - offset) / 40;
        });
      } else if (offset < 14) {
        opacity = 1;
      } else if (offset > 50) {
        opacity = 0;
      }
    });
  }

  Widget getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(opacity),
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
          duration: Duration(milliseconds: 0),
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
      flexibleSpace: opacity == 0
          ? FlexibleSpaceBar(
              title: hero,
              titlePadding: EdgeInsets.fromLTRB(50.0, 3.0, 10.0, 10.0),
            )
          : null,
    );
  }

  static Widget _search() => TakeOutSearch(
        searchColor: searchColor,
      );

  Widget _buildSliver() => TakeoutMenus(
        search: hero,
        tags: _getTags(),
        menuCard: menuCard(),
        recommCard: recommCard(),
        featCard: featCard(),
        bannerImages: bannerImages,
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
        delegate: SelectSliverDelegate(
          minHeight: 100.0,
          maxHeight: 100.0,
        ),
      );

  Widget _buildHeader(BuildContext context) => HeaderSliver(opacity: opacity);

  Widget recommCard() => RecommCard();

  Widget featCard() => FeatCard();

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

  Widget product(String imageUrl, String title) =>
      ProductCard(title: title, imageUrl: imageUrl);

  Widget content() => Container(
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
              _buildProductSliver(),
            ],
          ),
        ),
      );

  Widget hero = Hero(
    tag: 'search',
    child: _search(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: content(),
    );
  }
}

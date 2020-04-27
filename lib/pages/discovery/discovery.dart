import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/avatar.dart';
import 'package:flutter_meituan/common/refresh.dart';
import 'package:flutter_meituan/pages/home/index/banner.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 发现页
class DiscoveryPage extends StatefulWidget {
  DiscoveryPage({Key key}) : super(key: key);

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin {
  List<Widget> tabs = <Tab>[];

  TabController controller;
  RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();

    tabs = <Tab>[
      Tab(
        text: "推荐",
      ),
      Tab(
        text: "丽人",
      ),
      Tab(
        text: "旅行",
      ),
      Tab(
        text: "电影",
      ),
      Tab(
        text: "结婚",
      ),
      Tab(
        text: "购物",
      ),
      Tab(
        text: "教培",
      ),
      Tab(
        text: "家装",
      ),
      Tab(
        text: "亲子",
      ),
      Tab(
        text: "医美",
      ),
    ];
    controller =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  void onRefresh() async {
    _refreshController.refreshCompleted();
  }

  void onLoad() async {
    _refreshController.loadComplete();
  }

  Widget grid() => StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) => Card(
          elevation: 0.0,
          borderOnForeground: false,
          shadowColor: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // color: Colors.green,
                width: 1000.0,
                height: 170.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0)),
                  child: Image.network(
                    'http://img.pconline.com.cn/images/upload/upc/tx/photoblog/1111/11/c8/9582570_9582570_1321005609421.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                // child: RichText(text: In),
                child: Text(
                  '住一晚是没住够，有机会会在入住的，总之是',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0,
                  ),
                  maxLines: 2,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Avatar(
                          "http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg",
                          width: 20.0,
                          borderRadius: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            '王芝芝',
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.thumb_up,
                      size: 15.0,
                      color: Color(0xFF7E7D7E),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2.9 : 3.0),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      );

  @override
  Widget build(BuildContext context) {
    Color background = Theme.of(context).primaryColor;
    print(background);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        titleSpacing: 0.0,
        // backgroundColor: Colors.white,
        title: Text(
          '发现',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            child: Container(
              color: Colors.white,
              height: 48.0,
              child: TabBar(
                tabs: tabs,
                labelPadding:
                    EdgeInsets.only(left: 14.0, right: 14.0, top: 0.0),
                unselectedLabelStyle:
                    TextStyle(fontWeight: FontWeight.w500, fontSize: 13.0),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.only(
                  bottom: 5.0,
                  left: 4.0,
                  right: 4.0,
                ),
                controller: controller,
                isScrollable: true,
              ),
            ),
            preferredSize: Size.fromHeight(48.0)),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: DaiyaRefresh(
              // backgroundColor: Color(0xFFF2F0F2),
              controller: _refreshController,
              child: grid(),
              onRefresh: onRefresh,
              onLoading: onLoad,
            ),
          ),
          Center(
            child: Text('丽人'),
          ),
          Center(
            child: Text('旅行'),
          ),
          Center(
            child: Text('电影'),
          ),
          Center(
            child: Text('结婚'),
          ),
          Center(
            child: Text('购物'),
          ),
          Center(
            child: Text('教培'),
          ),
          Center(
            child: Text('家装'),
          ),
          Center(
            child: Text('亲子'),
          ),
          Center(
            child: Text('医美'),
          ),
        ],
      ),
    );
  }
}

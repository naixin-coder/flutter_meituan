import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/avatar.dart';
import 'package:flutter_meituan/common/refresh.dart';
import 'package:flutter_meituan/pages/home/index/banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  RefreshController _refreshController = RefreshController();
  static List<Widget> tabs = <Tab>[];
  TabController controller;

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

  @override
  void initState() {
    super.initState();
    tabs = <Tab>[
      Tab(
        text: '全部',
      ),
      Tab(
        text: '待付款',
      ),
      Tab(
        text: '待使用',
      ),
      Tab(
        text: '待评价',
      ),
      Tab(
        text: '退款/售后',
      ),
    ];
    controller =
        TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  Widget orderItem() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(top: 10.0),
        elevation: 0.0,
        child: Container(
          width: ScreenUtil.screenWidth - 30,
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Avatar(
                        'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg',
                        width: 20.0,
                        borderRadius: 10.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(
                          '渣渣老火锅6-7人餐',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '待评价',
                    style: TextStyle(
                      color: Color(0xFF9A999A),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Divider(
                  height: 2.0,
                ),
              ),
              Row(
                children: [
                  RadiusImage(
                    'http://5b0988e595225.cdn.sohucs.com/images/20200324/b4b76d08711b4d89a6201d0fd7890fc5.jpeg',
                    type: 'network',
                    height: 60.0,
                    borderRadius: 8.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '下单时间：2020-01-21 18:51',
                          style: TextStyle(
                            color: Color(0xFF656365),
                          ),
                        ),
                        Text(
                          '数量：1',
                          style: TextStyle(
                            color: Color(0xFF656365),
                          ),
                        ),
                        Text(
                          '总价：￥218',
                          style: TextStyle(
                            color: Color(0xFF656365),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () {},
                        child: Text(
                          '再来一单',
                          style: TextStyle(
                            color: Color(0xFF565456),
                          ),
                        ),
                      ),
                    ),
                    OutlineButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: () {},
                      child: Text(
                        '评价',
                        style: TextStyle(
                          color: Color(0xFF565456),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        // titleSpacing: 0.0,
        title: Container(
          height: 30.0,
          padding: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            color: Color(0xFFFFFEFF),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Icon(
                  Icons.search,
                  color: Color(0xFF999795),
                ),
              ),
              Text(
                '搜索我的订单',
                style: TextStyle(fontSize: 12.0, color: Color(0xFFA8A7A8)),
              )
            ],
          ),
        ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.white,
            height: 48.0,
            width: ScreenUtil.screenWidth,
            child: TabBar(
              tabs: tabs,
              labelPadding: EdgeInsets.only(left: 18.0, right: 18.0, top: 0.0),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 13.0),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.only(
                bottom: 5.0,
                left: 8.0,
                right: 8.0,
              ),
              controller: controller,
              isScrollable: true,
            ),
          ),
          preferredSize: Size.fromHeight(48.0),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          DaiyaRefresh(
            controller: _refreshController,
            onRefresh: () {
              _refreshController.refreshCompleted();
            },
            onLoading: () {
              _refreshController.loadComplete();
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              color: Color(0xFFF5F3F5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MeiTuanBanner(
                      bannerImages,
                      height: 100.0,
                      autoplay: true,
                      margin: EdgeInsets.only(top: 0.0),
                    ),
                    orderItem(),
                    orderItem(),
                    orderItem(),
                    orderItem(),
                    orderItem(),
                    orderItem(),
                    orderItem(),
                    orderItem(),
                  ],
                ),
              ),
            ),
          ),
          Center(child: Text('待付款')),
          Center(child: Text('待使用')),
          Center(child: Text('待评价')),
          Center(child: Text('退款/售后')),
        ],
      ),
    );
  }
}

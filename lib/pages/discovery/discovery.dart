import 'package:flutter/material.dart';

class DiscoveryPage extends StatefulWidget {
  DiscoveryPage({Key key}) : super(key: key);

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin {
  List<Widget> tabs = <Tab>[];

  TabController controller;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          '发现',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        bottom: TabBar(
          tabs: tabs,
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
          labelStyle: TextStyle(fontWeight: FontWeight.w600),
          labelPadding: EdgeInsets.only(left: 13.5, right: 13.5),
          indicator: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.only(bottom: 5.0, left: 5.0),
          controller: controller,
          isScrollable: true,
        ),
      ),
      body: Center(
        child: Text('发现Z'),
      ),
    );
  }
}

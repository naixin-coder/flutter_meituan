import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/custom_icondata.dart';
import 'package:flutter_meituan/pages/discovery/discovery.dart';
import 'package:flutter_meituan/pages/home/home.dart';
import 'package:flutter_meituan/pages/me/me.dart';
import 'package:flutter_meituan/pages/order/order.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _selectedItemPosition = 0;
  List<Widget> _tabPages = <Widget>[
    HomePage(),
    DiscoveryPage(),
    OrderPage(),
    MePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: Container(
        // padding: EdgeInsets.only(top: 25.0),
        child: _tabPages[_selectedItemPosition],
      ),
      bottomNavigationBar: SnakeNavigationBar(
        style: SnakeBarStyle.floating,
        snakeColor: Theme.of(context).primaryColor,
        snakeShape: SnakeShape.circle,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
        padding: EdgeInsets.all(10.0).copyWith(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedItemPosition,
        onPositionChanged: (index) =>
            setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIconData.discovery),
            title: Text('发现'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIconData.order),
            title: Text('订单'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIconData.me),
            title: Text('我的'),
          )
        ],
      ),
    );
  }
}

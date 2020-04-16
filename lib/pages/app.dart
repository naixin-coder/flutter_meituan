import 'package:flutter/material.dart';
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
        snakeColor: Color(0xFFFFCA2C),
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
            icon: Icon(Icons.store_mall_directory),
            title: Text('商家'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessible),
            title: Text('microphone'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('search'),
          )
        ],
      ),
    );
  }
}

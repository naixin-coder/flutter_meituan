/*
 * @Description: 
 * @Version: 1.0
 * @Autor: 刘林
 * @Date: 2020-05-08 16:07:01
 * @LastEditors: 刘林
 * @LastEditTime: 2020-05-09 09:05:13
 */
import 'package:flutter/material.dart';
import 'package:flutter_meituan/pages/home/index/banner.dart';

class CateContent extends StatefulWidget {
  CateContent({Key key}) : super(key: key);

  @override
  _CateContentState createState() => _CateContentState();
}

class _CateContentState extends State<CateContent>
    with TickerProviderStateMixin {
  List<Widget> tabs = <Tab>[];
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabs = <Tab>[
      Tab(
        text: '优惠',
      ),
      Tab(
        text: '菜品',
      ),
      Tab(
        text: '评价',
      ),
    ];
    tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 210,
          child: TabBar(
            tabs: tabs,
            labelColor: Color(0xFFF35B1A),
            unselectedLabelColor: Color(0xFF333333),
            indicatorPadding: EdgeInsets.only(
              bottom: 5.0,
              left: 2.0,
              right: 2.0,
            ),
            labelStyle: TextStyle(fontSize: 18.0),
            indicatorColor: Color(0xFFF35B1A),
            indicatorSize: TabBarIndicatorSize.label,
            controller: tabController,
          ),
        ),
        Card(
          // elevation: 0.0,
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadiusImage(
                  'http://attachment4.jmw.com.cn/image/2019/03/05/15517703864083.jpg',
                  type: 'network',
                  height: 90.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '[新品] 孜然鸡丁',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          child: Text("11231"),
        ),
        Card(
          child: Text("11231"),
        ),
        // TabBarView(
        //   controller: tabController,
        //   children: [
        //     Card(
        //       child: Text("11231"),
        //     ),
        //     Card(
        //       child: Text("11231"),
        //     ),
        //     Card(
        //       child: Text("11231"),
        //     ),
        //   ],
        // )
      ],
    );
  }
}

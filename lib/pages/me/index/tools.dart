import 'package:flutter/material.dart';
import 'package:flutter_meituan/pages/home/index/menus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tools extends StatelessWidget {
  const Tools(this.list, {Key key}) : super(key: key);
  final List list;

  List<Widget> menuItems(items) {
    List<Widget> list = [];
    // icon,backgroundColor,text
    for (var item in items) {
      Widget widget = Container(
        width: (ScreenUtil.mediaQueryData.size.width - 60.0) / 4,
        child: MenuItem(
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
        ),
      );
      list.add(widget);
    }
    return list;
  }

  List<Widget> menus(menuList) {
    List<Widget> rows = [];
    for (var menu in menuList) {
      Widget widget = Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: menuItems(menu),
      );
      rows.add(widget);
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
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
}

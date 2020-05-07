import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/custom_icon.dart';

class MenuItem extends StatelessWidget {
  const MenuItem(this.text,
      {Key key,
      this.icon,
      this.iconSize: 12,
      this.iconPadding: EdgeInsets.zero,
      this.iconColor: Colors.black,
      this.borderRadius: 15,
      this.backgroundColor: Colors.white,
      this.useCustomIcon: false,
      this.textPadding: EdgeInsets.zero,
      this.callback,
      this.textStyle,
      this.badge})
      : super(key: key);

  final String text; // 菜单下的文字
  final IconData icon; // 菜单里的iconData
  final double iconSize; // icon的大小
  final Color iconColor; // icon颜色
  final EdgeInsetsGeometry iconPadding; // icon的padding
  final double borderRadius; // icon 背景的圆角
  final Color backgroundColor; // icon的背景颜色
  final bool useCustomIcon; // 是否使用自定义icon
  final EdgeInsetsGeometry textPadding; // 名称和icon之间的padding
  final Function callback; // 点击事件回调函数
  final TextStyle textStyle;
  final String badge;

  @override
  Widget build(BuildContext context) {
    Widget customIcon = CustomIcon(
      icon,
      size: iconSize,
      color: iconColor,
      padding: iconPadding,
      borderRadius: BorderRadius.circular(borderRadius),
      backgroundColor: backgroundColor,
    );

    Widget iconItem = Icon(
      icon,
      size: iconSize,
      color: iconColor,
    );

    Widget padding = Padding(
      padding: textPadding,
    );

    Text textItem = Text(
      text,
      style: textStyle,
    );

    List<Widget> column = [];

    if (icon is IconData) {
      Widget iconWidget;
      Widget badgeWidget;
      if (useCustomIcon) {
        iconWidget = customIcon;
      } else {
        iconWidget = iconItem;
      }
      if (badge is String) {
        badgeWidget = Badge(
          shape: BadgeShape.square,
          borderRadius: 20,
          padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 2.0),
          badgeContent: Text(
            badge,
            style: TextStyle(color: Colors.white, fontSize: 10.0),
          ),
          child: iconWidget,
        );
        column.add(badgeWidget);
      } else {
        column.add(iconWidget);
      }
      column.add(padding);
    }
    column.add(textItem);

    return GestureDetector(
      onTap: callback,
      child: Column(
        children: column,
      ),
    );
  }
}

class Menus extends StatelessWidget {
  const Menus(
    this.menuList, {
    Key key,
    this.padding,
    this.borderRadius,
    this.margin,
  }) : super(key: key);

  final List menuList;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry margin;

  List<Widget> menuItems(items) {
    List<Widget> list = [];
    // icon,backgroundColor,text
    for (var item in items) {
      Widget widget = MenuItem(
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
      );
      list.add(widget);
    }
    return list;
  }

  List<Widget> menus() {
    List<Widget> rows = [];
    for (var menu in menuList) {
      Widget widget = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: menuItems(menu),
      );
      rows.add(widget);
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    print(padding is EdgeInsetsGeometry);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: (borderRadius is BorderRadius)
              ? borderRadius
              : BorderRadius.circular(20.0),
        ),
        elevation: 0,
        margin: margin,
        child: Padding(
          padding: (padding is EdgeInsetsGeometry)
              ? padding
              : EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
          child: Column(children: menus()),
        ));
  }
}

class Navs extends StatelessWidget {
  const Navs(this.navs, {Key key}) : super(key: key);

  final List navs;

  List<Widget> navItems() {
    List<Widget> list = [];
    for (var nav in navs) {
      dynamic badge = nav["badge"] is String ? nav["badge"] : null;
      dynamic callback = nav["callback"] is Function ? nav["callback"] : null;
      Widget item = MenuItem(
        nav["text"],
        icon: nav["icon"],
        iconSize: nav["size"],
        textStyle: nav["textStyle"],
        badge: badge,
        callback: callback,
      );
      list.add(item);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 20.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: navItems()),
    );
  }
}

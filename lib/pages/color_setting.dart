import 'package:flutter/material.dart';
import 'package:flutter_meituan/provider/theme-provider.dart';
import 'package:provider/provider.dart';

class ColorSetting extends StatefulWidget {
  @override
  _ColorSettingState createState() => _ColorSettingState();
}

class _ColorSettingState extends State<ColorSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('切换主题'),
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => {
                Provider.of<ThemeState>(context, listen: false)
                    .changeThemeData(ThemeData(primaryColor: Colors.blue))
              },
              child: Chip(
                backgroundColor: Colors.blue,
                label: Text('蓝色'),
              ),
            ),
            GestureDetector(
              onTap: () => {
                Provider.of<ThemeState>(context, listen: false)
                    .changeThemeData(ThemeData(primaryColor: Colors.red))
              },
              child: Chip(
                backgroundColor: Colors.red,
                label: Text('红色'),
              ),
            ),
            GestureDetector(
              onTap: () => {
                Provider.of<ThemeState>(context, listen: false)
                    .changeThemeData(ThemeData(primaryColor: Colors.yellow))
              },
              child: Chip(
                backgroundColor: Colors.yellow,
                label: Text('黄色'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

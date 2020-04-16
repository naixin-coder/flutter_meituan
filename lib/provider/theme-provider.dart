import 'package:flutter/material.dart';

class ThemeState extends ChangeNotifier {
  ThemeData _themeData; // 主题

  ThemeState(this._themeData);

  void changeThemeData(ThemeData themeData) {
    print(1222);
    _themeData = themeData;
    notifyListeners();
  }

  ThemeData get themeData => _themeData; //获取主题
}

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meituan/pages/app.dart';
import 'package:flutter_meituan/pages/color_setting.dart';
import 'package:flutter_meituan/pages/takeout/takeout.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppPage();
});

var takeoutHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Takeout();
});

var colorSettingHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ColorSetting();
});

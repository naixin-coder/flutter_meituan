import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meituan/config/routes_init.dart';
import 'color_setting.dart';

class MeRoutes extends IRouterProvider {
  static String colorSetting = 'me/color-setting';
  @override
  void initRouter(Router router) {
    router.define(colorSetting, handler: colorSettingHandler);
  }
}

var colorSettingHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ColorSetting();
});

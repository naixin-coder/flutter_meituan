import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meituan/config/route_handler.dart';

class Routes {
  static String root = "index";
  static String takeout = "takeout";
  static String colorSetting = "color-setting";
  static String taxi = "taxi";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(takeout, handler: takeoutHandler);
    router.define(colorSetting, handler: colorSettingHandler);
    router.define(taxi, handler: taxiHandle);
  }
}

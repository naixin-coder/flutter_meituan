import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meituan/config/routes_init.dart';
// import 'package:flutter_meituan/config/route_handler.dart';
import 'package:flutter_meituan/pages/app.dart';
import 'package:flutter_meituan/pages/home/home_route.dart';
import 'package:flutter_meituan/pages/me/me_route.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppPage();
});

class Routes {
  static String root = "root";
  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc: (_, __) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);

    // 首页
    _listRouter.add(HomesRoutes());
    _listRouter.add(MeRoutes());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}

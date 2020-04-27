import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_meituan/pages/app.dart';
import 'package:provider/provider.dart';
import 'package:flutter_meituan/provider/theme-provider.dart';

import 'config/application.dart';
import 'config/routes.dart';

// void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final initThemeData = ThemeData(
      //初始主题
      primaryColor: Color(0xFFFFCF00),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeState(initThemeData),
        )
      ],
      child: Consumer<ThemeState>(builder: (_, state, __) {
        return MaterialApp(
          title: 'Flutter美团',
          // routes: {
          //   "index": (context) => AppPage(),
          // },
          onGenerateRoute: Application.router.generator,
          theme: state.themeData,
          home: AppPage(),
          // home: Splash(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}

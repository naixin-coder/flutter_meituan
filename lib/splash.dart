import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int splashIndex = 0;
  Widget container = Container();

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "http://hbimg.b0.upaiyun.com/76c50102fdac8c3b4a5e1994fd14d635956118c4206e2-gxks1G_fw658",
      "http://hbimg.huabanimg.com/cd9cb775e3d75449ee892283e7b122b8154b78f729356e-bdAndl_fw658",
    ];

    return new Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          children: <Widget>[
            Swiper(
              itemCount: images.length,
              loop: false,
              index: splashIndex,
              itemBuilder: (BuildContext context, int index) => Image.network(
                images[index],
                fit: BoxFit.fill,
              ),
              onIndexChanged: (int index) {
                setState(() {
                  splashIndex = index;
                  if (index == images.length - 1) {
                    container = Positioned(
                      top: 25.0,
                      right: 10.0,
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed("index");
                        },
                        child: Text(
                          '跳过',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  } else {
                    container = Container();
                  }
                });
              },
            ),
            container
          ],
        ),
      ),
    );
  }
}

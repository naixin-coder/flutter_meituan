import 'package:flutter/material.dart';
import 'package:flutter_meituan/pages/home/banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FeatCard extends StatelessWidget {
  const FeatCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
      elevation: 0.0,
      child: Container(
        height: 260,
        padding: EdgeInsets.only(bottom: 10.0),
        width: ScreenUtil.mediaQueryData.size.width - 30,
        child: Swiper(
          itemBuilder: (_, int index) {
            return Stack(
              children: [
                RadiusImage(
                  'http://www.hb-flavors.com/uploadfiles/%E8%B0%83%E5%91%B3%E6%96%99/201510251215161516.jpg',
                  type: 'network',
                  height: 260,
                  width: ScreenUtil.mediaQueryData.size.width - 30,
                  borderRadius: 5.0,
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 180,
                    padding: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
                    width: ScreenUtil.mediaQueryData.size.width - 30,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '全城免配送，特价吃大鸡翅',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RadiusImage(
                                'http://www.hb-flavors.com/uploadfiles/%E8%B0%83%E5%91%B3%E6%96%99/201510251215161516.jpg',
                                type: 'network',
                                height: 80,
                                borderRadius: 5.0,
                              ),
                              RadiusImage(
                                'http://www.hb-flavors.com/uploadfiles/%E8%B0%83%E5%91%B3%E6%96%99/201510251215161516.jpg',
                                type: 'network',
                                height: 80,
                                borderRadius: 5.0,
                              ),
                              RadiusImage(
                                'http://www.hb-flavors.com/uploadfiles/%E8%B0%83%E5%91%B3%E6%96%99/201510251215161516.jpg',
                                type: 'network',
                                height: 80,
                                borderRadius: 5.0,
                              ),
                            ],
                          ),
                        ),
                        Text('￥69元')
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30.0,
                  child: Container(
                    height: 55.0,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        RadiusImage(
                          'http://pic1.win4000.com/pic/8/f2/2d23855536.jpg',
                          type: 'network',
                          height: 50.0,
                          width: 50.0,
                          borderRadius: 5.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                // padding: EdgeInsets.only(right: 100.0),
                                width: 250.0,
                                child: Text(
                                  '霹雳火烧烤.龙虾,江湖菜,特色干锅',
                                  style: TextStyle(
                                      fontSize: 18.0, color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 5.0, bottom: 5.0),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          color: Color(0xFFFF5340),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              8.0, 0.0, 8.0, 2.0),
                                          child: Text(
                                            '22减5',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 5.0, bottom: 5.0),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          color: Color(0xFFFF5340),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              8.0, 0.0, 8.0, 2.0),
                                          child: Text(
                                            '40减18',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 5.0, bottom: 5.0),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          color: Color(0xFFFF5340),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              8.0, 0.0, 8.0, 2.0),
                                          child: Text(
                                            '65减28',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 5.0, bottom: 5.0),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          color: Color(0xFFFF5340),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              8.0, 0.0, 8.0, 2.0),
                                          child: Text(
                                            '5元优惠券',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: 2,
        ),
      ),
    );
  }
}

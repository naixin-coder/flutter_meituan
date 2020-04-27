import 'package:flutter/material.dart';
import 'package:flutter_meituan/pages/home/index/banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommCard extends StatelessWidget {
  const RecommCard({Key key}) : super(key: key);

  Widget recommItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '限时免费',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            "距本场结束",
            style: TextStyle(color: Color(0xFFEE534B), fontSize: 12.0),
          ),
          RadiusImage(
            'http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1403/30/c38/32630185_1396185964905_mthumb.jpg',
            type: 'network',
            borderRadius: 5.0,
            height: 80.0,
            width: ((ScreenUtil.mediaQueryData.size.width - 70) / 2),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: Container(
        height: 265.0,
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                recommItem(),
                Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '超值工作餐',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          "低至9.9元",
                          style: TextStyle(
                              color: Color(0xFF999695), fontSize: 12.0),
                        ),
                        RadiusImage(
                          'http://img.pconline.com.cn/images/upload/upc/tx/itbbs/1403/30/c38/32630185_1396185964905_mthumb.jpg',
                          type: 'network',
                          borderRadius: 5.0,
                          height: 60.0,
                          width:
                              ((ScreenUtil.mediaQueryData.size.width - 70) / 2),
                        ),
                      ],
                    )),
              ],
            ),
            VerticalDivider(
              width: 20.0,
              indent: 10.0,
              endIndent: 10.0,
              color: Color(0xFFF9F7F9),
              thickness: 1.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '大牌特惠',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      "解锁高分美食",
                      style:
                          TextStyle(color: Color(0xFF999695), fontSize: 12.0),
                    ),
                    RadiusImage(
                      'http://img1.juimg.com/161023/330777-1610230H14338.jpg',
                      type: 'network',
                      borderRadius: 5.0,
                      height: 80.0,
                      width: ((ScreenUtil.mediaQueryData.size.width - 70) / 2),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  width: ((ScreenUtil.mediaQueryData.size.width - 70) / 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '大额满减',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            "超值推荐",
                            style: TextStyle(
                                color: Color(0xFF999695), fontSize: 12.0),
                          ),
                          RadiusImage(
                            'http://img1.juimg.com/161023/330777-1610230H14338.jpg',
                            type: 'network',
                            borderRadius: 5.0,
                            height: 60.0,
                            width:
                                ((ScreenUtil.mediaQueryData.size.width - 80) /
                                    4),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '美食榜单',
                            style: TextStyle(fontSize: 18.0),
                          ),
                          Text(
                            "让选择变简单",
                            style: TextStyle(
                                color: Color(0xFF999695), fontSize: 12.0),
                          ),
                          RadiusImage(
                            'http://img1.juimg.com/161023/330777-1610230H14338.jpg',
                            type: 'network',
                            borderRadius: 5.0,
                            height: 60.0,
                            width:
                                ((ScreenUtil.mediaQueryData.size.width - 80) /
                                    4),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

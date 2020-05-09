/*
 * @Description: 
 * @Version: 1.0
 * @Autor: 刘林
 * @Date: 2020-05-08 11:12:35
 * @LastEditors: 刘林
 * @LastEditTime: 2020-05-08 14:56:31
 */
import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/score.dart';
import 'package:flutter_meituan/common/tag.dart';
import 'package:flutter_meituan/pages/home/index/banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CateHeader extends StatelessWidget {
  const CateHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('乡村基（杨柳路店）',
                    style:
                        TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600)),
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  padding: EdgeInsets.fromLTRB(5.0, 2.0, 5.0, 3.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFFFCD067),
                      Color(0xFFFC9A02),
                    ]),
                  ),
                  child: Text(
                    '连锁',
                    style: TextStyle(color: Colors.white, fontSize: 10.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadiusImage(
                    'http://youimg1.c-ctrip.com/target/100a0k000000cdu006827.jpg',
                    type: 'network',
                    height: 90.0,
                    borderRadius: 3.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Score(4.6, 5, size: 15.0, color: Color(0xFFFF6A16)),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                '4.9分',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                '(192人评)',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Text(
                                '￥',
                                style: TextStyle(fontSize: 10.0),
                              ),
                              Text(
                                '22/人',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Text(
                                  '客流指数',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Tag(
                                '回头客多',
                                backgroundColor: Color(0xFFFFF2EB),
                                color: Color(0xFFF7814F),
                                borderColor: Color(0xFFFFF2EB),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Tag(
                                  '公益商家',
                                  backgroundColor: Color(0xFFFFF2EB),
                                  color: Color(0xFFF7814F),
                                  borderColor: Color(0xFFFFF2EB),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: ScreenUtil.mediaQueryData.size.width - 160,
                    child: Text(
                      '渝北区杨柳路3号1幢（重科院A院）距您步行410m>',
                      style: TextStyle(fontSize: 12.0),
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      children: [
                        Icon(Icons.directions_car),
                        Text(
                          '打车',
                          style: TextStyle(fontSize: 10.0),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.phone),
                      Text(
                        '联系商家',
                        style: TextStyle(fontSize: 10.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Text(
                    '外卖',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Color(0xFF7B7B7B),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(children: [
                Text(
                  "营业中",
                  style: TextStyle(fontSize: 12.0),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text('09:00-22:00'),
                ),
                Text(
                  '更多信息',
                  style: TextStyle(fontSize: 12.0),
                ),
                Icon(
                  Icons.chevron_right,
                  color: Color(0xFF7B7B7B),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

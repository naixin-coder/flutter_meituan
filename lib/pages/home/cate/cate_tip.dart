/*
 * @Description: 
 * @Version: 1.0
 * @Autor: 刘林
 * @Date: 2020-05-08 15:09:58
 * @LastEditors: 刘林
 * @LastEditTime: 2020-05-08 16:05:18
 */
import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/tag.dart';

class CateTip extends StatelessWidget {
  const CateTip({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Tag(
                  '安心餐厅',
                  color: Color(0xFF402800),
                  fontSize: 12.0,
                  backgroundColor: Color(0xFFFDC636),
                  borderColor: Color(0xFFFDC636),
                  fontWeight: FontWeight.w600,
                  borderRadius: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 15.0,
                        color: Color(0xFF343434),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: Text('今日消毒',
                            style: TextStyle(
                              fontSize: 12.0,
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 15.0,
                        color: Color(0xFF343434),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: Text('全员测温',
                            style: TextStyle(
                              fontSize: 12.0,
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 15.0,
                        color: Color(0xFF343434),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.0),
                        child: Text(
                          '分散就餐',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Icon(Icons.chevron_right, color: Color(0xFF363636)),
          ],
        ),
      ),
    );
  }
}

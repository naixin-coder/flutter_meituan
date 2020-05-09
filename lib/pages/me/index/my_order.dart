import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/custom_icondata.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(0.0),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '我的订单',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '查看全部订单',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF9A989A),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 20.0,
                      color: Color(0xFF9A989A),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        CustomIconData.daifk,
                        color: Color(0xFFFFBA03),
                        size: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          '待付款',
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        CustomIconData.daisy,
                        color: Color(0xFFFFBA03),
                        size: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          '待使用',
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        CustomIconData.daipj,
                        color: Color(0xFFFFBA03),
                        size: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          '待评价',
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        CustomIconData.tuikuan,
                        color: Color(0xFFFFBA03),
                        size: 30.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0),
                        child: Text(
                          '退款/售后',
                          style: TextStyle(fontSize: 13.0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

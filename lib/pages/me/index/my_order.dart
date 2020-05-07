import 'package:flutter/material.dart';

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
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.payment,
                        color: Color(0xFFFFBA03),
                        size: 40.0,
                      ),
                      Text(
                        '待付款',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.payment,
                        color: Color(0xFFFFBA03),
                        size: 40.0,
                      ),
                      Text(
                        '待使用',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.payment,
                        color: Color(0xFFFFBA03),
                        size: 40.0,
                      ),
                      Text(
                        '待评价',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.payment,
                        color: Color(0xFFFFBA03),
                        size: 40.0,
                      ),
                      Text(
                        '退款/售后',
                        style: TextStyle(fontSize: 13.0),
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

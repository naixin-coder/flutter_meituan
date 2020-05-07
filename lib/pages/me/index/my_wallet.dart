import 'package:flutter/material.dart';

class MyWallet extends StatelessWidget {
  const MyWallet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '我的钱包',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      '进入钱包',
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
                      Row(
                        // crossAxisAlignment: ,
                        children: [
                          Text(
                            '3.84',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '万',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 3.0),
                        child: Text(
                          '借钱',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w100),
                        ),
                      ),
                      Text(
                        '大约可借',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFB9B8B9),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '218',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '元',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 3.0),
                        child: Text(
                          '账单',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w100),
                        ),
                      ),
                      Text(
                        '最近支付',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFB9B8B9),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        // crossAxisAlignment: ,
                        children: [
                          Text(
                            '5',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '元',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 3.0),
                        child: Text(
                          '免费领红包',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w100),
                        ),
                      ),
                      Text(
                        '全场通用',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFB9B8B9),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        // crossAxisAlignment: ,
                        children: [
                          Text(
                            '254',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '元',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 3.0),
                        child: Text(
                          '美食享优惠',
                          style: TextStyle(
                              fontSize: 13.0, fontWeight: FontWeight.w100),
                        ),
                      ),
                      Text(
                        '最高随机减',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFFB9B8B9),
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

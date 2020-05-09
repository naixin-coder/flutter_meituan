import 'package:flutter/material.dart';

class Interactive extends StatelessWidget {
  const Interactive({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '互动签到',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '袋鼠快跑',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  '领大额外面红包',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Color(0xFFE74B00),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Image.network(
                              'http://img1.juimg.com/160307/330720-16030H2314293.jpg',
                              width: 60.0,
                              height: 60.0,
                            ),
                          ),
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.black,
                        width: 1.0,
                        thickness: 1.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '小美果园',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Text(
                                  '玩游戏领取水果',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Color(0xFFE74B00),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Image.network(
                              'http://www.efesco.com/benefit/tickies/photos/1386814486658.jpg',
                              width: 60.0,
                              height: 60.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '红包签到',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    '连签7天对红包',
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Color(0xFFE74B00),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Image.network(
                                'http://img.mp.itc.cn/upload/20170128/99575c380ab948a5a8abc32340ffac4a.gif',
                                width: 60.0,
                                height: 60.0,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          width: 1.0,
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '邀请有礼',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(
                                    '分享得20元优惠',
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: Color(0xFFE74B00),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: Image.network(
                                'http://hbimg.b0.upaiyun.com/23e307530ca764c4f75ffd0bde8844777048f32c516f-y7bpuz_fw658',
                                width: 60.0,
                                height: 60.0,
                              ),
                            ),
                          ],
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
    );
  }
}

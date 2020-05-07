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
                              'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg',
                              width: 40.0,
                              height: 40.0,
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
                              'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg',
                              width: 40.0,
                              height: 40.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
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
                                'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg',
                                width: 40.0,
                                height: 40.0,
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
                                'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg',
                                width: 40.0,
                                height: 40.0,
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

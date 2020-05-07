import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      color: Color(0xFFF5F3F5),
      child: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 35.0,
                    ),
                    Text('收藏'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 35.0,
                    ),
                    Text('收藏'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 35.0,
                    ),
                    Text('收藏'),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.star_border,
                      size: 35.0,
                    ),
                    Text('收藏'),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            child: Card(
              shadowColor: Color(0xFFD6D5D6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0.1,
              margin: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                width: ScreenUtil.mediaQueryData.size.width - 30.0,
                padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add_alert,
                          color: Color(0xFFFFAD02),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            '点击进入消息中心',
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Color(0xFFD6D5D6),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_meituan/pages/home/banner.dart';
import 'package:flutter_screenutil/screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key key, this.title, this.imageUrl}) : super(key: key);

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadiusImage(
              imageUrl,
              type: 'network',
              width: 90.0,
              height: 67.5,
              borderRadius: 5.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  width: ScreenUtil.mediaQueryData.size.width - 170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Color(0xFFCDCBCB),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 5.0),
                  width: ScreenUtil.mediaQueryData.size.width - 170,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.star,
                              size: 12.0, color: Color(0xFFFFA002)),
                          Text(
                            '4.8',
                            style: TextStyle(
                              color: Color(0xFFFFA002),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Text(
                              '月售5770',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Color(0xFF57585B),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '54分钟 4.0km',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF57585B),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 5.0),
                  width: ScreenUtil.mediaQueryData.size.width - 170,
                  child: Row(
                    children: [
                      Text(
                        '起送￥15',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF57585B),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                        child: Text(
                          '配送￥15',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Color(0xFF57585B),
                          ),
                        ),
                      ),
                      Text(
                        '人均￥15',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Color(0xFF57585B),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 5.0),
                  width: ScreenUtil.mediaQueryData.size.width - 170,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF7E1),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Text(
                          '江北区奶茶果汁人气第3名',
                          style: TextStyle(
                            color: Color(0xFFFDA71C),
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.0),
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFF0EA),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Text(
                          '点评高分店铺',
                          style: TextStyle(
                            color: Color(0xFFFE7436),
                            fontSize: 11.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 21.0,
                  margin: EdgeInsets.only(left: 10.0, top: 5.0),
                  // width: ScreenUtil.mediaQueryData.size.width - 170,
                  padding: EdgeInsets.fromLTRB(3.0, 1.0, 3.0, 2.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFF5E7E8),
                    ),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '28减2',
                        style: TextStyle(
                          color: Color(0xFFEA583C),
                          fontSize: 11.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: VerticalDivider(
                          width: 1.0,
                          indent: 3.0,
                          endIndent: 2.0,
                          color: Color(0xFFEFE0E1),
                          // thickness: 1.0,
                        ),
                      ),
                      Text(
                        '38减3',
                        style: TextStyle(
                          color: Color(0xFFEA583C),
                          fontSize: 11.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: VerticalDivider(
                          width: 1.0,
                          indent: 3.0,
                          endIndent: 2.0,
                          color: Color(0xFFEFE0E1),
                          // thickness: 1.0,
                        ),
                      ),
                      Text(
                        '58减5',
                        style: TextStyle(
                          color: Color(0xFFEA583C),
                          fontSize: 11.0,
                        ),
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

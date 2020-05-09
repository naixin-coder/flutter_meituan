/*
 * @Description: 
 * @Version: 1.0
 * @Autor: 刘林
 * @Date: 2020-04-16 15:54:55
 * @LastEditors: 刘林
 * @LastEditTime: 2020-05-08 15:16:32
 */
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag(this.text,
      {Key key,
      this.color: Colors.black,
      this.borderColor: Colors.black,
      this.backgroundColor: Colors.white,
      this.fontSize: 11.0,
      this.fontWeight,
      this.borderRadius: 3.0})
      : super(key: key);

  final String text;
  final Color color;
  final Color borderColor;
  final Color backgroundColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.0),
      padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 1.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          width: 0.5,
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        style:
            TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight),
      ),
    );
  }
}

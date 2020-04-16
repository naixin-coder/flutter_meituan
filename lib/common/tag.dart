import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag(
    this.text, {
    Key key,
    this.color: Colors.black,
    this.borderColor: Colors.black,
    this.backgroundColor: Colors.white,
  }) : super(key: key);

  final String text;
  final Color color;
  final Color borderColor;
  final Color backgroundColor;

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
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.0,
          color: color,
        ),
      ),
    );
  }
}

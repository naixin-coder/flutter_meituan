import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({Key key,this.onTap}) : super(key: key);
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        height: 40.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "重庆",
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            Text(
              "阴 19℃",
              style: TextStyle(fontSize: 10.0, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

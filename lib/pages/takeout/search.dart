import 'package:flutter/material.dart';

class TakeOutSearch extends StatelessWidget {
  const TakeOutSearch({Key key, this.searchColor}) : super(key: key);

  final Color searchColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("搜索");
      },
      child: Container(
        height: 40.0,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xFFF2F0F2),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.search,
                color: searchColor,
              ),
            ),
            Text(
              '煎饼摊  满20减15',
              style: TextStyle(fontSize: 12.0, color: searchColor),
            )
          ],
        ),
      ),
    );
  }
}

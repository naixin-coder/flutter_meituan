/*
 * @Description: 
 * @Version: 1.0
 * @Autor: 刘林
 * @Date: 2020-05-08 11:40:02
 * @LastEditors: 刘林
 * @LastEditTime: 2020-05-08 11:44:43
 */

import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score(
    this.score,
    this.total, {
    Key key,
    this.color: Colors.redAccent,
    this.size: 10.0,
  }) : super(key: key);
  final double score;
  final int total;
  final Color color;
  final double size;

  List<Widget> _getGradeStar(double score, int total) {
    List<Widget> _list = List<Widget>();
    for (var i = 0; i < total; i++) {
      double factor = (score - i);
      if (factor >= 1) {
        factor = 1.0;
      } else if (factor < 0) {
        factor = 0;
      }
      Stack _st = Stack(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.grey,
            size: size,
          ),
          ClipRect(
              child: Align(
            alignment: Alignment.topLeft,
            widthFactor: factor,
            child: Icon(
              Icons.star,
              color: color,
              size: size,
            ),
          ))
        ],
      );
      _list.add(_st);
    }
    return _list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _getGradeStar(score, total),
    );
  }
}

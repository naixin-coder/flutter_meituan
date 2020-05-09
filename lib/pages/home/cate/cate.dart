/*
 * @Description: 
 * @Version: 1.0
 * @Autor: 刘林
 * @Date: 2020-05-08 10:06:11
 * @LastEditors: 刘林
 * @LastEditTime: 2020-05-08 16:26:45
 */
import 'package:flutter/material.dart';
import 'package:flutter_meituan/common/custom_icondata.dart';
import 'package:flutter_meituan/common/refresh.dart';
import 'package:flutter_meituan/pages/home/cate/cate_content.dart';
import 'package:flutter_meituan/pages/home/cate/cate_header.dart';
import 'package:flutter_meituan/pages/home/cate/cate_tip.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CatePage extends StatefulWidget {
  CatePage({Key key}) : super(key: key);

  @override
  _CatePageState createState() => _CatePageState();
}

class _CatePageState extends State<CatePage> {
  RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFF9F9F9),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0, left: 5.0),
            child: GestureDetector(
              child: Icon(
                CustomIconData.fenxiang,
                size: 20.0,
                color: Color(0xFF666666),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.0, left: 5.0),
            child: GestureDetector(
              child: Icon(
                CustomIconData.shoucang,
                size: 20.0,
                color: Color(0xFF666666),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0, left: 10.0),
            child: GestureDetector(
              child: Icon(
                Icons.more_horiz,
                color: Color(0xFF666666),
              ),
            ),
          )
        ],
      ),
      body: DaiyaRefresh(
        backgroundColor: Color(0xFFF9F9F9),
        controller: _refreshController,
        onRefresh: () {
          _refreshController.refreshCompleted();
        },
        onLoading: () {
          _refreshController.loadComplete();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CateHeader(),
              CateTip(),
              CateContent(),
            ],
          ),
        ),
      ),
    );
  }
}

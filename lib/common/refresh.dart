import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DaiyaRefresh extends StatefulWidget {
  DaiyaRefresh({
    Key key,
    this.child,
    this.controller,
    this.onRefresh,
    this.onLoading,
    this.enablePullUp = true,
    this.backgroundColor: Colors.white,
  }) : super(key: key);

  final Widget child;

  final Function onRefresh;
  final Function onLoading;
  final RefreshController controller;
  final enablePullUp;
  final backgroundColor;

  @override
  _DaiyaRefreshState createState() => _DaiyaRefreshState();
}

class _DaiyaRefreshState extends State<DaiyaRefresh> {
  void _onRefresh() {
    widget.onRefresh();
  }

  void _onLoading() {
    widget.onLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          stops: [0.5, 0.6, 1],
          colors: [widget.backgroundColor, Colors.white, Color(0xFFF5F3F5)],
        ),
      ),
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: widget.enablePullUp,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松开加载更多");
            } else {
              body = Text("已经到底了");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: widget.controller,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: widget.child,
      ),
    );
  }
}

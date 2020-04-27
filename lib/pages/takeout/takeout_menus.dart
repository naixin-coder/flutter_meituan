import 'package:flutter/material.dart';
import 'package:flutter_meituan/pages/home/banner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TakeoutMenus extends StatelessWidget {
  const TakeoutMenus({
    Key key,
    this.search,
    this.tags,
    this.menuCard,
    this.recommCard,
    this.featCard,
    this.bannerImages,
  }) : super(key: key);

  final Widget search;
  final List<Widget> tags;
  final Widget menuCard;
  final Widget recommCard;
  final Widget featCard;
  final List bannerImages;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFFAF8FA), Color(0xFFF6F4F6)],
            stops: [0, 0.7],
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
            search,
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                children: tags,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: RadiusImage(
                'http://img.zcool.cn/community/0180e15970239fa8012193a363de40.jpg@1280w_1l_2o_100sh.jpg',
                type: 'network',
                height: 100,
                width: ScreenUtil.screenWidth - 30.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0), child: menuCard),
            MeiTuanBanner(
              bannerImages,
              height: 100.0,
              autoplay: true,
              margin: EdgeInsets.only(top: 10.0),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: recommCard,
            ),
            featCard,
          ],
        ),
      ),
    );
  }
}

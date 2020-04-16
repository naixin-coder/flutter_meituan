import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MeiTuanBanner extends StatelessWidget {
  const MeiTuanBanner(this.bannerList,
      {Key key,
      this.height,
      this.autoplay: false,
      this.scrollDirection: Axis.horizontal})
      : super(key: key);

  final List bannerList;
  final double height;
  final bool autoplay;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 10.0),
      child: Container(
        height: height,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return bannerList[index];
          },
          itemCount: bannerList.length,
          scrollDirection: scrollDirection,
          autoplay: autoplay,
        ),
      ),
    );
  }
}

class RadiusImage extends StatelessWidget {
  const RadiusImage(
    this.url, {
    Key key,
    this.borderRadius: 15.0,
    this.width,
    this.height,
    this.type,
  }) : super(key: key);

  final dynamic url;
  final double borderRadius;
  final double width;
  final double height;
  final String type;

  Widget image() {
    switch (type) {
      case 'network':
        return Image.network(
          url,
          width: width,
          height: height,
          fit: BoxFit.fill,
        );
      case 'assets':
        return Image.asset(
          url,
          width: width,
          height: height,
          fit: BoxFit.fill,
        );
      case 'file':
        return Image.file(
          url,
          width: width,
          height: height,
          fit: BoxFit.fill,
        );
      case 'network':
        return Image.memory(
          url,
          width: width,
          height: height,
          fit: BoxFit.fill,
        );
      default:
        return Image.asset(
          url,
          width: width,
          height: height,
          fit: BoxFit.fill,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: image(),
    );
  }
}

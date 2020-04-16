import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar(this.imageUrl,
      {Key key, this.width: 40.0, this.borderRadius: 20.0})
      : super(key: key);

  final String imageUrl;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(imageUrl, width: width),
    );
  }
}

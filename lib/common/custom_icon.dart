import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(this.icon,
      {Key key,
      this.size = 10.0,
      this.color,
      this.padding,
      this.backgroundColor,
      this.borderRadius})
      : super(key: key);

  final IconData icon;
  final double size;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: Icon(icon, size: size, color: color));
  }
}

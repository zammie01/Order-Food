import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/utils/dimesions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;

  AppIcon(
      {Key? key,
      required this.icon,
      this.iconColor = const Color(0xFF756d54),
      this.size = 40,
      this.backgroundColor = const Color(0xFFFFFFFF)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize16,
      ),
    );
  }
}

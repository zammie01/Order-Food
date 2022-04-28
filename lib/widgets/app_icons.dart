import 'package:flutter/cupertino.dart';
import 'package:food_order/utils/dimesions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;

  AppIcon(
      {Key? key,
      required this.icon,
      this.iconColor = const Color(0xFF756d54),
      this.size = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize16,
      ),
    );
  }
}

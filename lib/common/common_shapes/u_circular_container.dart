import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class UCircularContainer extends StatelessWidget {
  const UCircularContainer({
    super.key,
    this.height = 400,
    this.width = 400,
    this.radius = 400,
    this.backgroundColor = UColors.white,
    this.margin,
    this.padding,
    this.child,
  });

  final double height, width, radius;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin, padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      clipBehavior: Clip.hardEdge, 
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}

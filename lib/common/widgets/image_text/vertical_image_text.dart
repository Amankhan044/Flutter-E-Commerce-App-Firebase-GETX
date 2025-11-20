import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

import '../../common_shapes/u_circular_container.dart';

class UVerticalImageText extends StatelessWidget {
  const UVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    required this.color,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color color;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          UCircularContainer(
            height: 56,
            width: 56,
            backgroundColor: backgroundColor ?? (dark ? UColors.dark : UColors.light),
            padding: EdgeInsets.all(USizes.sm),
            child: Image.asset(
              image,
              fit: BoxFit.cover, // Full image visible inside the circle
            ),
          ),
          SizedBox(height: USizes.spaceBtwItems / 2),
      
          SizedBox(
            width: 55,
            child: Text(
              title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(
                context,
              ).textTheme.bodySmall!.apply(color: UColors.white),
            ),
          ),
        ],
      ),
    );
  }
}

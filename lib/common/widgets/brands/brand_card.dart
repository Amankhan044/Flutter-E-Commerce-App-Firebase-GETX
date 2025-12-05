import 'package:e_commerce/common/widgets/images/rounded_image.dart'
    show URoundedImage;
import 'package:e_commerce/utils/constants/sizes.dart' show USizes;
import 'package:flutter/material.dart';

import '../../../utils/constants/enums.dart';
import '../../../utils/constants/images.dart';
import '../../common_shapes/rounded_container.dart';
import '../text/brand_title_with_verify_icon.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({super.key,  this.showBorder=true, this.width, this.onTap});

  final bool showBorder;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: onTap,
      child: URoundedContainer(
        height: USizes.brandCardHeight,
        width: width,
        showBorder: showBorder,
        padding: EdgeInsets.all(USizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            URoundedImage(imageUrl: UImages.bataLogo),
            SizedBox(width: USizes.spaceBtwItems / 2),
      
            SizedBox(
              width: 100, // adjust based on your card size
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UBrandTitleWithVerifyIcon(
                    title: 'Bata',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '172 Products',
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

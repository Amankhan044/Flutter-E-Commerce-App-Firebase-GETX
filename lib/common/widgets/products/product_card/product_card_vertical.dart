import 'package:e_commerce/common/common_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/common/widgets/text/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/text/product_price_text.dart';
import 'package:e_commerce/common/widgets/text/product_title_text.dart';
import 'package:e_commerce/features/product_details/view/product_detail_view.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../style/shadows.dart';

class UProductCardVertical extends StatelessWidget {
  const UProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(()=> ProductDetailView()),
      child: Container(
              width: 180,
      
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: UShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(USizes.borderRadiusLg),
          color: dark ? UColors.darkerGrey : UColors.white,
        ),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            URoundedContainer(
              padding: const EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: Stack(
                children: [
                  Center(child: const URoundedImage(imageUrl: UImages.productImage15)),
      
                  Positioned(
                    top: 12.0,
                    child: URoundedContainer(
                      padding: const EdgeInsets.symmetric(
                        horizontal: USizes.sm,
                        vertical: USizes.xs,
                      ),
                      radius: USizes.sm,
                      backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                      child: Text(
                        '50%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: UColors.black),
                      ),
                    ),
                  ),
      
                  const Positioned(
                    right: 0,
                    top: 0,
                    child: UCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
      
            const SizedBox(height: USizes.spaceBtwItems / 2),
      
            Padding(
              padding: const EdgeInsets.only(left: USizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const UProductTitleText(
                      title: "Blue Bata Shoes", smallSize: true),
              
                  const SizedBox(height: USizes.spaceBtwItems / 2),
              
                  UBrandTitleWithVerifyIcon(title: 'Bata')
                
                
                ],
              ),
            ),
          
          
          Spacer(),
            Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: USizes.sm, ),
                        child: UProductPriceText(price: '65'),
                      ),
                      Container(
                        height: USizes.iconLg *1.2,
                        width: USizes.iconLg *1.2,
                        decoration: BoxDecoration(
                          color: UColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(USizes.cardRadiusMd),
                            bottomRight: Radius.circular(USizes.cardRadiusMd)
                          ),
                          
                        ),
                        child: Icon(Iconsax.add, color: UColors.white, ),
                      )
                    ],
                  )
                
      
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers_functions.dart';
import '../../../common_shapes/rounded_container.dart';
import '../../images/rounded_image.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../../text/product_price_text.dart';
import '../../text/product_title_text.dart';

class UProductCardHorizontal extends StatelessWidget {
  const UProductCardHorizontal({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: 310,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(USizes.productImageRadius),
            color : dark ? UColors.darkerGrey : UColors.light,
          ),
          child: Row(
            children: [

              /// Left Portion
              URoundedContainer(
                height: 120,
                padding: EdgeInsets.all(USizes.sm),
                backgroundColor: dark ? UColors.dark : UColors.light,
                child: Stack(
                  children: [

                    /// Thumbnail
                    SizedBox(
                        width: 120,
                        height: 120,
                        child: URoundedImage(imageUrl: UImages.productImage1)),

                    /// Discount Tag
                    Positioned(
                      top: 12.0,
                      child: URoundedContainer(
                        radius: USizes.sm,
                        backgroundColor: UColors.yellow.withValues(alpha: 0.8),
                        padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
                        child: Text('50%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
                      ),
                    ),

                    /// Favourite Button
                   const Positioned(
                    right: 0,
                    top: 0,
                    child: UCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),],
                ),
              ),

              /// Right Portion
              SizedBox(
                width: 172.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: USizes.sm, top: USizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Product Title
                          UProductTitleText(title: 'Blue Bata Shoes', smallSize: true),
                          SizedBox(height: USizes.spaceBtwItems / 2),

                          /// Product Brand
                          UBrandTitleWithVerifyIcon(title: 'Bata')

                        ],
                      ),
                      Spacer(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          /// Product Price
                          Flexible(child: UProductPriceText(price:'6 ahs jjka kajakj')),

                          /// Add Button
                         Container(
            width: USizes.iconLg * 1.2,
            height: USizes.iconLg * 1.2,
            decoration: BoxDecoration(
                color:  UColors.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(USizes.cardRadiusMd),
                    bottomRight: Radius.circular(USizes.productImageRadius))),
            child: Center(
              child:  Icon(Iconsax.add, color: UColors.white),
            ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
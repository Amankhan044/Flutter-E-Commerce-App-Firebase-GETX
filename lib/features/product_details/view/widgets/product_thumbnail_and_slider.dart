import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/images/rounded_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers_functions.dart';

class UProductThumbnailAndSlider extends StatelessWidget {
  const UProductThumbnailAndSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Container(
      color: dark ? UColors.darkerGrey : UColors.light,
      child: Stack(
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(USizes.productImageRadius),
              child: Center(child: Image(image: AssetImage(UImages.productImage1))),
            ),
          ),
          Positioned(
            left: USizes.defaultSpace,
            right: 0,
            bottom: 30,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: USizes.spaceBtwItems),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 14,
                itemBuilder: (context, index) =>   URoundedImage(
                  width: 80,
                  imageUrl: UImages.productImage10,
                  border: Border.all(color: UColors.primary),
                  backgroundColor: dark ? UColors.dark : UColors.light,
                ),),
            ),
          )
        ,
        UAppBar(showBackArrow: true,
        actions: [
          UCircularIcon(icon: Iconsax.heart5, color: Colors.red,),
        ],
        )
    
        ],
    
    
      ),
    );
  }
}

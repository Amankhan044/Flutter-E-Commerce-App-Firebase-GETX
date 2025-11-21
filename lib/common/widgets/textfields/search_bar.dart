import 'package:e_commerce/common/style/shadows.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class USearchBar extends StatelessWidget {
  const USearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = UHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: 0,
      left: USizes.spaceBtwSections,
      right: USizes.spaceBtwSections,
      child: Container(
        height: USizes.searchBarHeight-2,
        padding: EdgeInsets.symmetric(horizontal: USizes.md),
        decoration: BoxDecoration(
          color: dark ? UColors.dark : UColors.light,
          borderRadius: BorderRadius.circular(10),
          boxShadow: UShadow.searchBarShadow
        ),
    
        child: Row(
          children: [
           Icon(Iconsax.search_normal_1, color: UColors.grey,),
           SizedBox(width: USizes.spaceBtwItems,),
           Text(UTexts.searchBarTitle, style: Theme.of(context).textTheme.bodySmall,)
          ],
        ),
      ),
    );
  }
}
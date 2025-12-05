import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers_functions.dart';
import '../../icons/circular_icon.dart';

class UProductQuantityWithAddemove extends StatelessWidget {
  const UProductQuantityWithAddemove({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
     children: [
        UCircularIcon(
       icon: Iconsax.minus,
       height: 32,
       width: 32,
       size: USizes.iconSm,
       color: dark ? UColors.white : UColors.black,
       backgroundColor: dark ? UColors.darkerGrey : UColors.light,
     
     ),
     SizedBox(width: USizes.spaceBtwItems,),
     Text('2', style: Theme.of(context).textTheme.titleSmall,),
     SizedBox(width: USizes.spaceBtwItems,),
    
     UCircularIcon(
       icon: Iconsax.add,
       height: 32,
       width: 32,
       size: USizes.iconSm,
       color: UColors.white ,
       backgroundColor: UColors.primary,
     
     )
     ],
    );
  }
}
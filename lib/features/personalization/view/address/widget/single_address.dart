import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/common_shapes/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helpers_functions.dart';

class USingleAddress extends StatelessWidget {
  const USingleAddress({
    super.key,
    required this.isSelected
  });

  final bool isSelected ;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(USizes.md),
      borderColor: isSelected? Colors.transparent : dark ? UColors.darkGrey : UColors.grey,
      backgroundColor: isSelected? UColors.primary.withValues(alpha: 0.5) : Colors.transparent,
      child: Stack(
        children: [
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Aman Khan', style: Theme.of(context).textTheme.titleLarge, maxLines: 1,overflow: TextOverflow.ellipsis,),
          Text('+92 313244444', maxLines: 1,overflow: TextOverflow.ellipsis,),
          Text('house no 1, street no 1', ),
        ],
      ),

     if(isSelected) Positioned
      (
        top: 0,
        bottom: 0,
        right: 6,
        child: Icon(Iconsax.tick_circle5))
        ],
      )
    );
  }
}
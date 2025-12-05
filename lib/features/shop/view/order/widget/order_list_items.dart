import 'package:e_commerce/common/common_shapes/rounded_container.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';

class UOrderListItems extends StatelessWidget {
  const UOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: USizes.spaceBtwItems,),
      itemBuilder: (context, index) {
      return URoundedContainer(
      showBorder: true,
      backgroundColor:dark ? UColors.dark : UColors.light,
      padding: EdgeInsets.all(USizes.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Iconsax.ship),
              Column(
                children: [
                  Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 1, color: UColors.primary),),
                  Text('1 jan 2025', style: Theme.of(context).textTheme.headlineSmall,)
                ],
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon:Icon( Iconsax.arrow_right_34, size: USizes.iconSm,),)
            ],
          ),
          SizedBox(height: USizes.spaceBtwItems,),
          Row(
            children: [
              Expanded(
                child: Row(
                            children: [
                Icon(Iconsax.tag),
                Column(
                  children: [
                    Text('Order', style: Theme.of(context).textTheme.labelMedium,),
                    Text('74633', style: Theme.of(context).textTheme.titleMedium,)
                  ],
                ),
                             
                            ],
                          ),
              ),Expanded(
            child: Row(
              children: [
                Icon(Iconsax.tag),
                Column(
                  children: [
                    Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium,),
                    Text('06 jan 2025', style: Theme.of(context).textTheme.titleMedium,)
                  ],
                ),
                
              ],
            ),
          )
            ],
          )
        ],
      ),
    );
 
    }, ); }
}
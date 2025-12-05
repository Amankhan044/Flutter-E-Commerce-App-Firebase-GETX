import 'package:e_commerce/features/shop/view/cart/cart_view.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UCartCounterIcon extends StatelessWidget {
  const UCartCounterIcon({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        Positioned(
          right: 8.0,
          
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              color: dark ? UColors.dark : UColors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                  fontSizeFactor: 0.8,
                  color: dark ? UColors.white : UColors.dark,
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: ()=> Get.to(()=> CartView()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: dark ? UColors.white : UColors.white,
          ),
        ),
      ],
    );
  }
}
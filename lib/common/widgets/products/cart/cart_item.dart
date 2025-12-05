import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers_functions.dart';
import '../../images/rounded_image.dart';
import '../../text/brand_title_with_verify_icon.dart';
import '../../text/product_title_text.dart';

class UCartItem extends StatelessWidget {
  const UCartItem({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        URoundedImage(
          imageUrl: UImages.productImage4a,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(USizes.sm),
          backgroundColor: dark ? UColors.darkerGrey: UColors.light,
        ),
            
        SizedBox(width: USizes.spaceBtwItems,),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            UBrandTitleWithVerifyIcon(title: 'Apple'),
            UProductTitleText(title: 'Iphone 11 11 164 GB W' , maxLines: 1,),
            RichText(text: TextSpan(
              children: [
                TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall,),
                TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge,),
                TextSpan(text: 'Storage ', style: Theme.of(context).textTheme.bodySmall,),
                TextSpan(text: '128 GB ', style: Theme.of(context).textTheme.bodyLarge,),
              ]
            
            ))
          ],
        ))
      ],
    );
  }
}

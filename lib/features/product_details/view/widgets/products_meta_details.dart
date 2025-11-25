import 'package:flutter/material.dart';

import '../../../../common/common_shapes/rounded_container.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/text/brand_title_with_verify_icon.dart';
import '../../../../common/widgets/text/product_price_text.dart';
import '../../../../common/widgets/text/product_title_text.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';

class UProductsMetaDetails extends StatelessWidget {
  const UProductsMetaDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            URoundedContainer(
        
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
        
                SizedBox(width: USizes.spaceBtwItems,),
                Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                SizedBox(width: USizes.spaceBtwItems,),
        
                UProductPriceText(price:  '150', isLarge: true,),
        
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.share)),
        
        
        
        
          ],
        ),
      
      SizedBox(height: USizes.spaceBtwItems/1.5,),
      UProductTitleText(title: 'Apple iPhone 11'),
      SizedBox(height: USizes.spaceBtwItems/1.5,),
        
        
      Row(
        children: [
          UProductTitleText(title: 'Status'),
      SizedBox(width: USizes.spaceBtwItems,),
      Text('In Stock', style: Theme.of(context).textTheme.titleMedium,)
        
        ],
      ),
      SizedBox(height: USizes.spaceBtwItems/1.5,),
        
      Row(
        children: [
          UCircularImage(
            padding: 0,
            image: UImages.bataLogo, width: 32, height: 32,),
          SizedBox(width: USizes.spaceBtwItems,),
          UBrandTitleWithVerifyIcon(title: 'Apple ')
        ],
      )
        
      
      
      ],
    );
  }
}


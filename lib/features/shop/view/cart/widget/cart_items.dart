import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/cart/product_quantity_with_add_remove.dart';
import '../../../../../common/widgets/text/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class UCartItems extends StatelessWidget {
  const UCartItems({
    super.key, this.showCartItems=true,
  });
 final bool showCartItems;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: USizes.spaceBtwSections,),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          children: [
            UCartItem(),
           if(showCartItems) SizedBox(height: USizes.spaceBtwItems,),
           if(showCartItems) Row(
              children: [
                SizedBox(width: 70,),
               UProductQuantityWithAddemove(),
              Spacer(),
               UProductPriceText(price: '2657')
    
              ],
            )
          ],
        );
      },
    );
  }
}

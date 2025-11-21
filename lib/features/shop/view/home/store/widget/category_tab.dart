import 'package:e_commerce/common/widgets/brands/brand_showcase.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UCategoryTab extends StatelessWidget {
  const UCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children:[ Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: Column(
          children: [
            UBrandShowCase(
              images: [
                UImages.productImage47,
                UImages.productImage1,
                UImages.productImage2,
              ],
            ),
            UBrandShowCase(
              images: [
                UImages.productImage47,
                UImages.productImage1,
                UImages.productImage2,
              ],
            ),
            SizedBox(height: USizes.spaceBtwItems),
            USectionHeading(title:  'You might like', onPressed: () {}),
            UGridLayout(itemCount: 4, itemBuilder: (context, index) {
              return UProductCardVertical();
            },)
          ],
        ),
      ),]
    );
  }
}
import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/product_details/view/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/product_details/view/widgets/product_attributes.dart';
import 'package:e_commerce/features/product_details/view/widgets/product_thumbnail_and_slider.dart';
import 'package:e_commerce/features/product_details/view/widgets/products_meta_details.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../common/widgets/button/elevated_button.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UProductThumbnailAndSlider(),

           Padding(
             padding: UPadding.screenPadding,
             child: Column(
              children: [
                 UProductsMetaDetails(),
              UProductAttributes(),
             
              SizedBox(height: USizes.spaceBtwSections),
             
              UElevatedButton(onPressed: () {}, child: Text('CheckOut')),
             
              SizedBox(height: USizes.spaceBtwSections),
              USectionHeading(title: 'Description', showActionButton: false),
              SizedBox(height: USizes.spaceBtwItems),
             
              ReadMoreText(
                'A Flutter package that allows for dynamic expansion and collapse of text, as well as interactions with text patterns such as hashtags, URLs, and mentions.A Flutter package that allows for dynamic expansion and collapse of text, as well as interactions with text patterns such as hashtags, URLs, and mentions.',
                trimCollapsedText: ' Show more',
                trimExpandedText: ' less',
                trimMode: TrimMode.Line,
                trimLength: 2,
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, ),
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800, ),
              ),
             
              SizedBox(height: USizes.spaceBtwSections),
             
              ],
             ),
           )
          ],
        ),
      ),
    
    bottomNavigationBar: UBottomAddToCart(),
    
    );
  }
}

import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';

class SubCategoryView extends StatelessWidget {
  const SubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Sports', style: Theme.of(context).textTheme.headlineMedium,),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(children: [
            USectionHeading(title: 'Sports Shoes', onPressed: () {
              
            },),

            SizedBox(height: USizes.spaceBtwItems/2,),

            SizedBox(height: 120, child: ListView.separated(
              
              separatorBuilder: (context, index) => const SizedBox(width: USizes.spaceBtwItems,), itemCount: 10, scrollDirection: Axis.horizontal, itemBuilder: (context, index) => UProductCardHorizontal()),)
          ],
            
          ),
        ),
      ),
    );
  }
}
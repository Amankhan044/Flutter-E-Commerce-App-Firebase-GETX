import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/view/brand/brand_product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';

class AllBrandsView extends StatelessWidget {
  const AllBrandsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Brands', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: UPadding.screenPadding, child: Column(
          children: [
            USectionHeading(title: 'Brands',showActionButton: false,),
            SizedBox(height: USizes.spaceBtwItems,),
            UGridLayout(itemCount: 10,
            mainAxisExtent: 80, itemBuilder: (context, index) {
              return UBrandCard(onTap: () => Get.to(()=> BrandProductView()),);
            },)
          ],
        ),),
      ),
    );
  }
}
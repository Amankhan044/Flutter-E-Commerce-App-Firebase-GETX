import 'package:e_commerce/common/common_shapes/primary_header_container.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/common/widgets/textfields/search_bar.dart';
import 'package:e_commerce/features/shop/view/all_products/all_products.dart';
import 'package:e_commerce/features/shop/view/home/widget/home_appbar.dart';
import 'package:e_commerce/features/shop/view/home/widget/home_categories.dart';
import 'package:e_commerce/features/shop/view/home/widget/promo_slider.dart';
import 'package:e_commerce/features/shop/viewModel/home/home_view_model.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/product_card/product_card_vertical.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final controller = Get.put(HomeViewModel());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: USizes.homePrimaryHeaderHeight + 10),
                UPrimaryHeaderContainer(
                  height: USizes.homePrimaryHeaderHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UHomeAppBar(),
                      SizedBox(height: USizes.spaceBtwSections),
                      UHomeCategories(),
                    ],
                  ),
                ),
                USearchBar(),
              ],
            ),
        
            Padding(
              padding: const EdgeInsets.all(USizes.defaultSpace),
              child: Column(
                children: [
                  UPromoSlider(banners: [UImages.homeBanner1, UImages.homeBanner2, UImages.homeBanner3, UImages.homeBanner4, UImages.homeBanner5]),
                  SizedBox(height: USizes.spaceBtwSections),
                  USectionHeading(title: 'Popular Products', onPressed: () => Get.to(()=>AllProductsView()),),
                  SizedBox(height: USizes.spaceBtwItems),
        
                  UGridLayout(itemCount: 6, itemBuilder: (context, index) {
                    return UProductCardVertical();
                  },)  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





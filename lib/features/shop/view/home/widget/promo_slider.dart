import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/features/shop/view/home/widget/bottom_dot_navigation.dart' show BottomDotNaigation;
import 'package:e_commerce/features/shop/viewModel/banner/banner_view_model.dart';
import 'package:e_commerce/features/shop/viewModel/home/home_view_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../../common/widgets/images/rounded_image.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({
    super.key, 
  });


  @override
  Widget build(BuildContext context) {
    final controller = HomeViewModel.instance;
    final bannerController = Get.put(BannerViewModel());
    return Obx(
      () {
if (bannerController.isBannerLoading.value) {
  return UShimmerEffect(width: double.infinity, height: 190);
  
}

if (bannerController.banners.isEmpty) {
  return Text("Banners not found");
  
}

        return Column(
        children: [
          CarouselSlider(
            
            carouselController: controller.carouselController ,
            options: CarouselOptions(viewportFraction: 1.0, onPageChanged: (index, reason) {
              controller.onPaggedChanged(index);
            },),
            items:bannerController.banners.map((banner) => URoundedImage(imageUrl: banner.imageUrl, isNetworkImage: true,)).toList(),),
            
             
          
          const SizedBox(height: USizes.spaceBtwItems),
          BottomDotNaigation()
        ],
      );
        
      } 
    );
  }
}

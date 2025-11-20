import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/shop/view/home/widget/bottom_dot_navigation.dart' show BottomDotNaigation;
import 'package:e_commerce/features/shop/viewModel/home/home_view_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/rounded_image.dart';

class UPromoSlider extends StatelessWidget {
  const UPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = HomeViewModel.instance;
    return Column(
      children: [
        CarouselSlider(
          
          carouselController: controller.carouselController ,
          options: CarouselOptions(viewportFraction: 1.0, onPageChanged: (index, reason) {
            controller.onPaggedChanged(index);
          },),
          items:banners.map((e) => URoundedImage(imageUrl: e)).toList(),),
          
           
        
        const SizedBox(height: USizes.spaceBtwItems),
        BottomDotNaigation()
      ],
    );
  }
}

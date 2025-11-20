import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../viewModel/home/home_view_model.dart';

class BottomDotNaigation extends StatelessWidget {
  const BottomDotNaigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeViewModel.instance;


    return Positioned(
      
      bottom: UDeviceHelper.getBottomNavigationBarHeight()*5,
      left: UDeviceHelper.getScreenWidth(context)/3,
      right: UDeviceHelper.getScreenWidth(context)/3,
      child: Obx(
        () => SmoothPageIndicator(
          controller: PageController(initialPage: controller.currentIndex.value),
          count: 5,
          effect: const ExpandingDotsEffect(
            dotHeight: 6.0,
        
          ),
        ),
      ),
    );
  }
}

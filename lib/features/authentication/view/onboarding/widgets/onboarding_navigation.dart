import 'package:e_commerce/features/authentication/viewmodel/onboarding_viewmodel/onboarding_viewmodel.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNaigation extends StatelessWidget {
  const OnBoardingDotNaigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = OnBoardingViewmodel.instance;

    return Positioned(
      
      bottom: UDeviceHelper.getBottomNavigationBarHeight()*5,
      left: UDeviceHelper.getScreenWidth(context)/3,
      right: UDeviceHelper.getScreenWidth(context)/3,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: const ExpandingDotsEffect(
          dotHeight: 6.0,
      
        ),
      ),
    );
  }
}

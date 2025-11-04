import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/viewmodel/onboarding_viewmodel/onboarding_viewmodel.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingViewmodel.instance;
    return Positioned(
      left: 0,
      right: 0,
      bottom: UDeviceHelper.getBottomNavigationBarHeight()*1.5,
      child: UElevatedButton(onPressed: () {

        controller.nextPage();
        
      }, child:Obx(()=> controller.currentIndex.value == 2 ? Text('Get Started') : Text('Next'))),
    );
  }
}

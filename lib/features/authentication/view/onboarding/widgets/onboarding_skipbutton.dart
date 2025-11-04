import 'package:e_commerce/features/authentication/viewmodel/onboarding_viewmodel/onboarding_viewmodel.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnBordingSkipButton extends StatelessWidget {
  const OnBordingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingViewmodel.instance;
    return Obx(
      ()=> controller.currentIndex.value == 2 ? SizedBox() : Positioned(
        top: UDeviceHelper.getAppBarHeight(),
        right: 0,
        child: TextButton(onPressed: (){

          controller.skipPage();

        }, child: 
        Text('Skip'))),
    );
  }
}

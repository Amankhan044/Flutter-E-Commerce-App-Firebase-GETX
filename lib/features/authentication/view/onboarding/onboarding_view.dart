import 'package:e_commerce/features/authentication/view/onboarding/widgets/onboarding_navigation.dart';
import 'package:e_commerce/features/authentication/view/onboarding/widgets/onboarding_nextbutton.dart';
import 'package:e_commerce/features/authentication/view/onboarding/widgets/onboarding_pageview.dart';
import 'package:e_commerce/features/authentication/view/onboarding/widgets/onboarding_skipbutton.dart';
import 'package:e_commerce/features/authentication/viewmodel/onboarding_viewmodel/onboarding_viewmodel.dart';
import 'package:e_commerce/utils/constants/images.dart' show UImages;
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingViewmodel());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric( horizontal: USizes.defaultSpace),
        child: Stack(
          children: [
            PageView(
              controller: controller.pageController,
              onPageChanged:controller.updatePageIndicator,
              children:[
        
                OnBoardingPageView(
              animation: UImages.onboarding1Animation,
              title: UTexts.onBoardingTitle1,
              subTitle: UTexts.onBoardingSubTitle1,
            ),
                OnBoardingPageView(
                animation: UImages.onboarding2Animation,
                title: UTexts.onBoardingTitle2,
                subTitle: UTexts.onBoardingSubTitle2,
              ),
              OnBoardingPageView(
              animation: UImages.onboarding3Animation,
              title: UTexts.onBoardingTitle3,
              subTitle: UTexts.onBoardingSubTitle3,
            ),
              ] 
            ),
            OnBoardingDotNaigation(),
              OnBoardingNextButton(),
              OnBordingSkipButton()        
          ],
        ),
      ),
    );
  }
}




import 'package:e_commerce/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';

class UFullScreenLoader {
  static void openLoadingDialog(String text) {
    showDialog(
        context: Get.context!,

        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: UHelperFunctions.isDarkMode(Get.context!) ? UColors.dark : UColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  /// Extra Space
                  const SizedBox(height: 250),

                  /// Animation
                  UAnimationLoader(text: text)
                ],
              ),
            )));
  }

  static void stopLoading() {
  if (Get.isDialogOpen ?? false) {
    Get.back();
  }
}

}
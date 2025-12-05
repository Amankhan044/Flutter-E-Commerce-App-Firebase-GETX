import 'dart:async';

import 'package:e_commerce/common/screens/success/success_screen.dart';
import 'package:e_commerce/data/repository/authentication_repository.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailViewmodel extends GetxController {
  static VerifyEmailViewmodel get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    serverTimeForRedirect();
    super.onInit();
  }

  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      USnackBarHelpers.successSnackBar(
        title: 'Email Sent',
        message: 'Please check your inbox and click the email to verify.',
      );
    } catch (e) {
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  void serverTimeForRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
        timer.cancel();
        Get.off(
          () => SuccessScreenView(
            image: UImages.successfulPaymentIcon,
            title: UTexts.accountCreatedTitle,
            subTitle: UTexts.accountCreatedSubTitle,
            onTap: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }


  Future<void> checkEmailVerificationStatus()async{
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.emailVerified) {
        Get.off(
          () => SuccessScreenView(
            image: UImages.successfulPaymentIcon,
            title: UTexts.accountCreatedTitle,
            subTitle: UTexts.accountCreatedSubTitle,
            onTap: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
        
      } 
    // ignore: empty_catches
    } catch (e) {
      
    }
  }


}

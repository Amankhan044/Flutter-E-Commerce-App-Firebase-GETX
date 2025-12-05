
import 'package:e_commerce/data/repository/user/user_repository.dart';
import 'package:e_commerce/features/authentication/model/user_model.dart';
import 'package:e_commerce/features/authentication/view/signup/verify_email.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repository/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';

class SignupViewmodel extends GetxController {
  static SignupViewmodel get instance => Get.find();

  final signUpFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;
  RxBool privacyPolicy = false.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  Future<void> registerUser() async {
    try {
       if (!signUpFormKey.currentState!.validate()) {
        return;
      }

       bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      if (!privacyPolicy.value) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(
          title: 'Accept Privacy Policy',
          message: 'Please accept privacy policy to continue.',
        );
        return;
      }


      UFullScreenLoader.openLoadingDialog(
        'We are processing your information, Please wait...',
      );

     
      
      UserCredential userCredential = await AuthenticationRepository.instance.registerUser(
        email.text.trim(),
        password.text.trim(),
      );

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text,
        lastName: lastName.text,
        username: '${firstName.text + lastName.text}8737',
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(user);

      UFullScreenLoader.stopLoading();
      USnackBarHelpers.successSnackBar(
        title: 'Congrats',
        message: 'Account created successfully, Verify your email to continue....',
      );


      Get.to(()=>VerifyEmailView(email: email.text,));
    } catch (e) {

      UFullScreenLoader.stopLoading();
      USnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}

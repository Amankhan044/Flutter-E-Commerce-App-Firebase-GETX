import 'package:e_commerce/features/authentication/view/forget_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repository/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/snackbar_helpers.dart';

class ForgetPasswordViewmodel extends GetxController{
   static ForgetPasswordViewmodel get instance => Get.find();


final email = TextEditingController();
final formKey = GlobalKey<FormState>();

Future<void> forgetPasswordResetEmail()async{

  try {


     bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      

      UFullScreenLoader.openLoadingDialog(
        'Processing Your Request...',
      );

    if(formKey.currentState!.validate()){
            UFullScreenLoader.stopLoading();
            return;

  }

      await AuthenticationRepository.instance.forgetPasswordResetEmail(email.text.trim());
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.successSnackBar(title: 'Email Sent', message: 'Please check your inbox and click the email to verify.');

      Get.to(()=>ResetPasswordView(email: email.text.trim(),));

} catch (e) {
  UFullScreenLoader.stopLoading();
    USnackBarHelpers.errorSnackBar(title: 'Failed Forget Password', message: e.toString());
    
  }}
  

Future<void> resendForgetPasswordResetEmail()async{

  try {


     bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      

      UFullScreenLoader.openLoadingDialog(
        'Processing Your Request...',
      );

    

      await AuthenticationRepository.instance.forgetPasswordResetEmail(email.text.trim());
      UFullScreenLoader.stopLoading();
      USnackBarHelpers.successSnackBar(title: 'Email Sent', message: 'Please check your inbox and click the email to verify.');

      

} catch (e) {
  UFullScreenLoader.stopLoading();
    USnackBarHelpers.errorSnackBar(title: 'Failed Forget Password', message: e.toString());
    
  }}
  

}
import 'package:e_commerce/data/repository/authentication_repository.dart';
import 'package:e_commerce/features/personalization/view_model/user/user_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/snackbar_helpers.dart';

class LoginViewmodel extends GetxController{
  static LoginViewmodel get instance => Get.find();
  final _userController = Get.put( UserViewmodel());


    final email = TextEditingController();
    final password = TextEditingController();
    RxBool rememberMe = false.obs;
    RxBool isPasswordVisible = false.obs;
    final localStorage = GetStorage();

    final loginFormKey = GlobalKey<FormState>();

    @override
    void onInit() {
      super.onInit();
      email.text = localStorage.read('Remember_email') ?? '';
      password.text = localStorage.read('Remember_password') ?? '';
    }

    Future<void> loginWithEmailAndPassword()async{

      try {

        if (!loginFormKey.currentState!.validate()) {
          return;
        } 


         bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      if (rememberMe.value) {
          localStorage.write('Remember_email', email.text.trim());
          localStorage.write('Remember_password', password.text.trim());
        
      }


      UFullScreenLoader.openLoadingDialog(
        'Logging You In...',
      );


      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      UFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
        
      } catch (e) {

        UFullScreenLoader.stopLoading();
        USnackBarHelpers.errorSnackBar(title: 'Login Failed', message: e.toString());

        
      }

    }

    Future<void> googleSignIn()async{

      try {

         bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      

      UFullScreenLoader.openLoadingDialog(
        'Logging You In...',
      );

      UserCredential userCredential = await AuthenticationRepository.instance.signInWithGoogle();
      await _userController.saveUserRecord(userCredential);
      UFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.screenRedirect();
        
        
      } catch (e) {
        
         UFullScreenLoader.stopLoading();
        USnackBarHelpers.errorSnackBar(title: 'Login Failed', message: e.toString());

      }

    }

}
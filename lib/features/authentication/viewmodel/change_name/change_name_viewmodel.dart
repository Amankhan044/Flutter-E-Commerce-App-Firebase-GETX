import 'package:e_commerce/data/repository/user/user_repository.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../navigation_menu.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../personalization/view_model/user/user_viewmodel.dart';

class ChangeNameViewmodel extends GetxController {
  static ChangeNameViewmodel get to => Get.find();

  final _userController = UserViewmodel.instance;
  final _userRepository = UserRepository.instance;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final updateUserFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializedNames();
    super.onInit();
  }

  void initializedNames() {
    firstNameController.text = _userController.user.value.firstName;
    lastNameController.text = _userController.user.value.lastName;
  }

  Future<void> upateUserName() async {
    try {
      UFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
      );

      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      if (!updateUserFormKey.currentState!.validate()) {
        UFullScreenLoader.stopLoading();

        return;
      }

      await _userRepository.updateSingleRecord({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
      });


      _userController.user.value.firstName = firstNameController.text;
      _userController.user.value.lastName = lastNameController.text;

      UFullScreenLoader.stopLoading();
      Get.offAll( ()=> NavigationMenu());
      USnackBarHelpers.successSnackBar(
        title: 'Congratulation',
        message: 'Your name has been updated successfully',
      );
    } catch (e) {
      UFullScreenLoader.stopLoading();

      USnackBarHelpers.errorSnackBar(
        title: 'Update Name Failed',
        message: e.toString(),
      );
    }
  }
}

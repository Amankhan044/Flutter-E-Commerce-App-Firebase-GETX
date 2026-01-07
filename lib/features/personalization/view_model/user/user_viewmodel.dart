import 'dart:io';

import 'package:e_commerce/data/repository/authentication_repository.dart';
import 'package:e_commerce/features/personalization/view/change_name/re_authenticate_user_form.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/repository/user/user_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../authentication/model/user_model.dart';
import '../../../authentication/view/login/login_view.dart';
import 'package:dio/dio.dart' as dio;

class UserViewmodel extends GetxController {
  static UserViewmodel get instance => Get.find();
  final _userRepository = Get.put(UserRepository());

  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;


  final email = TextEditingController();
  final password = TextEditingController();

  final reAuthFormKey = GlobalKey<FormState>();
    RxBool isPasswordVisible = false.obs;


  @override
  onInit() {
    super.onInit();
    fetchUserRecord();
  }


  

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {

        await fetchUserRecord();

        if(user.value.id.isEmpty){
          final namePart = UserModel.nameParts(userCredential.user!.displayName);
      final username = '${userCredential.user!.displayName}1234';
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: namePart[0],
        lastName: namePart.length > 1 ? namePart.sublist(1).join(' ') : '',
        username: username,
        email: userCredential.user!.email ?? '',
        phoneNumber: userCredential.user!.phoneNumber ?? '',
        profilePicture: userCredential.user!.photoURL ?? '',
      );
      await _userRepository.saveUserRecord(userModel);
        }

      
    } catch (e) {
      USnackBarHelpers.warningSnackBar(
        title: 'Data Not Saved',
        message: 'Something wentwrong while saving the data',
      );
    }
  }



Future<void> fetchUserRecord()async{
  try {


    profileLoading= true.obs;
   UserModel user=await _userRepository.fetchUserRecord();
  this.user.value=user;
    
  } catch (e) {

    user.value=UserModel.empty();
    
  }finally{
    profileLoading= false.obs;
  }
}


void deleteAccountWarningPopup(){
  Get.defaultDialog(
    contentPadding: const EdgeInsets.all(USizes.md),
    title: 'Delete Account',
    middleText: 'Are you sure you want to delete your account?',
    cancel: OutlinedButton(
      child: const Text('Cancel'),
      onPressed: () => Get.back(),
    ),
    confirm: ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
      onPressed: () => deleteUserAccount(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: USizes.lg),
        child: const Text('Delete'),
      ),
    ));}


    Future<void> deleteUserAccount()async{
      try {
        final authRepository= AuthenticationRepository.instance;
        final provider = authRepository.currentUser!.providerData.map((e) => e.providerId).first;
        if (provider == 'google.com') {
          await authRepository.signInWithGoogle();
          await authRepository.deleteAccount();
          UFullScreenLoader.stopLoading();
          Get.offAll(()=>LoginView());
          
        } else if(provider == 'password'){ {
          UFullScreenLoader.stopLoading();
          Get.to(()=> ReAuthenticateUserForm());
          
        }
      }} catch (e) {
          UFullScreenLoader.stopLoading();
          USnackBarHelpers.errorSnackBar(
            title: 'Error',
            message: e.toString(),
          );
        
      }

    }


    Future<void> reAuthenticateUser()async{

      try {
         if (!reAuthFormKey.currentState!.validate()) {
          return;
        } 

          UFullScreenLoader.openLoadingDialog(
        'ReAuthenticating...',
      );

         bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

    

     

        await AuthenticationRepository.instance.reAutheticateWithEmailAndPassword(email.text, password.text);
        await AuthenticationRepository.instance.deleteAccount();
        UFullScreenLoader.stopLoading();
        Get.offAll(()=>LoginView());



     
        
      } catch (e) {
        UFullScreenLoader.stopLoading();
        USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
        
      }
    }




Future<void> updateUserProfilePicture()async{
  try {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    File file = File(image.path);

    if (user.value.publicId.isNotEmpty) {
     await _userRepository.deleteProfilePicture(user.value.publicId);
      
    }

   dio.Response response = await _userRepository.uploadImage(file);

   if(response.statusCode==200){

    final data = response.data;

    final imageUrl = data['url'];
    final publicId = data['public_id'];

    await _userRepository.updateSingleRecord( {'profilePicture': imageUrl, 'publicId': publicId});

    user.value.profilePicture = imageUrl;
    user.value.publicId = publicId;

    user.refresh();

    USnackBarHelpers.successSnackBar(title: 'Congratulations', message: 'Profile Picture updated successfully');

   }else{
    throw 'Failed to upload profile picture. Please try again';
   }

  } catch (e) {
    USnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    
  }
}

}

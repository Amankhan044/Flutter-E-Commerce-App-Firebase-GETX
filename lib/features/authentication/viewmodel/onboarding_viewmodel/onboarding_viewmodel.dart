import 'package:e_commerce/features/authentication/view/login/login_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingViewmodel extends GetxController{

  static  OnBoardingViewmodel get instance => Get.find();

  final pageController= PageController();

  RxInt currentIndex=0.obs;
  final storage = GetStorage();



  void updatePageIndicator(index){

    currentIndex.value=index;

  }

  void dotNavigationClick(index){

    currentIndex.value=index;
    pageController.jumpToPage(index);

  }

  void nextPage(){

    if(currentIndex.value==2){
      storage.write('isFirstTime', false);
      Get.offAll(()=>LoginView());
      return;}
    currentIndex.value++;
    pageController.jumpToPage(currentIndex.value);


  }

  void skipPage(){

    currentIndex.value=2;
    pageController.jumpToPage(currentIndex.value);

  }

}
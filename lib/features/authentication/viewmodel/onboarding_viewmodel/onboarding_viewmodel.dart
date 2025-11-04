import 'package:e_commerce/features/authentication/view/login/login_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnBoardingViewmodel extends GetxController{

  static  OnBoardingViewmodel get instance => Get.find();

  final pageController= PageController();

  RxInt currentIndex=0.obs;



  void updatePageIndicator(index){

    currentIndex.value=index;

  }

  void dotNavigationClick(index){

    currentIndex.value=index;
    pageController.jumpToPage(index);

  }

  void nextPage(){

    if(currentIndex.value==2){
      
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
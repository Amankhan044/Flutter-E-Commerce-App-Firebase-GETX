import 'package:e_commerce/features/personalization/view/profile/profile_view.dart';
import 'package:e_commerce/features/shop/view/home/home_view.dart';
import 'package:e_commerce/features/shop/view/store/store_view.dart';
import 'package:e_commerce/features/shop/view/wishlist/wishlist_view.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
     
      final controller = Get.put(NaviagtionController());
      final dark = UHelperFunctions.isDarkMode(context);

    return  Scaffold(

      body: Obx(() => controller.screens[controller.currentIndex.value]),

      bottomNavigationBar:Obx(
        ()=> NavigationBar(
          elevation: 0,
          backgroundColor:dark ? UColors.black : UColors.white,
          indicatorColor: dark ? UColors.white.withValues(alpha: 0.1) : UColors.black.withValues(alpha: 0.1),
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: (index) {
            controller.currentIndex.value = index;
          },
          destinations: [
        
          NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
          NavigationDestination(icon: Icon(Iconsax.heart), label: 'WhishList'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'User'),
        
        ],),
      ),
    );
  }
}

class NaviagtionController extends GetxController{
    static NaviagtionController instance = Get.find();
    RxInt currentIndex = 0.obs;

    

    List<Widget> screens = [HomeView(),StoreView(),WishlistView(),ProfileView()];

}
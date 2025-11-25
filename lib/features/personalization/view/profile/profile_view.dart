import 'package:e_commerce/common/common_shapes/primary_header_container.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/personalization/view/profile/widget/setting_menu_tile.dart';
import 'package:e_commerce/features/personalization/view/profile/widget/user_profile_tile.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/images/user_profile_logo.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(height: USizes.storePrimaryHeaderHeight + 60),
                UPrimaryHeaderContainer(
                  height: USizes.storePrimaryHeaderHeight,
                  child: Container(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: UserProfileLogo(),
                  ),
                ),
              ],
            ),
           Padding(
             padding: const EdgeInsets.all(USizes.defaultSpace),
             child: Column(
              children: [
                 UserProfileTile(),
                 SizedBox(height: USizes.spaceBtwItems,),
             
              USectionHeading(title: 'Account Settings', showActionButton: false),
             
              SettingMenuTile(icon: Iconsax.safe_home,title: 'My Address', subtitle: 'Set SHopping Delivery Address',),
              SettingMenuTile(icon: Iconsax.shopping_cart,title: 'My Cart', subtitle: 'Add, remove products and move to checkout',),
        
              SettingMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subtitle: 'In-progress, completed and cancelled orders',),
              SizedBox(height: USizes.spaceBtwSections,),
              SizedBox(
                
                width: double.infinity,
                child: OutlinedButton(onPressed: () {
                  
                }, child: Text('LogOut')),
              ),
              SizedBox(height: USizes.spaceBtwSections,),

              ],
             ),
           )
          ],
        ),
      ),
    );
  }
}


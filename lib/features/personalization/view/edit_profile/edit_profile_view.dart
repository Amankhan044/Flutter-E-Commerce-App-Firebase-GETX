import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/images/user_profile_logo.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/personalization/view/change_name/change_name_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../view_model/user/user_viewmodel.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserViewmodel.instance;

    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Edit Profile', style: Theme.of(context).textTheme.headlineMedium,),
      
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [

              Stack(
                children: [
                  Center(child: UserProfileLogo()),
                  Positioned(
                    
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(child: UCircularIcon(icon: Iconsax.edit)))
                ],
              ),

              SizedBox(height: USizes.spaceBtwSections,),
              Divider(),
              SizedBox(height: USizes.spaceBtwItems,),

              USectionHeading(title: 'Account Settings',showActionButton: false,),
              SizedBox(height: USizes.spaceBtwItems,),

              UserDetailRow(title: 'Name', value: controller.user.value.fullName ,onTap: ()=> Get.to(() => const ChangeNameView()),),
              UserDetailRow(title: 'UserName', value: controller.user.value.username ,onTap: (){},),

                 SizedBox(height: USizes.spaceBtwItems,),
              Divider(),

                 SizedBox(height: USizes.spaceBtwItems,),

              USectionHeading(title: 'Profile Settings',showActionButton: false,),
              SizedBox(height: USizes.spaceBtwItems,),


               UserDetailRow(title: 'User ID', value: controller.user.value.id ,onTap: (){},),
              UserDetailRow(title: 'Email', value: controller.user.value.email,onTap: (){},),
               UserDetailRow(title: 'Phone Number', value: '+92 ${controller.user.value.phoneNumber}',onTap: (){},),
               UserDetailRow(title: 'Gender', value: 'Male',onTap: (){},),

                Divider(),
                 SizedBox(height: USizes.spaceBtwItems,),

                 TextButton(onPressed: controller.deleteAccountWarningPopup, child: Text('Close Account', style: TextStyle(color: Colors.red),))


              

            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailRow extends StatelessWidget {
  const UserDetailRow({
    super.key, required this.title, required this.value,  this.icon= Iconsax.arrow_right_34,required this.onTap,
  });

   final String title;
  final String value;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: USizes.spaceBtwItems/1.5),
        child: Row(
          children: [
            Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis,),
            Spacer(),
                              Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis,),
            Spacer(),
        
            Icon(icon, size: USizes.iconSm,)
        ]),
      ),
    );
  }
}
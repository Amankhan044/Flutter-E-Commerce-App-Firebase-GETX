import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/view/login/login_view.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewmodel/forget_password/forget_password_viewmodel.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = ForgetPasswordViewmodel.instance;
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.close))
        ],
      ),

      body: Padding(
        padding: UPadding.screenPadding,
        child: Column(
          children: [
            Image.asset(UImages.mailSentImage, height: UDeviceHelper.getScreenWidth(context) * 0.6,),
               SizedBox(height: USizes.spaceBtwItems /2),

             Text(UTexts.resetPasswordTitle, style: Theme.of(  context).textTheme.headlineMedium),
               SizedBox(height: USizes.spaceBtwItems /2),

              Text(email , style: Theme.of(  context).textTheme.bodyMedium),
        
               SizedBox(height: USizes.spaceBtwItems),
              Text(UTexts.resetPasswordSubTitle, style: Theme.of(  context).textTheme.bodySmall, textAlign: TextAlign.center,),
               SizedBox(height: USizes.spaceBtwSections),
               UElevatedButton(onPressed: ()=> Get.offAll(()=> const LoginView()), child: Text(UTexts.done)),

               SizedBox(
                width: double.infinity,
                 child: TextButton(onPressed: () => controller.resendForgetPasswordResetEmail(), child: Text(UTexts.resendEmail)),
               )

          ],
        ),
      ),
    );
  }
}
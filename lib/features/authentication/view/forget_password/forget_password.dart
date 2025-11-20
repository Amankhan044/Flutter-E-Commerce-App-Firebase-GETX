import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/view/forget_password/reset_password.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: UPadding.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(UTexts.forgetPasswordTitle, style: Theme.of(  context).textTheme.headlineMedium),
             SizedBox(height: USizes.spaceBtwItems /2),
            Text(UTexts.forgetPasswordSubTitle, style: Theme.of(  context).textTheme.labelMedium),
        
            const SizedBox(height: USizes.spaceBtwSections * 2),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                label: Text(UTexts.email),
              ),
            ),

            const SizedBox(height: USizes.spaceBtwSections),

            UElevatedButton(onPressed: ()=> Get.to(()=> ResetPasswordView()), child: Text(UTexts.submit))


          ],
        ),
      ),
    );
  }
}
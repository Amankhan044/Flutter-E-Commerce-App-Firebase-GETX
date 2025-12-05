import 'package:e_commerce/features/authentication/viewmodel/login/login_viewmodel.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class USocialButtons extends StatelessWidget {
  const USocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginViewmodel());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: UColors.grey),
            borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: controller.googleSignIn, icon: Image.asset(UImages.googleIcon, width: USizes.iconMd, height: USizes.iconMd,)),
        ),
       const SizedBox(width: USizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: UColors.grey),
            borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: (){}, icon: Image.asset(UImages.facebookIcon, width: USizes.iconMd, height: USizes.iconMd,)),
        )
      ],
    );
  }
}
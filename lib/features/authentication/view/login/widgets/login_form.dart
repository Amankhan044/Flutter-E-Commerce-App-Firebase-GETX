import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/view/forget_password/forget_password.dart';
import 'package:e_commerce/features/authentication/view/signup/signup_view.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            label: Text(UTexts.email),
          ),
        ),
        const SizedBox(height: USizes.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            label: Text(UTexts.password),
            suffixIcon: Icon(Iconsax.eye),
          ),

          
        ),

        const SizedBox(height: USizes.spaceBtwInputFields/2),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(value: true, onChanged: (value){}),
                Text(UTexts.rememberMe),
                Spacer(),
                TextButton(onPressed: ()=> Get.to(()=> ForgetPasswordView()), child: Text(UTexts.forgetPassword))
              ],
            ),

            const SizedBox(height: USizes.spaceBtwSections),
          
          Column(
            children: [
            UElevatedButton(onPressed: ()=> Get.to(()=> NavigationMenu()), child: Text(UTexts.signIn))
          ]),
            const SizedBox(height: USizes.spaceBtwItems/2),

            Column(
            children: [
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: (){
                Get.to(()=>SignUpView());
              }, child: Text(UTexts.createAccount)))
          ]),

         
      ],
    );
  }
}


import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/common/widgets/button/social_buttons.dart';
import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/features/authentication/view/signup/verify_email.dart';
import 'package:e_commerce/features/authentication/view/signup/widgets/signup_form.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: UPadding.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  UTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
        
                const SizedBox(height: USizes.spaceBtwSections),
        
                USignUpForm(),
                const SizedBox(height: USizes.spaceBtwSections),
        
                UElevatedButton(
                  onPressed: (){
                    Get.to(()=> VerifyEmailView());
                  },
                  child: Text(UTexts.createAccount),
                ),
        
                const SizedBox(height: USizes.spaceBtwSections),
        
                UFormDivider(title: UTexts.orSignupWith),
        
                const SizedBox(height: USizes.spaceBtwSections),
        
                USocialButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


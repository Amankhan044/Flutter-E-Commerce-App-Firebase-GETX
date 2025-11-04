import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/social_buttons.dart';
import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/features/authentication/view/login/widgets/login_form.dart';
import 'package:e_commerce/features/authentication/view/login/widgets/login_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ULoginHeader(),
          
                const SizedBox(height: USizes.spaceBtwSections),
          
                ULoginForm(),
          
                   const SizedBox(height: USizes.spaceBtwSections),
                UFormDivider(title: UTexts.orSignInWith),
          
                const SizedBox(height: USizes.spaceBtwSections),
          
          
                USocialButtons()
              ],
          
          
            ),
          ),
        ),
      ),
    );
  }
}






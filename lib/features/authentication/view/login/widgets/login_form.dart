import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/view/forget_password/forget_password.dart';
import 'package:e_commerce/features/authentication/view/signup/signup_view.dart';
import 'package:e_commerce/features/authentication/viewmodel/login/login_viewmodel.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginViewmodel.instance;
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            validator: UValidator.validateEmail,
            controller: controller.email,
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              label: Text(UTexts.email),
            ),
          ),
          const SizedBox(height: USizes.spaceBtwInputFields),
          Obx(
            ()=> TextFormField(
              obscureText: controller.isPasswordVisible.value,
              validator:(value)=> UValidator.validateEmptyText('Password', value),
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                label: Text(UTexts.password),
                suffixIcon: IconButton(
                  onPressed: () => controller.isPasswordVisible.value =
                      !controller.isPasswordVisible.value,
                  icon: controller.isPasswordVisible.value
                      ? Icon(Iconsax.eye_slash)
                      : Icon(Iconsax.eye),
                ),
              ),
            ),
          ),

          const SizedBox(height: USizes.spaceBtwInputFields / 2),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.toggle())),
              Text(UTexts.rememberMe),
              Spacer(),
              TextButton(
                onPressed: () => Get.to(() => ForgetPasswordView()),
                child: Text(UTexts.forgetPassword),
              ),
            ],
          ),

          const SizedBox(height: USizes.spaceBtwSections),

          Column(
            children: [
              UElevatedButton(
                onPressed: () => controller.loginWithEmailAndPassword(),
                child: Text(UTexts.signIn),
              ),
            ],
          ),
          const SizedBox(height: USizes.spaceBtwItems / 2),

          Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => SignUpView());
                  },
                  child: Text(UTexts.createAccount),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

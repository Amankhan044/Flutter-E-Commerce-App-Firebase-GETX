import 'package:e_commerce/features/authentication/view/signup/widgets/privacy_policy_check.dart';
import 'package:e_commerce/features/authentication/viewmodel/signup/signup_viewmodel.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class USignUpForm extends StatelessWidget {
  const USignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupViewmodel.instance;
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      UValidator.validateEmptyText('First Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    label: Text(UTexts.firstName),
                  ),
                ),
              ),
              const SizedBox(width: USizes.spaceBtwInputFields),

              Expanded(
                child: TextFormField(
                  controller: controller.lastName,

                  validator: (value) =>
                      UValidator.validateEmptyText('Last Name', value),

                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    label: Text(UTexts.lastName),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: USizes.spaceBtwInputFields),

          TextFormField(
            controller: controller.email,

            validator: (value) => UValidator.validateEmail(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              label: Text(UTexts.email),
            ),
          ),

          const SizedBox(height: USizes.spaceBtwInputFields),

          TextFormField(
            controller: controller.phoneNumber,

            validator: (value) => UValidator.validatePhoneNumber(value),
            decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              label: Text(UTexts.phoneNumber),
            ),
          ),

          const SizedBox(height: USizes.spaceBtwInputFields),

          Obx(
            ()=> TextFormField(
              obscureText: controller.isPasswordVisible.value,
              controller: controller.password,
              decoration: InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                label: Text(UTexts.password),
                suffixIcon: IconButton(
                  onPressed: () => controller.isPasswordVisible.value =
                      !controller.isPasswordVisible.value,
                  icon: controller.isPasswordVisible.value
                      ? const Icon(Iconsax.eye_slash)
                      : const Icon(Iconsax.eye),
                ),
              ),
            ),
          ),

          const SizedBox(height: USizes.spaceBtwInputFields / 2),

          UPrivacyPolicyCheck(),
        ],
      ),
    );
  }
}

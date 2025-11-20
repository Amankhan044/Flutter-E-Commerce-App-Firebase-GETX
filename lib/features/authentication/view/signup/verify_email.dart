import 'package:e_commerce/common/screens/success/success_screen.dart';
import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/view/login/login_view.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => LoginView()),
            icon: const Icon(Icons.close),
          ),
        ],
      ),

      body: Padding(
        padding: UPadding.screenPadding,
        child: Column(
          children: [
            Image.asset(
              UImages.mailSentImage,
              height: UDeviceHelper.getScreenWidth(context) * 0.6,
            ),
            SizedBox(height: USizes.spaceBtwItems / 2),

            Text(
              UTexts.verifyEmailTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: USizes.spaceBtwItems / 2),

            Text(
              'amankhan06a@gmail.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            SizedBox(height: USizes.spaceBtwItems),
            Text(
              UTexts.verifyEmailSubTitle,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: USizes.spaceBtwSections),
            UElevatedButton(
              onPressed: () => Get.to(
                () => SuccessScreenView(
                  onTap: () {},
                  image: UImages.accountCreatedImage,
                  title: UTexts.accountCreatedTitle,
                  subTitle: UTexts.accountCreatedSubTitle,
                ),
              ),
              child: Text(UTexts.uContinue),
            ),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: Text(UTexts.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

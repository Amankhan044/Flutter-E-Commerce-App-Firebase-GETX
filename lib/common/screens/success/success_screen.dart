import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class SuccessScreenView extends StatelessWidget {
  const SuccessScreenView({super.key, required this.image, required this.title, required this.subTitle, required this.onTap});

  final String image;
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: UPadding.screenPadding,
        child: Column(
          children: [

             Image.asset(image, height: UDeviceHelper.getScreenWidth(context) * 0.6,),
               SizedBox(height: USizes.spaceBtwItems),

             Text(title, style: Theme.of(  context).textTheme.headlineMedium),
               SizedBox(height: USizes.spaceBtwItems),

        
              Text(subTitle, style: Theme.of(  context).textTheme.bodySmall, textAlign: TextAlign.center,),
               SizedBox(height: USizes.spaceBtwSections),
               UElevatedButton(onPressed: () {}, child: Text(UTexts.uContinue)),

              
          
        ]),
      )),
    );
  }
}
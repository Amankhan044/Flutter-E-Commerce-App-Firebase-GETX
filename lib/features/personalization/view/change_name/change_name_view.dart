import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/viewmodel/change_name/change_name_viewmodel.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/validators/validation.dart';

class ChangeNameView extends StatelessWidget {
  const ChangeNameView({super.key});
  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameViewmodel());
    return  Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Update Name', style: Theme.of(context).textTheme.headlineSmall),),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Text('Update Your name to keep your profile accurate and personalized', style: Theme.of(  context).textTheme.labelMedium),
          
              const SizedBox(height: USizes.spaceBtwSections),
              Form(
                key: controller.updateUserFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator:(value) =>  UValidator.validateEmptyText('First Name', value),
                      controller: controller.firstNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        label: Text(UTexts.firstName),
                      ),
                    ),

                    const SizedBox(height: USizes.spaceBtwInputFields),

                     TextFormField(
                      validator:(value) =>  UValidator.validateEmptyText('Last Name', value),
                      controller: controller.lastNameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        label: Text(UTexts.lastName),
                      ),
                    ),
                  ],
                ),
              ),
        
              const SizedBox(height: USizes.spaceBtwSections),
        
              UElevatedButton(onPressed: controller.upateUserName , child: Text('save'))
        
        
            ],
          ),
        ),
      ),
    );
  }
}
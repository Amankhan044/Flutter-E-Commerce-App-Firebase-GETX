import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/personalization/view_model/user/user_viewmodel.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class ReAuthenticateUserForm extends StatelessWidget {
  const ReAuthenticateUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =  UserViewmodel.instance;
    return  Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Re-Authenticate User', style: Theme.of(context).textTheme.headlineMedium,),),
      body: SingleChildScrollView(
        child: Padding(padding: UPadding.screenPadding, child: Form(
          key: controller.reAuthFormKey,
          child: Column(children: [
          
            TextFormField(
              controller: controller.email,
              validator: UValidator.validateEmail,
              decoration: InputDecoration(
                label: Text(UTexts.email),
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            SizedBox(height: USizes.spaceBtwInputFields,),
          
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
          SizedBox(height: USizes.spaceBtwSections,),
            UElevatedButton(onPressed: controller.reAuthenticateUser, child: Text('Verify'))
          ],),
        ),),
      ),
    );
  }
}
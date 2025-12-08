import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

import '../../../../personalization/view_model/user/user_viewmodel.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserViewmodel());
    return UAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UHelperFunctions.getGreetingMessage(),
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: UColors.grey),
          ),
          Obx(
            () { 
              if(controller.profileLoading.value){
                return const CircularProgressIndicator();

              }
              
              return Text(
              controller.user.value.fullName,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium!.apply(color: UColors.white),
            );}
          ),
        ],
      ),
    
      actions: [
        UCartCounterIcon(),
      ],
    );
  }
}

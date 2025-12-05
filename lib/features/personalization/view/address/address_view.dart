import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/personalization/view/address/add_new_address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import 'widget/single_address.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key, });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(showBackArrow: true, title: Text('Address', style: Theme.of(context).textTheme.headlineMedium,),),
      body: SingleChildScrollView(
        child: Padding(
          padding:UPadding.screenPadding,
          child: Column(
            children: [

              USingleAddress(isSelected: true,),
              SizedBox(height: USizes.spaceBtwItems,),
              USingleAddress(isSelected: false,),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UColors.primary,
        onPressed: ()=> Get.to(()=>AddNewAddressView()), child: const Icon(Iconsax.add, color: UColors.white,),),
    );
  }
}


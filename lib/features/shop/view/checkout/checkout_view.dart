import 'package:e_commerce/common/common_shapes/rounded_container.dart';
import 'package:e_commerce/common/screens/success/success_screen.dart';
import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/view/cart/widget/cart_items.dart';
import 'package:e_commerce/features/shop/view/checkout/widget/billing_address_section.dart';
import 'package:e_commerce/features/shop/view/checkout/widget/billing_amount_section.dart'
    show UBillingAmountSection;
import 'package:e_commerce/features/shop/view/checkout/widget/billing_payment_section.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/button/elevated_button.dart';
import '../../../../common/widgets/textfields/promo_code.dart';
import '../../../../utils/constants/sizes.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            children: [
              UCartItems(showCartItems: false),
              SizedBox(height: USizes.spaceBtwSections),
              UPromoCode(),
              SizedBox(height: USizes.spaceBtwSections),

              URoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(USizes.md),
                backgroundColor: Colors.transparent,
                child: Column(
                  children: [
                    UBillingAmountSection(),
                    SizedBox(height: USizes.spaceBtwItems),

                    BillingPaymentSection(),
                    SizedBox(height: USizes.spaceBtwItems),

                    UBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: UElevatedButton(
          onPressed: () => Get.to(
            () => SuccessScreenView(
              title: 'Payment Success',
              subTitle: 'Your item will be shipped soon!',
              image: UImages.successfulPaymentIcon,
              onTap: ()=> Get.offAll(()=> NavigationMenu()),
            ),
          ),
          child: Text('Checkout \$234'),
        ),
      ),
    );
  }
}

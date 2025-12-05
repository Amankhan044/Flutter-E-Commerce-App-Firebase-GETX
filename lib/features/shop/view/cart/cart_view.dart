import 'package:e_commerce/common/style/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/shop/view/cart/widget/cart_items.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../checkout/checkout_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
      ),

      body: Padding(
        padding: UPadding.screenPadding,
        child: UCartItems(),
      ),
    
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(USizes.defaultSpace),
      child: UElevatedButton(onPressed: ()=>Get.to( ()=> CheckOutView()), child: Text('Checkout \$234')),
    ),
    );
  }
}





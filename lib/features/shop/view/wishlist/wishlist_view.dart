import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: UAppBar(
        
        title: Text('WishList',style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          UCircularIcon(icon:   Iconsax.add, onPressed: ()=> NaviagtionController.instance.currentIndex.value =0,),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: SingleChildScrollView(
          child: UGridLayout(itemCount: 10, itemBuilder: (context, index) {
            return UProductCardVertical();
          },),
        ),
      ),
        
      
    );
  }
}
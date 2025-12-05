import 'package:e_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';

class USortableProducts extends StatelessWidget {
  const USortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          items:
              [
                'Name',
                'Lowest Price',
                'Highest Price',
                'Sale',
                'Newest',
              ].map((filter) {
                return DropdownMenuItem(
                  value: filter,
                  child: Text(filter),
                );
              }).toList(), 
        ),
        SizedBox(height: USizes.spaceBtwSections,),
    
        UGridLayout(itemCount: 10, itemBuilder: (context, index) {
          return UProductCardVertical();
        },),
      ],
    );
  }
}
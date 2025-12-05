import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class UBillingAddressSection extends StatelessWidget {
  const UBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        USectionHeading(title: 'Billing Address', buttonTitle: 'Change', onPressed: (){},),
        Text('Aman Khan', style: Theme.of(context).textTheme.titleLarge,),

        Row(
          children: [
            Icon(Icons.phone,size: USizes.iconSm,color: UColors.darkGrey,),
            SizedBox(width: USizes.spaceBtwItems,),
            Text('+92 313244444')
          ],
        ),
        SizedBox(height: USizes.spaceBtwItems/2,),
        Row(
          children: [
            Icon(Icons.location_history,size: USizes.iconSm,color: UColors.darkGrey,),
            SizedBox(width: USizes.spaceBtwItems,),
            Expanded(child: Text('house no 1, street no 1',softWrap: true,), )
          ],
        )

      ],
    );
  }
}
import 'package:e_commerce/common/common_shapes/rounded_container.dart';
import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helpers_functions.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        USectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: (){},),
        SizedBox(height: USizes.spaceBtwItems/2,),

        Row(
          children: [
            URoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ?UColors.light : UColors.white,
              padding: EdgeInsets.all(USizes.sm),
              child: Image(image: AssetImage(UImages.masterCard), fit: BoxFit.contain,),
            ),
            SizedBox(width: USizes.spaceBtwItems/2,),
            Text('Google Pay', style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )
      ],
    );
  }
}
import 'package:e_commerce/common/widgets/image_text/vertical_image_text.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:flutter/material.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: USizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            UTexts.popularCategories,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: UColors.white),
          ),

          SizedBox(height: USizes.spaceBtwItems),

          SizedBox(
            height: 90,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: USizes.spaceBtwItems),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return UVerticalImageText(
                  image: UImages.sportsIcon,
                  title: 'Sports Categories',
                  color: UColors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


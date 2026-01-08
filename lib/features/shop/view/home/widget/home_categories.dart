import 'package:e_commerce/common/widgets/image_text/vertical_image_text.dart';
import 'package:e_commerce/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce/features/shop/view/sub_category/sub_category_view.dart';
import 'package:e_commerce/features/shop/viewModel/category/category_view_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UHomeCategories extends StatelessWidget {
  const UHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryViewModel());
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

          Obx(
            () {

              if (controller.isCategoriesLoading.value) {
                return UCategoryShimmer();
                
              }

              if (controller.featuredCategories.isEmpty) {
                return Text('No Categories Found');
                
              }

              return SizedBox(
              height: 90,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(width: USizes.spaceBtwItems),
                itemCount: controller.featuredCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final category = controller.featuredCategories[index];
                  return UVerticalImageText(
                    onTap:()=> Get.to(()=> SubCategoryView()),
                    image: category.image,
                    title: category.name,
                    color: UColors.white,
                  );
                },
              ),
            );
            } 
          ),
        ],
      ),
    );
  }
}


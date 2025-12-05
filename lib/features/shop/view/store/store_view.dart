import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/view/brand/all_brands.dart';
import 'package:e_commerce/features/shop/view/store/widget/category_tab.dart';
import 'package:e_commerce/features/shop/view/store/widget/store_primary_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../utils/constants/sizes.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 475,
              pinned: true,
              floating: false,
              flexibleSpace: SingleChildScrollView(
                child: Column(
                  children: [
                    UStorePrimaryHeader(),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: USizes.defaultSpace,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: USizes.spaceBtwItems),
                          USectionHeading(title: 'Brands', onPressed: () => Get.to(()=> AllBrandsView())),

                          SizedBox(height: USizes.spaceBtwItems),
                          SizedBox(
                            height: 70,
                            child: ListView.separated(
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: USizes.spaceBtwItems),
                              itemBuilder: (context, index) {
                                return UBrandCard();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              bottom: UTabBar(),
            ),
          ];
        },
        body: TabBarView(
          children: [
            UCategoryTab(),
            UCategoryTab(),
            UCategoryTab(),
            UCategoryTab(),
            UCategoryTab(),

          ],
        ),
      ),
    );
  }
}



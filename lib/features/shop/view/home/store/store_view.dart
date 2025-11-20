import 'package:e_commerce/common/widgets/text/section_heading.dart';
import 'package:e_commerce/features/shop/view/home/store/widget/store_primary_header.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/brands/brand_card.dart';
import '../../../../../utils/constants/sizes.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 130,
            pinned: true,
            floating: true,
            flexibleSpace: UStorePrimaryHeader(),
          ),
        ];
      },
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: USizes.defaultSpace),
              child: Column(
                children: [
                  SizedBox(height: USizes.spaceBtwItems),
                  USectionHeading(title: 'Brands', onPressed: () {}),
              
                  SizedBox(height: USizes.spaceBtwItems),
              
                  SizedBox(
                    height: 70,
                    child: ListView.separated(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => const SizedBox(width: USizes.spaceBtwItems),
                      itemBuilder: (context, index) {
                        return UBrandCard();
                      },
                    ),
                  ),
              
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../features/shop/viewModel/category/category_view_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/device_helpers.dart';
import '../../../utils/helpers/helpers_functions.dart';

class UTabBar extends StatelessWidget implements PreferredSizeWidget {
  const UTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = CategoryViewModel.instance;

    return Material(
      color: dark ? UColors.black : UColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor:  UColors.primary,
        labelColor: dark ? UColors.white : UColors.primary,
        unselectedLabelColor: UColors.darkGrey,
        tabs: controller.featuredCategories.map((category) => Tab(text: category.name)).toList(),),
    );
  }
  
  @override
  Size get preferredSize =>  Size.fromHeight(UDeviceHelper.getAppBarHeight());
}

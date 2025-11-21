import 'package:flutter/material.dart';

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
    return Material(
      color: dark ? UColors.black : UColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor:  UColors.primary,
        labelColor: dark ? UColors.white : UColors.primary,
        unselectedLabelColor: UColors.darkGrey,
        tabs: const [
            
        Tab(child: Text('Sports'),),
        Tab(child: Text('Furniture'),),
        Tab(child: Text('Electronics'),),
        Tab(child: Text('Clothes'),),
        Tab(child: Text('Cosmetics'),),
      ]),
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  Size.fromHeight(UDeviceHelper.getAppBarHeight());
}

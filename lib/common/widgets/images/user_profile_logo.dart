import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/personalization/view_model/user/user_viewmodel.dart';
import '../../../utils/constants/images.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserViewmodel.instance;

    return Obx(() {
    final bool isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;

      return UCircularImage(
      image: isProfileAvailable? controller.user.value.profilePicture: UImages.profileLogo,
      width: 120,
      height: 120,
      padding: 0,
      borderWidth: 5.0,
      showBorder: true,
      isNetworkImage:isProfileAvailable? true : false,
    );
    },);
  }
}


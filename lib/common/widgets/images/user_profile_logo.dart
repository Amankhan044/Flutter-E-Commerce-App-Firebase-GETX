import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/images.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UCircularImage(
      image: UImages.profileLogo,
      width: 120,
      height: 120,
      padding: 0,
      borderWidth: 5.0,
      showBorder: true,
    );
  }
}


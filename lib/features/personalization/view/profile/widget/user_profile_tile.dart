import 'package:e_commerce/features/personalization/view/edit_profile/edit_profile_view.dart';
import 'package:e_commerce/features/personalization/view_model/user/user_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserViewmodel.instance;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Obx(
        () =>  Text(
          controller.user.value.fullName,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      subtitle: Obx(
        () =>  Text(
          controller.user.value.email,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(() => const EditProfileView()),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}

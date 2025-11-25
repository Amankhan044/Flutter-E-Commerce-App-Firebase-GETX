import 'package:e_commerce/features/personalization/view/edit_profile/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        'Profile',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        'Amankhan06a@gmail.com',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: IconButton(
        onPressed: () => Get.to(() => const EditProfileView()),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}

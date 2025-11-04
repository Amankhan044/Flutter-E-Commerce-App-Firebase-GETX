import 'package:e_commerce/features/authentication/view/signup/widgets/privacy_policy_check.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class USignUpForm extends StatelessWidget {
  const USignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  label: Text(UTexts.firstName),
                ),
              ),
            ),
            const SizedBox(width: USizes.spaceBtwInputFields),
    
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  label: Text(UTexts.lastName),
                ),
              ),
            ),
          ],
        ),
    
        const SizedBox(height: USizes.spaceBtwInputFields),
    
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            label: Text(UTexts.email),
          ),
        ),
    
        const SizedBox(height: USizes.spaceBtwInputFields),
    
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.call),
            label: Text(UTexts.phoneNumber),
          ),
        ),
    
        const SizedBox(height: USizes.spaceBtwInputFields),
    
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            label: Text(UTexts.password),
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),
    
        const SizedBox(height: USizes.spaceBtwInputFields / 2),
    
        UPrivacyPolicyCheck(),
      ],
    );
  }
}


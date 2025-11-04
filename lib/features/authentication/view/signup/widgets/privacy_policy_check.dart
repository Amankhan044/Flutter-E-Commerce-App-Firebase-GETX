import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/text.dart';
import 'package:e_commerce/utils/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class UPrivacyPolicyCheck extends StatelessWidget {
  const UPrivacyPolicyCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(text: '${UTexts.iAgreeTo} '),
              TextSpan(
                text: '${UTexts.privacyPolicy} ',
                style: Theme.of(context).textTheme.bodySmall!
                    .copyWith(
                      color:dark ? UColors.white : UColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor:dark ? UColors.white : UColors.primary,
                    ),
              ),
              TextSpan(text: UTexts.and),
              TextSpan(
                text: ' ${UTexts.termsOfUse} ',
                style: Theme.of(context).textTheme.bodySmall!
                    .copyWith(
                      color: dark ? UColors.white : UColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: dark ? UColors.white : UColors.primary,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

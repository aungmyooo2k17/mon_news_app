import 'package:flutter/material.dart';

import '../../../constants/size_constant.dart';
import '../../../theme/color_theme.dart';
import '../../../theme/theme_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GeneralSetting extends StatelessWidget {
  const GeneralSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.general,
          style: ThemeText.blackSubtitle1,
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.share_feedback,
              style: ThemeText.blackBodyText2,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.primaryColor,
              size: Sizes.dimen_20,
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.privacy,
              style: ThemeText.blackBodyText2,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.primaryColor,
              size: Sizes.dimen_20,
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.terms_of_use,
              style: ThemeText.blackBodyText2,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.primaryColor,
              size: Sizes.dimen_20,
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.about_us,
              style: ThemeText.blackBodyText2,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.primaryColor,
              size: Sizes.dimen_20,
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.contact_us,
              style: ThemeText.blackBodyText2,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColor.primaryColor,
              size: Sizes.dimen_20,
            ),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
      ],
    );
  }
}

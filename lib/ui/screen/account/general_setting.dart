import 'package:flutter/material.dart';
import 'package:mon_news_app/helper/app_helper.dart';
import 'package:mon_news_app/helper/shared_pref.dart';
import 'package:mon_news_app/ui/screen/dynamic_web_content_screen.dart';
import 'package:mon_news_app/ui/screen/feedback_screen.dart';

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
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FeedbackPage()),
            );
          },
          child: Row(
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
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
        GestureDetector(
          onTap: () async {
            Locale language = await getLocale();
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DynamicWebContentpage(
                        title: AppLocalizations.of(context)!.privacy,
                        url:
                            "https://app.thanlwintimes.com/${AppHelper.getLanguageCode(language.languageCode)}/privacy-policy",
                      )),
            );
          },
          child: Row(
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
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
        GestureDetector(
          onTap: () async {
            Locale language = await getLocale();
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DynamicWebContentpage(
                        title: AppLocalizations.of(context)!.terms_of_use,
                        url:
                            "https://app.thanlwintimes.com/${AppHelper.getLanguageCode(language.languageCode)}/terms-condition",
                      )),
            );
          },
          child: Row(
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
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
        GestureDetector(
          onTap: () async {
            Locale language = await getLocale();
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DynamicWebContentpage(
                        title: AppLocalizations.of(context)!.about_us,
                        url:
                            "https://app.thanlwintimes.com/${AppHelper.getLanguageCode(language.languageCode)}/about-us",
                      )),
            );
          },
          child: Row(
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
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
        const SizedBox(
          height: 8.0,
        ),
        GestureDetector(
          onTap: () async {
            Locale language = await getLocale();
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DynamicWebContentpage(
                        title: AppLocalizations.of(context)!.contact_us,
                        url:
                            "https://app.thanlwintimes.com/${AppHelper.getLanguageCode(language.languageCode)}/contact-us",
                      )),
            );
          },
          child: Row(
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

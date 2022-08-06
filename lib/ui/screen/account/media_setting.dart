import 'package:flutter/material.dart';
import 'package:mon_news_app/helper/shared_pref.dart';
import 'package:mon_news_app/provider/app_locale.dart';
import 'package:mon_news_app/ui/screen/bookmark_screen.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../constants/size_constant.dart';
import '../../../model/app_language.dart';
import '../../../theme/color_theme.dart';
import '../../../theme/theme_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MediaSetting extends StatefulWidget {
  const MediaSetting({Key? key}) : super(key: key);

  @override
  State<MediaSetting> createState() => _MediaSettingState();
}

class _MediaSettingState extends State<MediaSetting> {
  late String currentDefaultSystemLocale;
  int selectedLangIndex = 0;
  var _appLocale;

  @override
  void initState() {
    super.initState();
    dropdownValue = AppLanguage.languages().first;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appLocale = Provider.of<AppLocale>(context);
    getLocale().then((locale) {
      _appLocale.changeLocale(Locale(locale.languageCode));
      dropdownValue = AppLanguage.languages()
          .firstWhere((element) => element.languageCode == locale.languageCode);
    });
  }

  late AppLanguage dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.media,
          style: ThemeText.blackSubtitle1,
        ),
        const SizedBox(
          height: 16.0,
        ),
        GestureDetector(
          onTap: () {
            _showMyDialog();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookMarkPage()),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.bookmarks,
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
          onTap: () => {
            Share.share(
                "https://play.google.com/store/apps/details?id=com.thanlwintimes")
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.share_app,
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

  bool isSwitched = false;

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.choose_app_language,
            style: ThemeText.blackSubtitle1,
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<AppLanguage>(
                  value: dropdownValue,
                  iconSize: 40,
                  style: ThemeText.blackSubtitle1,
                  onChanged: (AppLanguage? language) {
                    dropdownValue = language!;
                    _appLocale.changeLocale(Locale(language.languageCode));
                    setLocale(language.languageCode);
                    setState(() {});
                  },
                  items: AppLanguage.languages()
                      .map<DropdownMenuItem<AppLanguage>>(
                        (e) => DropdownMenuItem<AppLanguage>(
                            value: e,
                            child: Text(
                              e.name,
                            )),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(AppLocalizations.of(context)!.ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

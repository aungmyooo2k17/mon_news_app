import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/ui/screen/account/general_setting.dart';
import 'package:mon_news_app/ui/screen/account/media_setting.dart';
import 'package:mon_news_app/ui/screen/account/version_setting.dart';
import 'package:mon_news_app/widget/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyAppBar(title: AppLocalizations.of(context)!.setting),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(Sizes.dimen_16),
          child: Column(
            children: const [
              MediaSetting(),
              SizedBox(
                height: 16.0,
              ),
              GeneralSetting(),
              SizedBox(
                height: 16.0,
              ),
              VersionSetting()
            ],
          ),
        ),
      ),
    );
  }
}

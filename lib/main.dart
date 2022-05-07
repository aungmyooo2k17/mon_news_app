import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'provider/app_locale.dart';
import 'theme/color_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppLocale(),
      child: Consumer<AppLocale>(builder: (context, locale, child) {
        return MaterialApp(
          title: 'Flutter translation',
          localizationsDelegates:
              AppLocalizations.localizationsDelegates, // important
          supportedLocales: AppLocalizations.supportedLocales, //
          theme: ThemeData(
            unselectedWidgetColor: Colors.black54,
            primaryColor: AppColor.primaryColor,
            scaffoldBackgroundColor: Colors.white,
            textTheme: ThemeText.getTextTheme(),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: AppColor.primaryColor),
          ),
          locale: locale.locale,
          home: const AppSplashScreen(),
        );
      }),
    );
  }
}

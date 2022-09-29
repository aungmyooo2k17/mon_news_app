import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mon_news_app/data/sharepreference/bookmark_preference.dart';
import 'package:mon_news_app/presentation/provider/app_general_provider.dart';
import 'package:mon_news_app/presentation/provider/bookmark_provider.dart';
import 'package:mon_news_app/presentation/provider/category_provider.dart';
import 'package:mon_news_app/presentation/provider/comment_provider.dart';
import 'package:mon_news_app/presentation/provider/like_provider.dart';
import 'package:mon_news_app/presentation/provider/topic_provider.dart';
import 'package:mon_news_app/presentation/provider/post_detail_provider.dart';
import 'package:mon_news_app/presentation/provider/post_provider.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/splash_screen.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:provider/provider.dart';

import 'data/app_repo.dart';
import 'di/injectable.dart';
import 'provider/app_locale.dart';
import 'theme/color_theme.dart';
import 'globals.dart' as globals;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();
  List<String> bookmarkList = await BookmarkPreference.getBookmark();
  globals.gBookmarkList.addAll(bookmarkList);
  String? result = await PlatformDeviceId.getDeviceId;
  globals.deviceId = result ?? "";

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLocale>(
          create: (_) => AppLocale(),
        ),
        ChangeNotifierProvider<TopicProvider>(
          create: (_) => TopicProvider(topicRepo: getItInstance<AppRepo>()),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider(appRepo: getItInstance<AppRepo>()),
        ),
        ChangeNotifierProvider<PostProvider>(
          create: (_) => PostProvider(appRepo: getItInstance<AppRepo>()),
        ),
        ChangeNotifierProvider<BookmarkProvider>(
          create: (_) => BookmarkProvider(appRepo: getItInstance<AppRepo>()),
        ),
        ChangeNotifierProvider<CommentProvider>(
          create: (_) => CommentProvider(appRepo: getItInstance<AppRepo>()),
        ),
        ChangeNotifierProvider<LikeProvider>(
          create: (_) => LikeProvider(appRepo: getItInstance<AppRepo>()),
        ),
        ChangeNotifierProvider<CommentProvider>(
          create: (_) => CommentProvider(appRepo: getItInstance<AppRepo>()),
        ),
        ChangeNotifierProvider<PostDetailProvider>(
          create: (_) => PostDetailProvider(appRepo: getItInstance<AppRepo>()),
        ),
        ChangeNotifierProvider<AppGeneralProvider>(
          create: (_) => AppGeneralProvider(appRepo: getItInstance<AppRepo>()),
        ),
      ],
      child: Consumer<AppLocale>(builder: (context, locale, child) {
        return MaterialApp(
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

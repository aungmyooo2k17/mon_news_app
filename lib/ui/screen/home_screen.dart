import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mon_news_app/ui/screen/account/account_screen.dart';
import 'package:mon_news_app/ui/screen/donate_screen.dart';
import 'package:mon_news_app/ui/screen/news_screen.dart';
import 'package:mon_news_app/ui/screen/story_post_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const NewsPage(),
    const StoryPostPage(),
    const DonatePage(),
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage("assets/images/new.png"),
            ),
            label: AppLocalizations.of(context)!.news,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage("assets/images/editor.png"),
            ),
            label: AppLocalizations.of(context)!.story_post,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage("assets/images/donate.png"),
            ),
            label: AppLocalizations.of(context)!.donate,
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage("assets/images/account.png"),
            ),
            label: AppLocalizations.of(context)!.setting,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
  }
}

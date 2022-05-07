import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';
import 'package:mon_news_app/ui/screen/news_list_screen.dart';
import 'package:mon_news_app/ui/screen/story_post_screen.dart';
import 'package:mon_news_app/widget/app_bar.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: MyAppBar(),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: AppColor.primaryColor,
            unselectedLabelColor: Colors.black87,
            indicatorColor: AppColor.primaryColor,
            tabs: [
              Tab(
                text: 'News',
              ),
              Tab(
                text: 'Reported Fake News',
              ),
              Tab(
                text: 'Videos',
              ),
              Tab(
                text: 'Audios',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            NewsListPage(),
            StoryPostPage(),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}

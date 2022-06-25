import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';
import 'package:mon_news_app/ui/screen/news_list_screen.dart';
import 'package:mon_news_app/ui/screen/story_post_screen.dart';
import 'package:mon_news_app/widget/app_bar.dart';
import 'package:provider/provider.dart';

import '../../presentation/model/topic_state.dart';
import '../../presentation/provider/movie_provider.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      context.read<TopicProvider>().fetchAllTopics();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<TopicProvider, TopicState>(
        selector: (_, provider) => provider.topicState,
        builder: (context, state, _) {
          return state.whenOrNull(loading: () {
                return const Center(child: CircularProgressIndicator());
              }, data: (data) {
                print(data.length);
                return DefaultTabController(
                  length: data.length,
                  child: Scaffold(
                    appBar: AppBar(
                      title: MyAppBar(),
                      backgroundColor: Colors.white,
                      bottom: TabBar(
                        isScrollable: true,
                        labelColor: AppColor.primaryColor,
                        unselectedLabelColor: Colors.black54,
                        indicatorColor: AppColor.primaryColor,
                        tabs: data
                            .map((e) => Tab(
                                  text: e.name,
                                ))
                            .toList(),
                      ),
                    ),
                    body: TabBarView(
                      children: data
                          .map((e) => NewsListPage(
                                topicId: e.id,
                              ))
                          .toList(),
                    ),
                  ),
                );
              }, error: (msg) {
                print("error: $msg");
                return Center(
                  child: Text(msg.toString()),
                );
              }) ??
              const Text('this');
        });
  }
}

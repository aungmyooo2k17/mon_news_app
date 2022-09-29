import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/color_theme.dart';
import 'package:mon_news_app/ui/screen/news_list_screen.dart';
import 'package:mon_news_app/widget/app_bar.dart';
import 'package:provider/provider.dart';

import '../../presentation/model/topic_state.dart';
import '../../presentation/provider/topic_provider.dart';

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
      debugPrint('FetchAllTopic');
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
                return DefaultTabController(
                  key: Key(data.length.toString()),
                  length: data.length - 1,
                  child: Scaffold(
                    appBar: AppBar(
                      title: const MyAppBar(),
                      backgroundColor: Colors.white,
                      bottom: TabBar(
                        isScrollable: true,
                        labelColor: AppColor.primaryColor,
                        unselectedLabelColor: Colors.black54,
                        indicatorColor: AppColor.primaryColor,
                        tabs: data
                            .where((element) => element.id != 8)
                            .map((e) => Tab(
                                  text: e.name,
                                ))
                            .toList(),
                      ),
                    ),
                    body: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: data
                          .where((element) => element.id != 8)
                          .map((e) => NewsListPage(
                                topicId: e.id,
                                key: Key(e.id.toString()),
                              ))
                          .toList(),
                    ),
                  ),
                );
              }, error: (msg) {
                return Center(
                  child: Text(msg.toString()),
                );
              }) ??
              const Text('this');
        });
  }
}

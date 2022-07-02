import 'package:flutter/material.dart';
import 'package:mon_news_app/presentation/model/post_state.dart';
import 'package:mon_news_app/presentation/model/topic_state.dart';
import 'package:mon_news_app/presentation/provider/movie_provider.dart';
import 'package:mon_news_app/presentation/provider/post_provider.dart';
import 'package:mon_news_app/widget/app_bar.dart';
import 'package:mon_news_app/widget/news_item.dart';
import 'package:provider/provider.dart';

import '../../presentation/provider/category_provider.dart';

class NewsListPage extends StatefulWidget {
  final int topicId;

  const NewsListPage({Key? key, required this.topicId}) : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  int currentPage = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      context.read<PostProvider>().fetchPostsByTopicId(widget.topicId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            print("onLoadMore()");
            currentPage = currentPage + 5;
            WidgetsBinding.instance.scheduleFrameCallback((_) {
              context.read<PostProvider>().fetchPostsByTopicIdWithPagination(
                  widget.topicId, currentPage, 5);
            });
          }
          return true;
        },
        child: Selector<PostProvider, PostState>(
          selector: (_, provider) => provider.postState,
          builder: (context, state, _) {
            return state.whenOrNull(loading: () {
                  return const Center(child: CircularProgressIndicator());
                }, data: (data) {
                  print(data.length);
                  return ListView.builder(
                    itemBuilder: (buildContext, index) {
                      return NewsItem(
                          postEntity: data[index],
                          category: data[index].category,
                          title: data[index].title,
                          credit: "Mizema",
                          createdAt: "May 7, 2022",
                          imagUrl: data[index].banner);
                    },
                    itemCount: data.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(5),
                    scrollDirection: Axis.vertical,
                  );
                }, error: (msg) {
                  print("error: $msg");
                  return Center(
                    child: Text(msg.toString()),
                  );
                }) ??
                const Text('this');
          },
        ),
      ),
    );
    // return ListView.builder(
    //   itemBuilder: (BuildContext, index) {
    //     return NewsItem(
    //         category: 'hi',
    //         title:
    //             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus at quam et elit pretium egestas venenatis tellus.",
    //         credit: "Mizema",
    //         createdAt: "May 7, 2022",
    //         imagUrl: "assets/images/news.png");
    //   },
    //   itemCount: 7,
    //   shrinkWrap: true,
    //   padding: EdgeInsets.all(5),
    //   scrollDirection: Axis.vertical,
    // );
  }
}

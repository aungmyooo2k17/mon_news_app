import 'package:flutter/material.dart';
import 'package:mon_news_app/presentation/model/post_state.dart';
import 'package:mon_news_app/presentation/provider/post_provider.dart';
import 'package:mon_news_app/ui/screen/no_data.dart';
import 'package:mon_news_app/widget/news_item.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  final int topicId;

  const NewsListPage({Key? key, required this.topicId}) : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(invokeOnScrollEnd);
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      context.read<PostProvider>().fetchPostsByTopicId(widget.topicId);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void invokeOnScrollEnd() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      context
          .read<PostProvider>()
          .fetchPostsByTopicIdWithPagination(widget.topicId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<PostProvider, PostState>(
        shouldRebuild: (previous, next) => true,
        selector: (_, provider) => provider.postState,
        builder: (context, state, _) {
          return state.whenOrNull(loading: () {
                return const Center(child: CircularProgressIndicator());
              }, data: (data) {
                if (data.isNotEmpty) {
                  return ListView.builder(
                    controller: _scrollController,
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
                    padding: const EdgeInsets.all(5),
                    scrollDirection: Axis.vertical,
                  );
                } else {
                  return const NoData();
                }
              }, error: (msg) {
                return Center(
                  child: Text(msg.toString()),
                );
              }) ??
              const Text('this');
        },
      ),
    );
  }
}

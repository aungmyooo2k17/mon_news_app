import 'package:flutter/material.dart';
import 'package:mon_news_app/presentation/model/post_state.dart';
import 'package:mon_news_app/presentation/provider/post_provider.dart';
import 'package:mon_news_app/widget/app_bar.dart';
import 'package:mon_news_app/widget/news_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoryPostPage extends StatefulWidget {
  const StoryPostPage({Key? key}) : super(key: key);

  @override
  State<StoryPostPage> createState() => _StoryPostPageState();
}

class _StoryPostPageState extends State<StoryPostPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      context.read<PostProvider>().fetchAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: MyAppBar(
            title: AppLocalizations.of(context)!.story_post,
          ),
          backgroundColor: Colors.white,
        ),
        body: Selector<PostProvider, PostState>(
          selector: (_, provider) => provider.postState,
          builder: (context, state, _) {
            return state.whenOrNull(loading: () {
                  return const Center(child: CircularProgressIndicator());
                }, data: (data) {
                  print(data.length);
                  return ListView.builder(
                    itemBuilder: (BuildContext, index) {
                      return NewsItem(
                          postEntity: data[index],
                          category: data[index].category,
                          title: data[index].title,
                          credit: "Thanlwin",
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
        ));
  }
}

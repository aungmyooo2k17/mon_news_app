import 'package:flutter/material.dart';
import 'package:mon_news_app/domain/post_entity.dart';
import 'package:mon_news_app/presentation/model/bookmark_state.dart';
import 'package:mon_news_app/presentation/model/post_state.dart';
import 'package:mon_news_app/presentation/provider/bookmark_provider.dart';
import 'package:mon_news_app/ui/screen/no_data.dart';
import 'package:mon_news_app/widget/app_bar.dart';
import 'package:mon_news_app/widget/news_item.dart';
import 'package:provider/provider.dart';
import '../../globals.dart' as globals;

class BookMarkPage extends StatefulWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  State<BookMarkPage> createState() => _BookMarkPageState();
}

class _BookMarkPageState extends State<BookMarkPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      context.read<BookmarkProvider>().fetchBookmark();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const MyAppBar(
            title: "Bookmarks",
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Selector<BookmarkProvider, BookmarkState>(
          selector: (_, provider) => provider.postState,
          builder: (context, state, _) {
            return state.whenOrNull(loading: () {
                  return const Center(child: CircularProgressIndicator());
                }, data: (data) {
                  if (data.length != 0) {
                    return ListView.builder(
                      itemBuilder: (BuildContext, index) {
                        return NewsItem(
                            postEntity: PostEntity(
                                bookmarkId: data[index].id,
                                isBookMark: true,
                                id: data[index].postId,
                                title: data[index].title,
                                banner: data[index].banner,
                                videoUrl: data[index].videoUrl,
                                audioUrl: data[index].audioUrl,
                                content: data[index].content,
                                topic: data[index].topic,
                                category: data[index].category),
                            category: data[index].category,
                            title: data[index].title,
                            credit: "TLTNews",
                            createdAt: data[index].publishedAt,
                            imagUrl: data[index].category);
                      },
                      itemCount: data.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(5),
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
        ));
  }
}

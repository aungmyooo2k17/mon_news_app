import 'package:flutter/material.dart';
import 'package:mon_news_app/presentation/model/bookmark_state.dart';
import 'package:mon_news_app/presentation/model/post_state.dart';
import 'package:mon_news_app/presentation/provider/bookmark_provider.dart';
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
      context.read<BookmarkProvider>().fetchBookmarkById(globals.deviceId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const MyAppBar(
            title: "Editor-In-Chief",
          ),
          backgroundColor: Colors.white,
        ),
        body: Selector<BookmarkProvider, BookmarkState>(
          selector: (_, provider) => provider.postState,
          builder: (context, state, _) {
            return state.whenOrNull(loading: () {
                  return const Center(child: CircularProgressIndicator());
                }, data: (data) {
                  print(data.length);
                  return Text(data.toString());
                  // return ListView.builder(
                  //   itemBuilder: (BuildContext, index) {
                  //     return NewsItem(
                  //         postEntity: data[index],
                  //         category: data[index].category,
                  //         title: data[index].title,
                  //         credit: "Mizema",
                  //         createdAt: "May 7, 2022",
                  //         imagUrl: data[index].banner);
                  //   },
                  //   itemCount: data.length,
                  //   shrinkWrap: true,
                  //   padding: EdgeInsets.all(5),
                  //   scrollDirection: Axis.vertical,
                  // );
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

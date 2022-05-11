import 'package:flutter/material.dart';
import 'package:mon_news_app/ui/screen/comment_screen/comment_item.dart';

class CommentPage extends StatefulWidget {
  CommentPage({Key? key}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.cancel_outlined),
              onPressed: () => Navigator.pop(context)),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text('Comments'),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext, index) {
            return const CommentItem(
              isInReportPage: false,
            );
          },
          itemCount: 4,
          shrinkWrap: true,
          separatorBuilder: (context, index) =>
              Divider(height: 1, color: Colors.green),
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
        ));
  }
}

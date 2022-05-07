import 'package:flutter/material.dart';
import 'package:mon_news_app/widget/app_bar.dart';
import 'package:mon_news_app/widget/news_item.dart';

class StoryPostPage extends StatefulWidget {
  StoryPostPage({Key? key}) : super(key: key);

  @override
  State<StoryPostPage> createState() => _StoryPostPageState();
}

class _StoryPostPageState extends State<StoryPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: MyAppBar(
            title: "Editor-In-Chief",
          ),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext, index) {
            return const NewsItem(
                category: "Myanmar",
                title:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Rhoncus at quam et elit pretium egestas venenatis tellus.",
                credit: "Mizema",
                createdAt: "May 7, 2022",
                imagUrl: "assets/images/news.png");
          },
          itemCount: 4,
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/comment_screen/comment_screen.dart';
import 'package:mon_news_app/widget/app_bar_with_back_btn.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  NewsDetailPage({Key? key}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            const WebView(
              initialUrl: 'https://docs.flutter.dev',
            ),
            Positioned(
              bottom: -8,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.only(bottom: 8, top: 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: null,
                        icon: Icon(
                          Icons.thumb_up,
                          color: Colors.grey.shade800,
                        ),
                        label: Text(
                          "234",
                          style: ThemeText.blackBodyText2,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CommentPage()),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                        child: ElevatedButton.icon(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: null,
                          icon: Icon(
                            Icons.comment,
                            color: Colors.grey.shade800,
                          ),
                          label: Text(
                            "432",
                            style: ThemeText.blackBodyText2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: null,
                        icon: Icon(
                          Icons.bookmark,
                          color: Colors.grey.shade800,
                        ),
                        label: const Text(''),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: null,
                        icon: Icon(
                          Icons.share,
                          color: Colors.grey.shade800,
                        ),
                        label: const Text(''),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

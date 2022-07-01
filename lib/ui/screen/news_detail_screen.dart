import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/domain/post_entity.dart';
import 'package:mon_news_app/presentation/provider/like_provider.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/comment_screen/comment_screen.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../globals.dart' as globals;

class NewsDetailPage extends StatefulWidget {
  final PostEntity postEntity;

  NewsDetailPage({Key? key, required this.postEntity}) : super(key: key);

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
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(Sizes.dimen_16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.postEntity.title,
                          maxLines: 3,
                          overflow: TextOverflow.fade,
                          style: ThemeText.title,
                        ),
                        const SizedBox(
                          height: Sizes.dimen_12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'By Thanlwintimes - March 16, 2022',
                              style: ThemeText.blackBodyText2,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.black,
                                  size: Sizes.dimen_20,
                                ),
                                Text(
                                  " 3464",
                                  style: ThemeText.blackBodyText2,
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Image.network(widget.postEntity.banner),
                  Padding(
                    padding: const EdgeInsets.all(Sizes.dimen_8),
                    child: SizedBox(
                      height: 850,
                      child: WebView(
                          javascriptMode: JavascriptMode.unrestricted,
                          onWebViewCreated:
                              (WebViewController webViewController) async {
                            await webViewController.loadHtmlString('''
                        <!DOCTYPE html>
                          <html lang="en">
                            <head>
                              <meta charset="UTF-8" />
                              <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                              <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                              <title>Document</title>
                            </head>
                            <body>
                              ${widget.postEntity.content}
                            </body>
                          </html>
                        ''');
                          }),
                    ),
                  )
                  // WebView(
                  //   javascriptMode: JavascriptMode.unrestricted,
                  //   onWebViewCreated:
                  //       (WebViewController webViewController) async {
                  //     await webViewController.loadHtmlString('''
                  //     <!DOCTYPE html>
                  //       <html lang="en">
                  //         <head>
                  //           <meta charset="UTF-8" />
                  //           <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                  //           <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                  //           <title>Document</title>
                  //         </head>
                  //         <body>
                  //           ${widget.postEntity.content}
                  //         </body>
                  //       </html>
                  //     ''');
                  //   },
                  // ),
                ],
              ),
            ),
            Positioned(
              bottom: -8,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.only(bottom: 8, top: 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.read<LikeProvider>().postLike(
                          widget.postEntity.id.toString(), globals.deviceId),
                      child: SizedBox(
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
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CommentPage(
                                  postId: widget.postEntity.id,
                                )),
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
                    GestureDetector(
                      onTap: () => {},
                      child: SizedBox(
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
                    ),
                    GestureDetector(
                      onTap: () => {},
                      child: SizedBox(
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

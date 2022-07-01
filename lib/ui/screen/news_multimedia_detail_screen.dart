import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/domain/post_entity.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/comment_screen/comment_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class NewsMultimediaDetailPage extends StatefulWidget {
  final PostEntity postEntity;

  NewsMultimediaDetailPage({Key? key, required this.postEntity})
      : super(key: key);

  @override
  State<NewsMultimediaDetailPage> createState() =>
      _NewsMultimediaDetailPageState();
}

class _NewsMultimediaDetailPageState extends State<NewsMultimediaDetailPage> {
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'w6LT7lVQX7U',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  late YoutubePlayerController _controller;
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
                  YoutubePlayer(controller: _controller),
                  // Image.network(widget.postEntity.banner),
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/domain/post_entity.dart';
import 'package:mon_news_app/presentation/model/post_detail_state.dart';
import 'package:mon_news_app/presentation/provider/like_provider.dart';
import 'package:mon_news_app/presentation/provider/post_detail_provider.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/comment_screen/comment_screen.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../globals.dart' as globals;

class NewsDetailPage extends StatefulWidget {
  final PostEntity postEntity;

  NewsDetailPage({Key? key, required this.postEntity}) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      context.read<PostDetailProvider>().fetchPostDetail(widget.postEntity.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Selector<PostDetailProvider, PostDetailState>(
        shouldRebuild: (previous, next) => true,
        selector: (_, provider) => provider.postState,
        builder: (context, state, _) {
          return state.whenOrNull(loading: () {
                return newsDetail(context, widget.postEntity);
              }, detail: (data) {
                return newsDetail(context, data);
              }) ??
              Container();
        },
      ),
    );
  }

  Widget newsDetail(BuildContext context, PostEntity data) {
    return SizedBox(
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
                            'By TLT News - ${widget.postEntity.publishedAt}',
                            style: ThemeText.blackBodyText2,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                                size: Sizes.dimen_20,
                              ),
                              const SizedBox(
                                width: Sizes.dimen_8,
                              ),
                              Text(
                                data.views != null
                                    ? data.views.toString()
                                    : '0',
                                style: ThemeText.blackBodyText2,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                CachedNetworkImage(imageUrl: widget.postEntity.banner),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: Sizes.dimen_20,
                      left: Sizes.dimen_8,
                      right: Sizes.dimen_8),
                  child: Html(style: {
                    "body": Style(color: Colors.black),
                  }, data: """
                      <!DOCTYPE html>
                      <html lang="en">
                        <head>
                        <meta charset="UTF-8" />
                        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                        <title>Document</title>
                        </head>
                        <body style="color: #EEEEEE">
                        ${widget.postEntity.content}
                        </body>
                      </html>
                      """),
                )
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
                    onTap: () async {
                      if (data.isliked!) {
                        int likeId = await context
                            .read<LikeProvider>()
                            .deleteLike(data.likeId!);

                        context.read<PostDetailProvider>().removeLike(likeId);
                      } else {
                        int likeId = await context
                            .read<LikeProvider>()
                            .postLike(widget.postEntity.id.toString(),
                                globals.deviceId);

                        context.read<PostDetailProvider>().addLike(likeId);
                      }
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: null,
                        icon: data.isliked != null && data.isliked!
                            ? const Icon(
                                Icons.thumb_up,
                                color: Colors.blue,
                              )
                            : Icon(
                                Icons.thumb_up,
                                color: Colors.grey.shade800,
                              ),
                        label: Text(
                          data.likes != null ? data.likes.toString() : '0',
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
                      width: MediaQuery.of(context).size.width / 3,
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
                          data.comments != null
                              ? data.comments.toString()
                              : '0',
                          style: ThemeText.blackBodyText2,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(data.shareLink ?? "");
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
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
    );
  }
}

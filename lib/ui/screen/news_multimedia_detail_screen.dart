import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/domain/post_entity.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/comment_screen/comment_screen.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../presentation/model/post_detail_state.dart';
import '../../presentation/provider/like_provider.dart';
import '../../presentation/provider/post_detail_provider.dart';
import '../../globals.dart' as globals;

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
    String? url = widget.postEntity.audioUrl != ""
        ? widget.postEntity.audioUrl
        : widget.postEntity.videoUrl;
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url!) ?? "",
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
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      context.read<PostDetailProvider>().fetchPostDetail(widget.postEntity.id);
    });
  }

  late YoutubePlayerController _controller;
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
                    return const Center(child: CircularProgressIndicator());
                  }, detail: (data) {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                              const SizedBox(
                                                width: Sizes.dimen_8,
                                              ),
                                              Text(
                                                data.views.toString(),
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
                              decoration:
                                  const BoxDecoration(color: Colors.white),
                              padding: const EdgeInsets.only(bottom: 8, top: 0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      if (data.isliked!) {
                                        int likeId = await context
                                            .read<LikeProvider>()
                                            .deleteLike(data.likeId!);

                                        context
                                            .read<PostDetailProvider>()
                                            .removeLike(likeId);
                                      } else {
                                        int likeId = await context
                                            .read<LikeProvider>()
                                            .postLike(
                                                widget.postEntity.id.toString(),
                                                globals.deviceId);

                                        context
                                            .read<PostDetailProvider>()
                                            .addLike(likeId);
                                      }
                                    },
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: ElevatedButton.icon(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                        ),
                                        onPressed: null,
                                        icon: data.isliked!
                                            ? const Icon(
                                                Icons.thumb_up,
                                                color: Colors.blue,
                                              )
                                            : Icon(
                                                Icons.thumb_up,
                                                color: Colors.grey.shade800,
                                              ),
                                        label: Text(
                                          data.likes.toString(),
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
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: ElevatedButton.icon(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                        ),
                                        onPressed: null,
                                        icon: Icon(
                                          Icons.comment,
                                          color: Colors.grey.shade800,
                                        ),
                                        label: Text(
                                          data.comments.toString(),
                                          style: ThemeText.blackBodyText2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // GestureDetector(
                                  //   onTap: () async {
                                  //     if (widget.postEntity.isBookMark) {
                                  //       context
                                  //           .read<BookmarkProvider>()
                                  //           .deleteBookmark(
                                  //               widget.postEntity.bookmarkId!,
                                  //               globals.deviceId);
                                  //       globals.gBookmarkList.remove(widget
                                  //           .postEntity.bookmarkId!
                                  //           .toString());
                                  //       context
                                  //           .read<PostDetailProvider>()
                                  //           .removeBookmark(
                                  //               widget.postEntity.bookmarkId!);
                                  //     } else {
                                  //       int bookmarkId = await context
                                  //           .read<BookmarkProvider>()
                                  //           .insertBookmark(
                                  //               widget.postEntity.id.toString(),
                                  //               globals.deviceId);
                                  //       // ignore: use_build_context_synchronously
                                  //       context
                                  //           .read<PostDetailProvider>()
                                  //           .addBookmark(
                                  //               widget.postEntity.id, bookmarkId);
                                  //     }
                                  //   },
                                  //   child: SizedBox(
                                  //     width: MediaQuery.of(context).size.width / 4,
                                  //     child: ElevatedButton.icon(
                                  //       style: ButtonStyle(
                                  //         backgroundColor:
                                  //             MaterialStateProperty.all(
                                  //                 Colors.white),
                                  //       ),
                                  //       onPressed: null,
                                  //       icon: widget.postEntity.isBookMark
                                  //           ? const Icon(
                                  //               Icons.bookmark,
                                  //               color: AppColor.secondaryColor,
                                  //               size: Sizes.dimen_20,
                                  //             )
                                  //           : Icon(
                                  //               Icons.bookmark,
                                  //               color: Colors.grey.shade800,
                                  //               size: Sizes.dimen_20,
                                  //             ),
                                  //       label: const Text(''),
                                  //     ),
                                  //   ),
                                  // ),
                                  GestureDetector(
                                    onTap: () {
                                      Share.share(data.shareLink ?? "");
                                    },
                                    child: SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: ElevatedButton.icon(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
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
                  }) ??
                  Container();
            }));
  }
}

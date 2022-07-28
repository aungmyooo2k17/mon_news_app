import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/domain/post_entity.dart';
import 'package:mon_news_app/presentation/model/post_state.dart';
import 'package:mon_news_app/presentation/provider/bookmark_provider.dart';
import 'package:mon_news_app/presentation/provider/post_provider.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/news_detail_screen.dart';
import 'package:mon_news_app/ui/screen/news_multimedia_detail_screen.dart';
import 'package:provider/provider.dart';

import '../theme/color_theme.dart';
import '../globals.dart' as globals;

class NewsItem extends StatefulWidget {
  final PostEntity postEntity;
  final String category;
  final String title;
  final String credit;
  final String createdAt;
  final String? imagUrl;
  final String? audioUrl;
  final String? videoUrl;

  const NewsItem(
      {Key? key,
      required this.postEntity,
      required this.category,
      required this.title,
      required this.credit,
      required this.createdAt,
      required this.imagUrl,
      this.audioUrl,
      this.videoUrl});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(Sizes.dimen_8),
        height: Sizes.dimen_200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(widget.imagUrl ?? ''),
            fit: BoxFit.fill,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(96, 0, 0, 0),
                    Color.fromARGB(200, 0, 0, 0)
                  ],
                ),
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            widget.audioUrl != null
                ? Row(
                    children: [
                      const Icon(
                        Icons.play_circle,
                        color: Colors.white,
                        size: Sizes.dimen_20,
                      ),
                      Text(
                        "Audio Content",
                        style: ThemeText.whiteBodyText2,
                      )
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.only(
                        top: Sizes.dimen_4,
                        bottom: Sizes.dimen_4,
                        right: Sizes.dimen_8,
                        left: Sizes.dimen_8),
                    margin: const EdgeInsets.only(
                        top: Sizes.dimen_8, left: Sizes.dimen_8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      widget.category,
                      style: ThemeText.whiteBodyText2,
                    ),
                  ),
            Positioned(
              bottom: Sizes.dimen_14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                widget.postEntity.topic == 'Multimedia'
                                    ? NewsMultimediaDetailPage(
                                        postEntity: widget.postEntity)
                                    : NewsDetailPage(
                                        postEntity: widget.postEntity,
                                      )),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: Sizes.dimen_8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width -
                                Sizes.dimen_48,
                            child: Text(
                              widget.title,
                              maxLines: 3,
                              overflow: TextOverflow.fade,
                              style: ThemeText.newsItemTitle,
                            ),
                          ),
                          const SizedBox(
                            height: Sizes.dimen_16,
                          ),
                          Text(
                            '${widget.credit} - ${widget.createdAt}',
                            maxLines: 2,
                            style: ThemeText.newsItemCreditAndTime,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: Sizes.dimen_14,
              right: Sizes.dimen_14,
              child: IconButton(
                onPressed: () async {
                  if (widget.postEntity.isBookMark) {
                    context.read<BookmarkProvider>().deleteBookmark(
                        widget.postEntity.bookmarkId!, globals.deviceId);
                    globals.gBookmarkList
                        .remove(widget.postEntity.bookmarkId!.toString());
                    context
                        .read<PostProvider>()
                        .removeBookmark(widget.postEntity.bookmarkId!);
                  } else {
                    int bookmarkId = await context
                        .read<BookmarkProvider>()
                        .insertBookmark(
                            widget.postEntity.id.toString(), globals.deviceId);
                    // ignore: use_build_context_synchronously
                    context
                        .read<PostProvider>()
                        .addBookmark(widget.postEntity.id, bookmarkId);
                  }
                },
                icon: widget.postEntity.isBookMark
                    ? const Icon(
                        Icons.bookmark,
                        color: AppColor.secondaryColor,
                        size: Sizes.dimen_20,
                      )
                    : const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: Sizes.dimen_20,
                      ),
              ),
            ),
            widget.audioUrl != null || widget.videoUrl != null
                ? const Positioned.fill(
                    child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.play_circle,
                      color: Colors.white,
                      size: Sizes.dimen_20,
                    ),
                  ))
                : Container()
          ],
        ));
  }
}

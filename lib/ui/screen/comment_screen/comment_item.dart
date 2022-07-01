import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/domain/comment_entity.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/report_screen.dart';

class CommentItem extends StatelessWidget {
  final bool isInReportPage;
  final CommentEntity commentEntity;
  const CommentItem(
      {Key? key, required this.isInReportPage, required this.commentEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          profile(context),
          const SizedBox(
            height: Sizes.dimen_16,
          ),
          Text(
            commentEntity.comment,
            style: ThemeText.blackBodyText2,
          ),
        ],
      ),
    );
  }

  Widget profile(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              child: ClipOval(
                  child: Image.asset(
                'assets/images/logo.png',
                width: 80,
                height: 80,
              )),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              children: [
                Text(
                  'User',
                  style: ThemeText.blackSubtitle1,
                ),
                Text('Apr 20, 2022', style: ThemeText.blackBodyText2)
              ],
            ),
          ],
        ),
        !isInReportPage
            ? GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReportPage(
                            commentEntity: commentEntity,
                          )),
                ),
                child: Icon(
                  Icons.more_vert,
                  color: Colors.grey.shade800,
                ),
              )
            : Container(),
      ],
    );
  }
}

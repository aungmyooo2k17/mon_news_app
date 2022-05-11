import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/report_screen.dart';

class CommentItem extends StatelessWidget {
  final bool isInReportPage;
  const CommentItem({Key? key, required this.isInReportPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          profile(context),
          SizedBox(
            height: 16,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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
                  'Aung Myo oo',
                  style: ThemeText.blackSubtitle1,
                ),
                Text('Apr 20', style: ThemeText.blackBodyText2)
              ],
            ),
          ],
        ),
        !isInReportPage
            ? GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportPage()),
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

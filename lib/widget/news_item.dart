import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/news_detail_screen.dart';

import '../theme/color_theme.dart';

class NewsItem extends StatelessWidget {
  final String category;
  final String title;
  final String credit;
  final String createdAt;
  final String imagUrl;

  const NewsItem({
    Key? key,
    required this.category,
    required this.title,
    required this.credit,
    required this.createdAt,
    required this.imagUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(Sizes.dimen_8),
        height: Sizes.dimen_200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imagUrl),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                    category,
                    style: ThemeText.whiteBodyText2,
                  ),
                ),
                const SizedBox(height: Sizes.dimen_40),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewsDetailPage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: Sizes.dimen_8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 3,
                          style: ThemeText.newsItemTitle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              credit + ' - ' + createdAt,
                              maxLines: 2,
                              style: ThemeText.newsItemCreditAndTime,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bookmark,
                                color: AppColor.secondaryColor,
                                size: Sizes.dimen_20,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}

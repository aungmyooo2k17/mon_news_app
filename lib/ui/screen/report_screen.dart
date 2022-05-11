import 'package:flutter/material.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/comment_screen/comment_item.dart';
import 'package:mon_news_app/widget/app_btn.dart';
import 'package:mon_news_app/widget/app_btn_outline.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.cancel_outlined),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text('Report'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Report Aung Myo oo",
                style: ThemeText.blackBodyText2,
              ),
              SizedBox(
                height: 16,
              ),
              const Card(
                  child: CommentItem(
                isInReportPage: true,
              )),
              SizedBox(
                height: 16,
              ),
              reporting()
            ],
          ),
        ),
      ),
    );
  }

  Widget reporting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Reason for report",
          style: ThemeText.blackBodyText2,
        ),
        SizedBox(
          height: 16,
        ),
        ListView.builder(
          itemBuilder: (BuildContext, index) {
            return AppBtnOutline(label: "Other");
          },
          itemCount: 4,
          shrinkWrap: true,
        ),
        SizedBox(
          height: 16,
        ),
        AppBtn(label: "Submit")
      ],
    );
  }
}

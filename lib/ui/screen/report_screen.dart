import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/domain/comment_entity.dart';
import 'package:mon_news_app/presentation/provider/comment_provider.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/ui/screen/comment_screen/comment_item.dart';
import 'package:mon_news_app/widget/app_btn.dart';
import 'package:mon_news_app/widget/app_text_field.dart';
import 'package:mon_news_app/widget/report_radio_btn.dart';
import 'package:provider/provider.dart';

class ReportPage extends StatefulWidget {
  final CommentEntity commentEntity;
  const ReportPage({Key? key, required this.commentEntity}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController reportReasonController = TextEditingController();
  final List<String> reports = [
    "Misinformation",
    "Personal",
    "Abuse",
    "Defamatory",
    "Offensive",
    "Threatening",
    "Discriminatory",
    "Spam",
    "Other"
  ];
  int value = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.cancel_outlined),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Report'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Report Users",
                style: ThemeText.blackBodyText2,
              ),
              const SizedBox(
                height: 16,
              ),
              Card(
                  child: CommentItem(
                commentEntity: widget.commentEntity,
                isInReportPage: true,
              )),
              const SizedBox(
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
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reason for report",
            style: ThemeText.blackBodyText2,
          ),
          const SizedBox(
            height: 16,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext, index) {
              return ReportRadioBtn(
                label: reports[index],
                index: index,
                value: value,
                onPressed: () {
                  setState(() {
                    value = index;
                  });
                },
              );
            },
            itemCount: reports.length,
            shrinkWrap: true,
          ),
          const SizedBox(
            height: Sizes.dimen_16,
          ),
          value == 8
              ? AppTextField(
                  hint: "Enter your reason here.",
                  controller: reportReasonController)
              : Container(),
          AppBtn(
            label: "Submit",
            onTap: () async {
              String reportReason =
                  value == 8 ? reportReasonController.text : reports[value];
              int result = await context
                  .read<CommentProvider>()
                  .postCommentReport(widget.commentEntity.id, reportReason);

              if (result == 1) {
                showInSnackBar("Reported successfully.");
                reportReasonController.clear();
              } else {
                showInSnackBar("Something went wrong");
              }
            },
          )
        ],
      ),
    );
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}

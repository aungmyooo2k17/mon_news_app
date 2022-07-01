import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/presentation/model/comment_state.dart';
import 'package:mon_news_app/presentation/provider/comment_provider.dart';
import 'package:mon_news_app/ui/screen/comment_screen/comment_item.dart';
import 'package:mon_news_app/widget/app_btn.dart';
import 'package:mon_news_app/widget/app_text_field.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommentPage extends StatefulWidget {
  final int postId;
  const CommentPage({Key? key, required this.postId}) : super(key: key);

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.scheduleFrameCallback((_) {
      context.read<CommentProvider>().fetchAllComments(widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: IconButton(
            icon: const Icon(Icons.cancel_outlined),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(AppLocalizations.of(context)!.cards),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Selector<CommentProvider, CommentState>(
          selector: (_, provider) => provider.commentState,
          builder: (context, state, _) {
            return state.whenOrNull(loading: () {
                  return const Center(child: CircularProgressIndicator());
                }, data: (data) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListView.separated(
                          itemBuilder: (BuildContext, index) {
                            return CommentItem(
                              commentEntity: data[index],
                              isInReportPage: false,
                            );
                          },
                          itemCount: data.length,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              Divider(height: 1, color: Colors.grey[400]),
                          padding: const EdgeInsets.all(Sizes.dimen_8),
                          scrollDirection: Axis.vertical,
                        ),
                        Container(
                          width: 100,
                          child: Row(
                            children: [
                              Expanded(
                                child: AppTextField(hint: "Leave"),
                              ),
                              AppBtn(
                                label: "Post",
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }, error: (msg) {
                  print("error: $msg");
                  return Center(
                    child: Text(msg.toString()),
                  );
                }) ??
                const Text('this');
          },
        ),
      ),
    );
  }
}

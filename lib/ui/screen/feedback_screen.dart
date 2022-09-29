import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../constants/size_constant.dart';
import '../../presentation/provider/app_general_provider.dart';
import '../../theme/theme_text.dart';
import '../../widget/app_bar.dart';
import '../../widget/app_btn.dart';
import '../../widget/app_text_field.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerMessage = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: MyAppBar(
          title: AppLocalizations.of(context)!.share_feedback,
          showBookmark: false,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.dimen_16),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.share_feedback,
                    style: ThemeText.title,
                  ),
                  const SizedBox(
                    height: Sizes.dimen_8,
                  ),
                  AppTextField(
                    controller: _controllerName,
                    label: AppLocalizations.of(context)!.full_name,
                    hint: AppLocalizations.of(context)!.enter_full_name,
                  ),
                  const SizedBox(
                    height: Sizes.dimen_8,
                  ),
                  AppTextField(
                    controller: _controllerEmail,
                    label: AppLocalizations.of(context)!.email,
                    hint: AppLocalizations.of(context)!.enter_email,
                  ),
                  const SizedBox(
                    height: Sizes.dimen_8,
                  ),
                  AppTextField(
                    controller: _controllerPhone,
                    label: AppLocalizations.of(context)!.phone,
                    hint: AppLocalizations.of(context)!.enter_phone,
                  ),
                  const SizedBox(
                    height: Sizes.dimen_8,
                  ),
                  AppTextField(
                    controller: _controllerMessage,
                    label: AppLocalizations.of(context)!.message,
                    hint: AppLocalizations.of(context)!.enter_message,
                  ),
                  const SizedBox(
                    height: Sizes.dimen_8,
                  ),
                  AppBtn(
                    label: AppLocalizations.of(context)!.submit,
                    onTap: () async {
                      if (_controllerName.text.isEmpty) {
                        _dialogBuilder(
                            context, "Required!", "Please enter your name.");
                        return;
                      }
                      if (_controllerMessage.text.isEmpty) {
                        _dialogBuilder(
                            context, "Required!", "Please enter your message.");
                        return;
                      }
                      int result = await context
                          .read<AppGeneralProvider>()
                          .postFeedback(
                              _controllerName.text,
                              _controllerEmail.text,
                              _controllerPhone.text,
                              _controllerMessage.text);

                      if (result == 1) {
                        showInSnackBar("Submitted successfully.");
                        _controllerEmail.clear();
                        _controllerName.clear();
                        _controllerPhone.clear();
                        _controllerMessage.clear();
                      } else {
                        showInSnackBar("Something went wrong");
                      }
                    },
                  )
                ]),
          ),
        ),
      ),
    );
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }

  Future<void> _dialogBuilder(
      BuildContext context, String title, String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: ThemeText.title),
          content: Text(message, style: ThemeText.textFieldLabel),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

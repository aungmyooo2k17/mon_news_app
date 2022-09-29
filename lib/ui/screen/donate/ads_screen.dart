import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class AdsPage extends StatelessWidget {
  AdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String urlDonate = "https://app.thanlwintimes.com/en/donate";

    /// sanitize or query document here
    return const SafeArea(
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: urlDonate,
      ),
    );
  }

  // Future<void> _onLoadHtmlStringExample(
  //     WebViewController controller, BuildContext context) async {
  //   await controller.loadHtmlString(htmlData);
  // }
}

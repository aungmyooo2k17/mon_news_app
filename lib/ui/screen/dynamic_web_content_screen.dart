import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../widget/app_bar.dart';

class DynamicWebContentpage extends StatefulWidget {
  final String url;
  final String title;
  const DynamicWebContentpage(
      {Key? key, required this.url, required this.title})
      : super(key: key);

  @override
  State<DynamicWebContentpage> createState() => _DynamicWebContentpageState();
}

class _DynamicWebContentpageState extends State<DynamicWebContentpage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: MyAppBar(
            title: widget.title,
          ),
        ),
        body: WebView(
          initialUrl: widget.url,
        ));
  }
}

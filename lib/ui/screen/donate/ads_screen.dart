import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class AdsPage extends StatelessWidget {
  AdsPage({Key? key}) : super(key: key);

  String htmlData = '''
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Document</title>
    </head>
    <body>
      <h3>Donate By Watching Ads</h3>
      <p>
        You can donate us by watching ads in our app as this will help us generate
        ads revenue which can keep us running our service. Please follow the
        following steps.
      </p>
      <ul>
        <li>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id tincidunt
          egestas mattis tempor nisi, pellentesque.
        </li>
        <li>
          Nunc, accumsan, ornare pulvinar diam a sed neque, non eu. Malesuada
          massa ac pulvinar ac mauris aliquet phasellus orci, ultrices. Semper
          quis placerat aliquet ultricies velit tellus.
        </li>
        <li>
          Ullamcorper egestas et cras enim donec neque non. Diam sed sit varius
          in. Gravida bibendum feugiat in mus erat tortor integer nunc. In mauris
          blandit ultricies massa ante facilisis quam tincidunt. Vitae enim dictum
          porttitor eget in ultrices a.
        </li>
        <li>
          A posuere dui placerat gravida parturient. Lorem vitae at vulputate
          maecenas duis fermentum in leo felis. Volutpat tempor ultricies et nisl
          parturient congue. Mauris imperdiet libero gravida tempus pretium eget
          non.
        </li>
        <li>
          Quam faucibus risus consectetur pellentesque pretium. Massa sit sodales
          molestie ultrices ultricies nulla ipsum. Quam mauris, in nisi suscipit
          enim sagittis. Tortor erat ante pretium, dui id.
        </li>
      </ul>
    </body>
  </html>
  ''';

  @override
  Widget build(BuildContext context) {
    /// sanitize or query document here
    return const SafeArea(
      child: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://thanlwintimes.apitoolz.com/en/donate",
      ),
    );
  }

  // Future<void> _onLoadHtmlStringExample(
  //     WebViewController controller, BuildContext context) async {
  //   await controller.loadHtmlString(htmlData);
  // }
}

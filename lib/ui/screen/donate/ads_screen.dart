import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AdsPage extends StatelessWidget {
  String htmlData = """
<div> <h3>Donate By Watching Ads</h3> <p>You can donate us by watching ads in our app as this will help us generate ads revenue which can keep us running our service. Please follow the following steps.</p> <ul> <li>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id tincidunt egestas mattis tempor nisi, pellentesque.</li> <li>Nunc, accumsan, ornare pulvinar diam a sed neque, non eu. Malesuada massa ac pulvinar ac mauris aliquet phasellus orci, ultrices. Semper quis placerat aliquet ultricies velit tellus.</li> <li>Ullamcorper egestas et cras enim donec neque non. Diam sed sit varius in. Gravida bibendum feugiat in mus erat tortor integer nunc. In mauris blandit ultricies massa ante facilisis quam tincidunt. Vitae enim dictum porttitor eget in ultrices a.</li> <li>A posuere dui placerat gravida parturient. Lorem vitae at vulputate maecenas duis fermentum in leo felis. Volutpat tempor ultricies et nisl parturient congue. Mauris imperdiet libero gravida tempus pretium eget non.</li> <li>Quam faucibus risus consectetur pellentesque pretium. Massa sit sodales molestie ultrices ultricies nulla ipsum. Quam mauris, in nisi suscipit enim sagittis. Tortor erat ante pretium, dui id.</li> </ul> </div>
""";

  @override
  Widget build(BuildContext context) {
    /// sanitize or query document here
    return Container(
      child: Html(
        data: htmlData,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../constants/size_constant.dart';

class MyAppBarWithBackBtn extends StatelessWidget {
  const MyAppBarWithBackBtn({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Sizes.dimen_8, bottom: Sizes.dimen_8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
              size: Sizes.dimen_20,
            ),
          ),
        ],
      ),
    );
  }
}

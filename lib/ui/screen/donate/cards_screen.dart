import 'package:flutter/material.dart';
import 'package:mon_news_app/constants/size_constant.dart';
import 'package:mon_news_app/constants/string_constant.dart';
import 'package:mon_news_app/theme/theme_text.dart';
import 'package:mon_news_app/widget/app_btn.dart';
import 'package:mon_news_app/widget/app_text_field.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.dimen_16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please, kindly fill the form',
                style: ThemeText.title,
              ),
              const SizedBox(
                height: Sizes.dimen_8,
              ),
              Text(
                'For the confidentiality of our users and donors, we process every card payments outside of the app, please fill the following form and we will contact you as soon as possible.',
                style: ThemeText.blackBodyText2,
              ),
              const SizedBox(
                height: Sizes.dimen_12,
              ),
              AppTextField(
                label: 'Full name',
                hint: StringConstant.hintFullName,
              ),
              const SizedBox(
                height: Sizes.dimen_8,
              ),
              AppTextField(
                label: 'Email',
                hint: StringConstant.hintEmail,
              ),
              const SizedBox(
                height: Sizes.dimen_8,
              ),
              AppTextField(
                label: 'Phone number',
                hint: StringConstant.hintPhoneNumber,
              ),
              const SizedBox(
                height: Sizes.dimen_8,
              ),
              AppBtn(label: 'Submit')
            ]),
      ),
    );
  }
}

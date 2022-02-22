import 'package:flutter/material.dart';
import 'package:home/product/companent/app_text_constant.dart';
import 'package:home/ui/onboard/widget/button.widget.dart';

import 'package:kartal/kartal.dart';

import '../../../product/companent/app_text_style.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final String _img = "assets/images/Landing.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          Image.asset(
            _img,
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Padding(
            padding: context.verticalPaddingHigh,
            child: Column(
              children: [
                _buildFirstTitle(context),
                _buildSecondTitle(context),
                const Spacer(),
                const GetStartButton()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildSecondTitle(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingHigh,
      child: Container(
        alignment: Alignment.center,
        child: Builder(builder: (context) {
          return Text(
            AppString().onBoardSecondText,
            style: StyleText().listTileTitle,
            textAlign: TextAlign.center,
          );
        }),
      ),
    );
  }

  Column _buildFirstTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: context.verticalPaddingLow,
          child: SizedBox(
            width: context.dynamicHeight(0.35),
            child: Text(
              AppString().onBoardFirstText,
              style: context.textTheme.headline4?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.appTheme.colorScheme.background,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}

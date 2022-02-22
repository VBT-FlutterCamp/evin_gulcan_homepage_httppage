import 'package:flutter/material.dart';
import 'package:home/product/companent/app_text_constant.dart';
import 'package:kartal/kartal.dart';

import '../../homePage/view/home_page.dart';

class GetStartButton extends StatelessWidget {
  const GetStartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.45),
      height: context.dynamicHeight(0.07),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color?>(
            context.appTheme.primaryColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          _buildGetText(context),
          _buildIcon(context),
        ]),
      ),
    );
  }
}

Icon _buildIcon(BuildContext context) {
  return Icon(
    Icons.navigate_next_outlined,
    color: context.appTheme.colorScheme.background,
  );
}

Text _buildGetText(BuildContext context) {
  return Text(
    AppString().getStarted,
    style: context.textTheme.headline6
        ?.copyWith(color: context.appTheme.backgroundColor),
  );
}

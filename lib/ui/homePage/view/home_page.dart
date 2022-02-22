import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../product/companent/app_colors_constant.dart';
import '../../../product/companent/app_container_constant.dart';
import '../../../product/companent/app_icon_constant.dart';
import '../../../product/companent/app_size_constant.dart';
import '../../../product/companent/app_text_constant.dart';
import '../../../product/companent/app_text_style.dart';
import '../models/home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;

  void setSelectedItem(int val) {
    _selectedItem = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: context.paddingNormal,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _buildTitle(context),
            _buildSubContaineer(context),
            Expanded(
              child: _buildListViewBuilder(),
            ),
          ]),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedItem,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColors().cleanedColor,
      unselectedItemColor: AppColors().kGreyColor,
      onTap: (val) {
        setSelectedItem(val);
      },
      items: [
        _bottomNavBarItem(Icons.folder),
        _bottomNavBarItem(Icons.settings),
        _bottomNavBarItem(Icons.show_chart_rounded),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavBarItem(IconData icon) =>
      BottomNavigationBarItem(
        icon: Icon(
          icon,
          size: xLarge3x,
        ),
        label: '',
      );

  ListView _buildListViewBuilder() {
    return ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) {
          return _buildListViewCard(context, index);
        });
  }

  Card _buildListViewCard(BuildContext context, int index) {
    return Card(
      borderOnForeground: true,
      elevation: large,
      shape: RoundedRectangleBorder(
        borderRadius: context.normalBorderRadius,
      ),
      child: ListTile(
        title: Text(
          models[index].name,
          style: StyleText().listTileTitle,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              models[index].url,
              style: StyleText().listTileSubtitle,
            ),
            Divider(
              height: normal,
              color: AppColors().dividerColor,
            ),
          ],
        ),
        trailing: Container(
          width: context.dynamicWidth(0.10),
          height: context.dynamicHeight(0.06),
          decoration: BoxDecoration(
            color: AppColors().deleteContainColor,
            borderRadius: AppDecoration().decoration.borderRadius,
          ),
          child: AppIcon().iconDelete,
        ),
      ),
    );
  }

  Row _buildSubContaineer(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString().subText + ("(${models.length})"),
          style: StyleText().subTextStyle,
        ),
        Container(
          width: context.dynamicWidth(0.3),
          height: context.dynamicHeight(0.04),
          decoration: BoxDecoration(
            color: AppColors().cleanedColor,
            borderRadius: AppDecoration().decoration.borderRadius,
          ),
          child: Center(
            child: Text(
              AppString().cleanText,
              style: StyleText().cleanTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Padding _buildTitle(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingMedium,
      child: SizedBox(
        width: context.dynamicWidth(0.6),
        child: Text(
          AppString().titleHomeText,
          style: context.textTheme.headline4?.copyWith(
            color: context.appTheme.primaryColor,
            fontWeight: StyleText().styleFontWeight,
          ),
        ),
      ),
    );
  }
}

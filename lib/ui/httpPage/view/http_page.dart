import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../product/companent/app_colors_constant.dart';
import '../../../product/companent/app_container_constant.dart';
import '../../../product/companent/app_icon_constant.dart';
import '../../../product/companent/app_size_constant.dart';
import '../../../product/companent/app_text_constant.dart';
import '../../../product/companent/app_text_style.dart';
import '../../homePage/models/home_model.dart';
import '../model/http_model.dart';
import '../servis/http_servis.dart';

class HttpPage extends StatefulWidget {
  const HttpPage({Key? key}) : super(key: key);

  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  PostService _postService = PostService();
  List<PostModel>? _postModel;
  bool isLoading = false;
  bool openText = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> init() async {
    _postModel = await _postService.fetchPost();
    changeLoading();
  }

  @override
  void initState() {
    init();
    super.initState();
  }

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
            isLoading ? _buildListViewBuilder() : const SizedBox(),
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

  Expanded _buildListViewBuilder() {
    return Expanded(
      child: ListView.builder(
        itemCount: _postModel?.length,
        itemBuilder: (context, index) {
          return _buildListViewCard(context, index);
        },
      ),
    );
  }

  Card _buildListViewCard(BuildContext context, int index) {
    return Card(
      borderOnForeground: true,
      elevation: large,
      shape: RoundedRectangleBorder(
        borderRadius: context.normalBorderRadius,
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(_postModel?[index].id.toString() ?? ''),
        ),
        title: Text(_postModel?[index].title ?? ''),
        trailing: AppIcon().iconTik,
      ),
    );
  }

  Row _buildSubContaineer(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppString().httpPostaLenght + " ${_postModel?.length ?? 0} ",
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

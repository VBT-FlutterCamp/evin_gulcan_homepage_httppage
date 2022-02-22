import 'package:flutter/material.dart';
import 'package:home/ui/homePage/models/home_model.dart';
import 'package:home/ui/homePage/view/home_page.dart';
import 'ui/httpPage/view/http_page.dart';
import 'ui/onboard/view/onboard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff293855),
        backgroundColor: const Color(0xff293855),
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const OnboardPage(),
    );
  }
}

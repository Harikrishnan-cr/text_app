import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/view/common/bottom_bar/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          canvasColor: appCanvasColour),
      home: BottomBarScreen(),
    );
  }
}

import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/catagory_controller/catagory_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';

import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';
import 'package:intertoons/view/common/bottom_bar/bottom_bar.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final homeDataController = Get.put(HomeController());
  final catDataController = Get.put(CatagoryController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // primarySwatch: Colors.blue,
            canvasColor: appCanvasColour),
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Text(
              'InterToons',
              style: TextStyle(
                  color: whiteColour,
                  fontWeight: FontWeight.w800,
                  fontSize: 30),
            ),
            nextScreen: BottomBarScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: greenColour));
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';
import 'package:intertoons/view/home/home_screen.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);
  final homeDataController = Get.put(HomeController());

  final tabs = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    Center(
      child: Text('Account'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (context) {
        return tabs[homeDataController.currentIndex];
      }),
      bottomNavigationBar: GetBuilder<HomeController>(builder: (context) {
        return BottomNavigationBar(
          currentIndex: homeDataController.currentIndex,
          type: BottomNavigationBarType.fixed,
          unselectedLabelStyle: TextStyle(color: blackColour),
          selectedLabelStyle:
              TextStyle(color: blackColour, fontWeight: FontWeight.bold),
          selectedItemColor: blackColour,
          backgroundColor: whiteColour,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: blackColour,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_sharp, color: blackColour),
                label: 'Menu'),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: blackColour),
              label: 'Search',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: blackColour), label: 'Account'),
          ],
          onTap: (value) {
            homeDataController.changeIndexNavBar(value);
          },
        );
      }),
    );
  }
}

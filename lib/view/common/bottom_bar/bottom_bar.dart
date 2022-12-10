import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/cart_controller/cart_controller.dart';
import 'package:intertoons/controller/catagory_controller/catagory_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/style/text_style.dart';
import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';
import 'package:intertoons/view/cart/cart_screen.dart';
import 'package:intertoons/view/home/home_screen.dart';
import 'package:intertoons/view/menu/menu_screen.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);
  final homeDataController = Get.put(HomeController());
  final catDataController = Get.put(CatagoryController());

  final tabs = [
    HomeScreen(),
    MenuScreen(),
    const Center(
      child: Text('Others'),
    ),
    const Center(
      child: Text('Account'),
    )
  ];
  @override
  Widget build(BuildContext context) {
    log('cccccc');
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (context) {
        return tabs[context.currentIndex];
      }),
      bottomSheet: GetBuilder<CartController>(
        builder: (controller) {
          return controller.cartLength != 0
              ? CommonCartTab(cartCount: controller.cartLength.toString())
              : const SizedBox();
        },
      ),
      bottomNavigationBar:
          GetBuilder<HomeController>(builder: (homeDataController) {
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
              icon: Icon(Icons.chat, color: blackColour),
              label: 'Others',
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

class CommonCartTab extends StatelessWidget {
  CommonCartTab({
    Key? key,
    required this.cartCount,
  }) : super(key: key);
  final String cartCount;

  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    cartController.findTheTotalOfCart();

    return Container(
        width: double.infinity,
        height: 50,
        color: const Color.fromARGB(210, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: GetBuilder<CartController>(builder: (cartController) {
          
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                        '$cartCount Item in cart - € ${cartController.userCartTotalInString}',    
                        style: addTextStyle())
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => CartScreen());
                  },
                  child: Row(
                    children: [
                      Text(
                        'View Cart',
                        style: addTextStyle(),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
        ));
  }
}

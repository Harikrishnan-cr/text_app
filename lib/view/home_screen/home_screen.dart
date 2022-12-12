import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/catagory_controller/catagory_controller.dart';

import 'package:intertoons/controller/const/size/height_width.dart';

import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';

import 'package:intertoons/view/common/app_common_head/app_heading.dart';
import 'package:intertoons/view/common/home_app_bar/app_bar_home.dart';

import 'package:intertoons/view/home_screen/additional_banner/additional_banners.dart';
import 'package:intertoons/view/home_screen/best_seller/best_seller.dart';
import 'package:intertoons/view/home_screen/catagory/catagory_widget.dart';
import 'package:intertoons/view/home_screen/feature_products/feature_products.dart';
import 'package:intertoons/view/home_screen/slider/slider_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeDataController = Get.put(HomeController());
  final catDataController = Get.put(CatagoryController());

  @override
  Widget build(BuildContext context) {
    log('rrrrr');
    return Scaffold(
      appBar: appBarHome(),
      body: GetBuilder<HomeController>(builder: (context) {
        return ListView(
          children: [
            SliderScreenWidget(),
            constHeigt20,
            CatagoryWidget(),
            const CommonHeadings(
              headTextData: 'Featured',
              viewAll: true,
            ),
            FeatureProductsWidget(),
            AdditionaBannerWidget(),
            constHeigt30,
            const CommonHeadings(
              headTextData: 'Best Sellers',
              viewAll: false,
            ),
            BestSellerWidget(),
            constHeigt30,
            constHeigt30,
          ],
        );
      }),
    );
  }
}

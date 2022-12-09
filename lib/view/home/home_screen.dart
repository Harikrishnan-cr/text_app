import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/catagory_controller/catagory_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';

import 'package:intertoons/controller/const/size/height_width.dart';

import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';
import 'package:intertoons/view/cart/cart_screen.dart';

import 'package:intertoons/view/common/app_common_head/app_heading.dart';
import 'package:intertoons/view/home/additional_banner/additional_banners.dart';
import 'package:intertoons/view/home/best_seller/best_seller.dart';

import 'package:intertoons/view/home/catagory/catagory_widget.dart';
import 'package:intertoons/view/home/feature_products/feature_products.dart';
import 'package:intertoons/view/home/slider/slider_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeDataController = Get.put(HomeController());
  final catDataController = Get.put(CatagoryController());

  @override
  Widget build(BuildContext context) {
    log('rrrrr');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColour,
        elevation: 0,
        
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
              color: whiteColour, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              consWidth10,
              Icon(Icons.search, color: greyBacground),
              consWidth10,
              Text(
                'Search Your Product',
                style: TextStyle(
                    color: greyBacground,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
              ),
            ],
          ),
        ),
        actions:  [
          GestureDetector(
            onTap: () {
              Get.to(()=>CartScreen()); 
            },
            child: const Icon(Icons.shopping_cart)),
          consWidth15,
        ],
      ),
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

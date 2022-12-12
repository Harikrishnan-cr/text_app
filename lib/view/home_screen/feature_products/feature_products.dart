import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/cart_controller/cart_controller.dart';

import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';
import 'package:intertoons/view/common/circular_progress_indicator/circular_progress_common.dart';
import 'package:intertoons/view/common/product_tile/product_tile_common.dart';

class FeatureProductsWidget extends StatelessWidget {
  FeatureProductsWidget({Key? key}) : super(key: key);
  final homeDataController = Get.put(HomeController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {

    log('call'); 
  
    return
       GetBuilder<HomeController>(builder: (context) {
        return homeDataController.homeData.data?.featuredProducts != null
            ? SizedBox(
               width: double.infinity,
                  height: 250, 
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate( 
                      homeDataController
                              .homeData.data?.featuredProducts!.length ??
                          0, (index) {
                    final featureData = homeDataController
                        .homeData.data?.featuredProducts![index];
                    return ProductTile(
                      featureData: featureData,
                    );
                  }),
                ),
            )
            : const CommonCircularProgressIndicator(width: double.infinity, height: 250);
      });
    
  }
}

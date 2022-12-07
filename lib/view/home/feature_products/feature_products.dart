import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';
import 'package:intertoons/view/common/product_tile/product_tile_common.dart';

class FeatureProductsWidget extends StatelessWidget {
  FeatureProductsWidget({Key? key}) : super(key: key);
  final homeDataController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    log('call'); 
    homeDataController.getHomeData(); 
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (context) {
        return homeDataController.homeData.data?.featuredProducts != null
            ? ListView(
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
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}

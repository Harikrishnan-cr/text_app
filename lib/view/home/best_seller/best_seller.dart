import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';

import 'package:intertoons/view/common/best_seller_tile/best_seller_tile.dart';
import 'package:intertoons/view/common/circular_progress_indicator/circular_progress_common.dart';
import 'package:intertoons/view/full_details/full_details.dart';


class BestSellerWidget extends StatelessWidget {
   BestSellerWidget({Key? key}) : super(key: key);
  final bool isLiked = true;
 
    final homeDataController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (context) {
        return Column(  
          children:homeDataController.homeData.data?.bestsellerProducts != null ?   List.generate(
              5,
              (index) {
                final bestSellerData = homeDataController.homeData.data?.bestsellerProducts![index];
                return Padding(  
                    padding: const EdgeInsets.only(
                        top: 4, left: 12, right: 12, bottom: 3),
                    child: GestureDetector(
                      onTap: () {
                     Get.to(()=>FulldetailsScreenBestSeller(featureData: bestSellerData,));    
                      },
                      child: BestSellerTile(
                        bestSellerData: bestSellerData,
                          title: bestSellerData!.name!,  
                          specialPrice: bestSellerData.specialPrice!.toString(),    
                          price: bestSellerData.price!.toString(), 
                          isVeg: int.parse(bestSellerData.isVeg!),    
                          isLiked: !isLiked),
                    ),  
                  );
              }
                  ) : [
                    const CommonCircularProgressIndicator(width: double.infinity, height: 300)
                  ]
        );
      }
    );
  }
}

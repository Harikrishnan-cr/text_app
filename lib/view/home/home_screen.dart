import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/catagory_controller/catagory_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';

import 'package:intertoons/controller/const/size/height_width.dart';


import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';
import 'package:intertoons/view/common/additional_banners/additional_baners.dart';
import 'package:intertoons/view/common/app_common_head/app_heading.dart';
import 'package:intertoons/view/home/additional_banner/additional_banners.dart';

import 'package:intertoons/view/home/catagory/catagory_widget.dart';
import 'package:intertoons/view/home/feature_products/feature_products.dart';
import 'package:intertoons/view/home/slider/slider_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeDataController = Get.put(HomeController());
  final catDataController = Get.put(CatagoryController());




  final strImage =
      'https://t3.ftcdn.net/jpg/01/71/83/64/360_F_171836401_CmAtR3GJFR59p65WUZ6U0qJjNZftSfPV.jpg';
  final strData = 'Data Is defined';
  final headTextData = 'Featured';
  @override
  Widget build(BuildContext context) {
  

    log('rrrrr'); 
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            SizedBox(
                width: double.infinity,
                height: 200,
                child: SliderScreenWidget()),
            constHeigt20,
            SizedBox(
                width: double.infinity, height: 130, child: CatagoryWidget()),
            CommonHeadings(headTextData: headTextData),
            SizedBox(
                width: double.infinity,
                height: 250,
                child: FeatureProductsWidget()),
                  
SizedBox(
  width: double.infinity,
  height: 324,     
  child: AdditionaBannerWidget())      

        //         SizedBox(
        //           width: double.infinity,
        // height: 150,  
                  
        //           child: AdditionaBannerWidget())  
          ],
        ),

       
        
        
        );



  }
}













// GetBuilder<CatagoryController>(builder: (context) {
//         return catDataController.catData.message != null
//             ? ListView.builder(
//                 itemCount: catDataController.catData.data!.length,
//                 itemBuilder: (context, index) {
//                   final cartData = catDataController.catData.data![index];
//                   return ListTile(
//                     title: Text(cartData.catName.toString()),
//                     leading: CircleAvatar(
//                       backgroundImage: NetworkImage(cartData.catImg.toString()),
//                     ),
//                   );
//                 },
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               );
//       }
//       ),





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';
import 'package:intertoons/view/common/additional_banners/additional_baners.dart';

class AdditionaBannerWidget extends StatelessWidget {
   AdditionaBannerWidget({Key? key}) : super(key: key);
 final strImage =
      'https://t3.ftcdn.net/jpg/01/71/83/64/360_F_171836401_CmAtR3GJFR59p65WUZ6U0qJjNZftSfPV.jpg';

       final homeDataController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
        final additionBannerData = homeDataController.homeData.data?.additionalBanners;
    return  GetBuilder<HomeController>(  
      builder: (context) {
        return homeDataController.homeData.data?.additionalBanners != null ? ListView( 
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(   
            
            homeDataController.homeData.data!.additionalBanners!.length, (index) => AdditionalBanneers(strImage: additionBannerData?[0].bannerImg ?? strImage),)  
        ):Center(child:  CircularProgressIndicator(),);
      }
    );
  }
}





// Column(  
//       children: [
//  AdditionalBanneers(strImage: additionBannerData![0].bannerImg ?? strImage),  
// AdditionalBanneers(strImage: additionBannerData[1].bannerImg ?? strImage),  
//       ],
//     )
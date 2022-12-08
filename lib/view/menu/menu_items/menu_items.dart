import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';

import 'package:intertoons/view/common/menu_tile/menu_screen.dart';

class MenuItemsScreenWidget extends StatelessWidget {
  MenuItemsScreenWidget({Key? key, required this.catgaryName})
      : super(key: key);

  final String catgaryName;

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final data = homeController.homeData.data!.featuredProducts!
        .where((element) => element.categoryName!
            .toLowerCase()
            .contains(catgaryName.toLowerCase()))
        .toList();

    return Scaffold(
      body: ListView(
          children: List.generate(data.length, (index) {
        final catData = data[index];
        return MenuScreenTile(
          catData: catData,
        );
      })),
    );
  }
}






// class DailySpecialScreen extends StatelessWidget {
//   DailySpecialScreen({Key? key})
//       : super(key: key);

  
  
//   final catagoryController = Get.put(CatagoryController());

//   @override
//   Widget build(BuildContext context) {
//     // final data = homeController.homeData.data!.featuredProducts!
//     //     .where((element) => element.categoryName!
//     //         .toLowerCase()
//     //         .contains(catgaryName.toLowerCase())) 
//     //     .toList();

//   final data = catagoryController.catData.data![9].childData;       
// //log(data.length); 
//     return Scaffold(
//       body: ListView(
//           children: List.generate(data.length, (index) {
       
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             width: double.infinity,
//             height: 200,
//             color: greenColour,
//           ),
//         );
//       })),
//     );
//   }
// }
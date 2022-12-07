import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/catagory_controller/catagory_controller.dart';
import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeDataController = Get.put(HomeController());
  final catDataController = Get.put(CatagoryController());
  @override
  Widget build(BuildContext context) {
    //log(dataController.sampleData.length.toString());
    //  log(homeDataController.homeData.data.toString());
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<CatagoryController>(builder: (context) {
        return catDataController.catData.message != null
            ? ListView.builder(
                itemCount: catDataController.catData.data!.length,
                itemBuilder: (context, index) {
                  final cartData = catDataController.catData.data![index];
                  return ListTile(
                    title: Text(cartData.catName.toString()),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(cartData.catImg.toString()),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}

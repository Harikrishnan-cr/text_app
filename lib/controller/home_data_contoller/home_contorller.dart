import 'dart:developer';

import 'package:get/get.dart';
import 'package:intertoons/model/home_model/home_model.dart';

import 'package:intertoons/services/home_services.dart';

class HomeController extends GetxController {
  var currentIndex = 0;

  void changeIndexNavBar(index) {
    currentIndex = index;
    update();
  }

  var homeData = HomeModel();

  getHomeData() async {
    try {
      var data = await HomeDataServices().getHomeProducts();

      if (data != null) {
        homeData = data;
        //log(homeData.data!.bestsellerProducts![0].categoryName.toString());
        update();
      }
    } catch (e) {
      log(e.toString());

      log('error occure in home');
    }
  }

  @override
  void onInit() {
    getHomeData();
    super.onInit();
  }
}

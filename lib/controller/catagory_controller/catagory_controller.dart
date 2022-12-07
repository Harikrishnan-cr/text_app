import 'dart:developer';

import 'package:get/get.dart';
import 'package:intertoons/model/catagory_model/cart_model.dart';
import 'package:intertoons/services/catagory_services.dart';

class CatagoryController extends GetxController {
  var catData = CartModel();
  getCatData() async {
    try {
      var data = await CatagoryDataServices().getCatProducts();
      // log(data!.data![0].catName.toString());

      if (data != null) {
        catData = data;

        update();
      }
    } catch (e) {
      log(e.toString());

      log('error occure');
    }
  }

  @override
  void onInit() {

    getCatData();
    super.onInit();
  }
}

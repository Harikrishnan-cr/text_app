import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intertoons/controller/const/service%20const/service_const.dart';

import 'package:intertoons/model/home_model/home_model/home_model.dart';

import '../model/catagory_model/cart_model.dart';

class HomeDataServices {


  Future<HomeModel?> getHomeProducts() async {
    var responce = await http.get(Uri.parse(urlHome), headers: header);

    if (responce.statusCode == 200) {
      // return homeModelFromJson(responce.body);

      var data = json.decode(responce.body);

      return HomeModel.fromJson(data);
    } else {
      return null;
    }
  }


}

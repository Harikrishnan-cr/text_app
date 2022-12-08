import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intertoons/controller/const/service%20const/service_const.dart';

import 'package:intertoons/model/catagory_model/cart_model.dart';

class CatagoryDataServices {
  Future<CartModel?> getCatProducts() async {
    var responce = await http.get(Uri.parse(urlCat), headers: header);

    try {
      if (responce.statusCode == 200) {
        var data = json.decode(responce.body);

        return CartModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

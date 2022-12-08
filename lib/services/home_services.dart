import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:intertoons/controller/const/service%20const/service_const.dart';
import 'package:intertoons/model/home_model/home_model.dart';


class HomeDataServices {
  Future<HomeModel?> getHomeProducts() async {
    var responce = await http.get(Uri.parse(urlHome), headers: header);

   try{
     if (responce.statusCode == 200) {
      var data = json.decode(responce.body);

      return HomeModel.fromJson(data);
    } else {
      return null;
    }
   }catch(e){
    log(e.toString()); 
   }
   return null;
  }
}

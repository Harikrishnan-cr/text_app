import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/cart_controller/cart_controller.dart';
import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';
import 'package:intertoons/model/home_model/featured_product.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartController = Get.put(CartController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final cartData = cartController.getCartItems.values.toList();

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: cartData.length,
        itemBuilder: (context, index) {
          final data = homeController.homeData.data?.featuredProducts
              ?.where((element) =>
                  element.id.toString().contains(cartData[index].productId)).toList();
              

          log('${cartData.length.toString()} -----------');
          return ListTile(
            title: Text(data?[0].name.toString() ?? ''),  
          );
        },
      ),
    );
  }
}

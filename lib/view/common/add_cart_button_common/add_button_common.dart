import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/cart_controller/cart_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/style/text_style.dart';
import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';


class AddButton extends StatelessWidget {
  AddButton(
      {Key? key,
      this.height,
      this.width,
      required this.productId,
      required this.productPrice,
      this.textTile})
      : super(key: key);
  final double? width;
  final double? height;
  final String? productId;
  final String? textTile;
  final num productPrice;

  final cartController = Get.put(CartController()); 
  final homeController = Get.put(HomeController()); 
  @override
  Widget build(BuildContext context) {

  
    return GestureDetector(   
      onTap: () async {
log('dddddddddddddd');  



        //  for (int index = 0; index < cartLength; index++) {
              
        //       final cartProductId = cartController.getCartItems[index]!;

        //       final data = homeController.homeData.data?.featuredProducts
        //           ?.where((element) => element.id
        //               .toString()
        //               .contains(cartProductId.productId))
        //           .toList();
        //       final producttData = data![0];

        //       final priceOfProduct = producttData.specialPrice != 0
        //           ? producttData.specialPrice.toString()
        //           : producttData.price.toString();
        //       var realPrice = num.parse(priceOfProduct);

        //       cartTotalPrice =
        //           cartTotalPrice + realPrice * cartProductId.productQuantity;  
        //     }

           
        log('Add Clickedd $productId');
        cartController.cartLengthData();
        cartController.addProductToCart(
          productPrice: productPrice,
            productId: productId.toString(), quantity: 1);
        if (textTile == null) {
            cartController.cartLengthData();
        } else {
          cartController.cartLengthData();
          log('Already in cart');
        }
      },
      child: Container(
        width: width ?? 65,
        height: height ?? 33,
        decoration: BoxDecoration(
            color: greenColour, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          textTile ?? 'Add',
          style: addTextStyle(),
        )),
      ),
    );
  }
}

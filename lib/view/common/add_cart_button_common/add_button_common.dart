import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/cart_controller/cart_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/style/text_style.dart';
import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';
import 'package:intertoons/view/common/common_alert_box/common_alert_box.dart';

class AddButton extends StatelessWidget {
  AddButton(
      {Key? key,
      this.height,
      this.width,
      required this.productId,
      required this.productPrice,
      required this.productName,
      this.textTile})
      : super(key: key);
  final double? width;
  final double? height;
  final String? productId;
  final String? textTile;
  final num productPrice;
  final String productName;

  final cartController = Get.put(CartController());
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        log('dddddddddddddd');

        cartController.cartLengthData();

        if (textTile == null) {
          showAlertDialogHome(
              context: context,
              itemName: productName,
              productId: productId.toString());
          cartController.cartLengthData();
        } else {
          cartController.addProductToCart(
              productPrice: productPrice,
              productId: productId.toString(),
              quantity: 1);
          cartController.cartLengthData();
        }
      },
      child: Container(
        width: width ?? 65,
        height: height ?? 33,
        decoration: BoxDecoration(
            color: greenColour, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          textTile ?? 'In cart',
          style: addTextStyle(),
        )),
      ),
    );
  }
}

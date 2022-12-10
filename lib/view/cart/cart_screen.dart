import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intertoons/controller/cart_controller/cart_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';

import 'package:intertoons/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:intertoons/controller/const/style/text_style.dart';
import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';

import 'package:intertoons/view/cart/cart_widget/cart_widget_tile.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final cartController = Get.put(CartController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    cartController.findTheTotalOfCart();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: greenColour,
        title: const Text('Cart'),
      ),
      body: GetBuilder<CartController>(builder: (controller) {
        final cartData = controller.getCartItems.values.toList();
        return ListView.builder(
          itemCount: cartData.length,
          itemBuilder: (context, index) {
            return CartScreenCard(
              cartDetails: cartData[index],
            );
          },
        );
      }),
      bottomSheet: GetBuilder<CartController>(builder: (cartController) {
        return cartController.cartLength != 0
            ? Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                width: double.infinity,
                height: 43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: greenColour,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${cartController.cartLength} items | ₹ ${cartController.userCartTotalInString}',
                        style: addTextStyle(),
                      ),
                      GestureDetector(
                          onTap: () {
                            log('On Tap');
                          },
                          child: Text(
                            ' Proceed to CheckOut',
                            style: addTextStyle(),
                          )),
                    ],
                  ),
                ),
              )
            : SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                    child: Text(
                  'Cart Is empty',
                  style: signUpUserTextStyle(),
                )),
              );
      }),
    );
  }
}

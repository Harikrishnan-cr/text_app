import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/cart_controller/cart_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/size/height_width.dart';
import 'package:intertoons/view/cart_screen/cart_screen.dart';



AppBar appBarHome() {
  return AppBar(
    backgroundColor: greenColour,
    elevation: 0,
    title: Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color: whiteColour, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          consWidth10,
          Icon(Icons.search, color: greyBacground),
          consWidth10,
          Text(
            'Search Your Product',
            style: TextStyle(
                color: greyBacground,
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
        ],
      ),
    ),
    actions: [
      Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => CartScreen());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
              child: Icon(
                Icons.shopping_cart,
                color: blackColour,
                size: 30,
              ),
            ),
          ),
          GetBuilder<CartController>(builder: (cartController) {
            return cartController.cartLength != 0
                ? Positioned(
                    top: 10,
                    left: 20,
                    child: CircleAvatar(
                        radius: 8,
                        backgroundColor: whiteColour,
                        child: Text(
                          cartController.cartLength.toString(),
                          style: TextStyle(
                              color: blackColour,
                              fontSize: 13,
                              fontWeight: FontWeight.w900),
                        )))
                : const Text('');
          }),
        ],
      ),
    ],
  );
}

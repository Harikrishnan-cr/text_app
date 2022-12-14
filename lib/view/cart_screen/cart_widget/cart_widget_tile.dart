










import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/cart_controller/cart_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/sample_images/sample_file.dart';
import 'package:intertoons/controller/const/size/height_width.dart';
import 'package:intertoons/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';
import 'package:intertoons/model/cart_model/cart_model.dart';
import 'package:intertoons/view/common/common_alert_box/common_alert_box.dart';
import 'package:intertoons/view/common/is_veg_or_not/isveg_nonveg.dart';

class CartScreenCard extends StatelessWidget {
  CartScreenCard({
    Key? key,
    required this.cartDetails,
  }) : super(key: key);

  final String subtraction = '-';

  final homeController = Get.put(HomeController());
  final cartControler = Get.put(CartController());

  final CartModelScreen cartDetails;
  @override
  Widget build(BuildContext context) {
    final data = homeController.homeData.data?.featuredProducts
        ?.where(
            (element) => element.id.toString().contains(cartDetails.productId))
        .toList();

    final productDetails = data![0];

    final priceOfProduct = productDetails.specialPrice != 0
        ? productDetails.specialPrice.toString()
        : productDetails.price.toString();

    var realPrice = num.parse(priceOfProduct);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: whiteColour,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        width: double.infinity,
        height: 150,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 190,
                      child: Text(
                        productDetails.name!,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: blackColour),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      )),
                  constHeigt10,
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            '???',
                            style: cardCurrencyTextStyle(),
                          ),
                          consWidth5,
                          SizedBox(
                            width: 150, //toStringAsFixed(3)
                            child: Text(
                              (realPrice * cartDetails.productQuantity)
                                  .toStringAsFixed(2),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: greenColour,
                                  fontSize: 20,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                      consWidth5,
                    ],
                  ),
                  constHeigt10,
                  IsVegOrNonVeg(
                      isVeg: int.parse(productDetails.isVeg.toString())),
                  constHeigt10,
                  GestureDetector(
                    onTap: () {
                      log('remove pressed');

                      showAlertDialogCartScreen(
                          context: context,
                          itemName: productDetails.name.toString(),
                          cartModel: cartDetails);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.delete_sweep_sharp,
                          size: 15,
                        ),
                        consWidth5,
                        Text(
                          'Remove',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 3, left: 0),
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: productDetails.image ?? strImage,
                    width: 120,
                    height: 80,
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12)),
                      );
                    },
                  ),
                  constHeigt15,
                  Row(children: [
                    GestureDetector(
                        onTap: () {
                          if (cartDetails.productQuantity > 1) {
                            cartControler.findTheTotalOfCart();
                            cartControler.reduceProductQuantityByOne(
                                productPrice: realPrice,
                                productId: productDetails.id.toString());
                          } else {
                            showAlertDialogCartScreen(
                                context: context,
                                itemName: productDetails.name.toString(),
                                cartModel: cartDetails);
                          }
                        },
                        child: const AddItemsWidget(subtraction: '???')),
                    consWidth10,
                    Text(
                      cartDetails.productQuantity.toString(),
                      style: cardTextStyle(),
                    ),
                    consWidth10,
                    GestureDetector(
                        onTap: () {
                          log('add pressed');
                          cartControler.increaseProductQuantityByOne(
                              productPrice: realPrice,
                              productId: productDetails.id.toString());
                        },
                        child: const AddItemsWidget(subtraction: '+')),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddItemsWidget extends StatelessWidget {
  const AddItemsWidget({
    Key? key,
    required this.subtraction,
  }) : super(key: key);

  final String subtraction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29,
      width: 28,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: greenColour)),
      child: Center(
          child: Text(
        subtraction,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w500, color: blackColour, fontSize: 22),
      )),
    );
  }
}

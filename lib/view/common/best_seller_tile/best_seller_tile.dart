import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/cart_controller/cart_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/sample_images/sample_file.dart';
import 'package:intertoons/controller/const/size/height_width.dart';
import 'package:intertoons/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:intertoons/model/home_model/bestseller_product.dart';
import 'package:intertoons/view/common/add_cart_button_common/add_button_common.dart';
import 'package:intertoons/view/common/is_veg_or_not/isveg_nonveg.dart';
import 'package:intertoons/view/common/liked_button/liked_button.dart';

class BestSellerTile extends StatelessWidget {
  const BestSellerTile(
      {Key? key,
      required this.title,
      required this.specialPrice,
      required this.price,
      required this.isVeg,
      required this.isLiked,
      required this.bestSellerData})
      : super(key: key);

  final String title;
  final String specialPrice;
  final String price;
  final int isVeg;
  final bool isLiked;
  final BestsellerProduct? bestSellerData;
  @override
  Widget build(BuildContext context) {
    final priceOfProduct = bestSellerData?.specialPrice != 0
        ? bestSellerData?.specialPrice.toString()
        : bestSellerData?.price.toString();
    var realPrice = num.parse(priceOfProduct!);
    return Container(
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
                      title,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: blackColour),
                      overflow: TextOverflow.ellipsis,
                    )),
                constHeigt10,
                specialPrice != '0'
                    ? Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                '₹',
                                style: cardCurrencyTextStyle(),
                              ),
                              consWidth5,
                              Text(
                                specialPrice,
                                style: cardRsTextStyle(),
                              ),
                            ],
                          ),
                          consWidth10,
                          Row(
                            children: [
                              Text(
                                '₹',
                                style: cardCurrencyTextStyle(),
                              ),
                              consWidth5,
                              Text(
                                price,
                                style: markedTextStyle(),
                              ),
                            ],
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Row(
                            children: [
                              Text(
                                '₹',
                                style: cardCurrencyTextStyle(),
                              ),
                              consWidth5,
                              Text(
                                price,
                                style: cardRsTextStyle(),
                              ),
                            ],
                          ),
                        ],
                      ),
                constHeigt10,
                IsVegOrNonVeg(isVeg: isVeg),
                constHeigt10,
                LikedButton(
                  productId: '',
                  isliked: isLiked,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 3, left: 0),
            child: Column(
              children: [
                FancyShimmerImage(
                  imageUrl: bestSellerData!.image ?? strImage,
                  width: 120,
                  height: 80,
                  imageBuilder: (context, imageProvider) {
                    log(bestSellerData!.id.toString());
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12)),
                    );
                  },
                ),
                constHeigt15,
                GetBuilder<CartController>(builder: (cartController) {
                  return cartController.getCartItems
                          .containsKey(bestSellerData!.id.toString())
                      ? AddButton(
                          productName: bestSellerData!.name.toString(),
                          productPrice: realPrice,
                          productId: bestSellerData!.id.toString(),
                          width: 100,
                          height: 35,
                        )
                      : AddButton(
                          productName: bestSellerData!.name.toString(),
                          productPrice: realPrice,
                          productId: bestSellerData!.id.toString(),
                          width: 100,
                          height: 35,
                          textTile: 'Add',
                        );
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

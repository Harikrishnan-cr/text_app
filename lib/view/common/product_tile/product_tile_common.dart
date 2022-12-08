import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/size/height_width.dart';
import 'package:intertoons/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:intertoons/model/home_model/featured_product.dart';

import 'package:intertoons/view/common/add_cart_button_common/add_button_common.dart';
import 'package:intertoons/view/full_details/full_details.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    this.featureData
  }) : super(key: key);
final FeaturedProduct? featureData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      
        Get.to(()=>FulldetailsScreen(featureData: featureData,));   
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: featureData?.image ?? 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
              width: 200,
              height: 110,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                      color: greenColour,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                );
              },
            ),
            Container(
              width: 200,
              height: 120,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                  //image: const DecorationImage(image:NetworkImage('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),fit: BoxFit.cover),

                  color: whiteColour,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      featureData?.name ?? '',
                      style: cardTextStyle(),
                    ),
                    constHeigt10,
                    //  ₹₹₹₹₹ ₹

                    Row(
                      children: [
                        Text(    
                          '€',
                          style: cardCurrencyTextStyle(),
                        ),
                        consWidth5,
                   featureData?.specialPrice != 0 ?     Text(
                          featureData?.specialPrice.toString() ?? '', 
                          style: cardRsTextStyle(),
                        ) : Text(
                          featureData?.price.toString() ?? '',   
                          style: cardRsTextStyle(),
                        )
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '€',
                              style: cardCurrencyTextStyle(),
                            ),
                            consWidth5,
                            Text(
                              featureData?.price.toString() ?? '', 
                              style: markedTextStyle(),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                             
                              child: AddButton(
                                productId: featureData!.id.toString(),
                                textTile: 'Add',
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

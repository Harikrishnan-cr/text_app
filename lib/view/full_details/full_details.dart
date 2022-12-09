import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/cart_controller/cart_controller.dart';

import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/sample_images/sample_file.dart';
import 'package:intertoons/controller/const/size/height_width.dart';
import 'package:intertoons/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:intertoons/controller/const/style/text_style.dart';
import 'package:intertoons/model/home_model/bestseller_product.dart';
import 'package:intertoons/model/home_model/featured_product.dart';
import 'package:intertoons/view/common/add_cart_button_common/add_button_common.dart';
import 'package:intertoons/view/common/bottom_bar/bottom_bar.dart';

class FulldetailsScreen extends StatelessWidget {
  const FulldetailsScreen({Key? key, required this.featureData})
      : super(key: key);
  final FeaturedProduct? featureData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(featureData?.name ?? ''),
        backgroundColor: greenColour,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FancyShimmerImage(
                width: double.infinity,
                height: 250,
                imageUrl: featureData?.image ?? strImage,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                        color: blackColour,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    featureData?.name ?? '',
                    style: signUpUserTextStyle(),
                  ),
                  constHeigt15,
                  Text(
                    featureData?.description ?? '',
                    style: userScreenTextStyle(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        color: greenProductScreen,
        height: 90,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '₹',
                    style: productRsTextStyle(),
                  ),
                  consWidth5,
                  featureData?.specialPrice != 0
                      ? Text(
                          featureData?.specialPrice ?? '',
                          style: productRsTextStyle(),
                        )
                      : Text(
                          '${featureData?.price.toString()}',
                          style: productRsTextStyle(),
                        )
                ],
              ),
              Row(
                children: [
                  AddButton(
                    productPrice: num.parse(featureData!.price!),
                    productId: featureData!.id.toString(),
                    textTile: 'Add',
                    height: 40,
                    width: 85,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FulldetailsScreenBestSeller extends StatelessWidget {
  const FulldetailsScreenBestSeller({Key? key, required this.featureData})
      : super(key: key);
  final BestsellerProduct? featureData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(featureData?.name ?? ''),
        backgroundColor: greenColour,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FancyShimmerImage(
                width: double.infinity,
                height: 250,
                imageUrl: featureData?.image ?? strImage,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                        color: blackColour,
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    featureData?.name ?? '',
                    style: signUpUserTextStyle(),
                  ),
                  constHeigt15,
                  Text(
                    featureData?.description ?? '',
                    style: userScreenTextStyle(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: GetBuilder<CartController>(builder: (controller) {  
        return controller.cartLength != 0 ? CommonCartTab(cartCount: controller.cartLength.toString(),): const SizedBox(); 
      },), 
      bottomNavigationBar: Container(
        width: double.infinity,
        color: greenProductScreen,
        height: 90,
        child: Padding(  
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '₹',
                    style: productRsTextStyle(),
                  ),
                  consWidth5,
                  featureData?.specialPrice != 0
                      ? Text(
                          featureData?.specialPrice ?? '',
                          style: productRsTextStyle(),
                        )
                      : Text(
                          '${featureData?.price.toString()}',
                          style: productRsTextStyle(),
                        )
                ],
              ),
              Row(
                children: [
                  AddButton(
                    productPrice: num.parse(featureData!.price!),
                    productId: featureData!.id.toString(),
                    textTile: 'Add',
                    height: 40,
                    width: 85,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

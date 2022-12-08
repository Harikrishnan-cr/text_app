




import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/cart_controller/cart_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/style/text_style.dart';

class AddButton extends StatelessWidget {
   AddButton({
    Key? key,this.height,this.width,this.productId,this.textTile 
  }) : super(key: key);
final double? width;
final double? height;
final String? productId;
final String? textTile;

final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: () async{
        log('Add Clickedd $productId'); 
cartController.addProductToCart(productId: productId.toString(), quantity: 1);   
        if(textTile == null){

        }else{

          log('Already in cart'); 
        }
         
      },
      child: Container(
        width: width ?? 65,
        height: height ?? 33,
      decoration: BoxDecoration(
          color: greenColour, 
          borderRadius: BorderRadius.circular(10)
      ),
        child: Center(child: Text(textTile ?? 'Add',style: addTextStyle(),)), 
      ),
    );
  }
}





import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/style/text_style.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,this.height,this.width,this.productId,this.textTile 
  }) : super(key: key);
final double? width;
final double? height;
final String? productId;
final String? textTile;
  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: () async{
        log('Add Clickedd $productId'); 

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
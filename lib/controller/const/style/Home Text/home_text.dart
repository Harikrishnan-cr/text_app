

 
import 'package:flutter/cupertino.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';

Padding headText({required String headTextData}) {
    return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20), 
               child: Text(headTextData, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22 ,color: blackColour)),
             );
  }
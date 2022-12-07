




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intertoons/controller/const/size/height_width.dart';

class CatagoryTilleCommon extends StatelessWidget {
  const CatagoryTilleCommon({
    Key? key,
    required this.catImage,
    required this.catData,
  }) : super(key: key);

  final String catImage;
  final String catData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      CircleAvatar(backgroundImage: NetworkImage(catImage),radius: 30,),

           constHeigt10, 
      Text(catData)  
      ],
    );
  }
}
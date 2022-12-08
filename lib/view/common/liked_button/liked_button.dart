import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/liked_controller/liked_controler.dart';
import 'package:like_button/like_button.dart';

class LikedButton extends StatelessWidget {
  LikedButton({
    Key? key,
    required this.isliked,
    required this.productId,
    this.id,
  }) : super(key: key);
  final bool isliked;
  final String productId;
  final String? id;

  final likeControll = Get.put(LikedContrller());
  @override
  Widget build(BuildContext context) {
    return LikeButton(
      likeBuilder: (bool like) {
        return GetBuilder<LikedContrller>(builder: (context) {
          return GestureDetector(
            onTap: () {
              log('llikked');
              likeControll.onLikeChanges(!likeControll.likedOrNotSample);
            },
            child: Icon(
              Icons.favorite,
              size: 30,
              color: likeControll.likedOrNotSample ? greenColour : Colors.grey,
            ),
          );
        });
      },
      size: 30,
      bubblesColor: BubblesColor(
          dotPrimaryColor: greenColour,
          dotSecondaryColor: greenColour,
          dotLastColor: greenColour,
          dotThirdColor: greenColour),
      circleColor: CircleColor(start: greenColour, end: greenColour),
      likeCountAnimationType: LikeCountAnimationType.none,
    );
  }
}

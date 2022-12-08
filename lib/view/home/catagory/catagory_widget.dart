import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intertoons/controller/catagory_controller/catagory_controller.dart';
import 'package:intertoons/view/common/catagory_tile/catagory_tile.dart';
import 'package:intertoons/view/common/circular_progress_indicator/circular_progress_common.dart';

import 'package:intertoons/view/menu/menu_screen.dart';

class CatagoryWidget extends StatelessWidget {
  CatagoryWidget({Key? key}) : super(key: key);
  final catImage =
      'https://t3.ftcdn.net/jpg/01/71/83/64/360_F_171836401_CmAtR3GJFR59p65WUZ6U0qJjNZftSfPV.jpg';
  final catData = 'Data Is defined';

  final catDataController = Get.put(CatagoryController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CatagoryController>(builder: (context) {
      return catDataController.catData.data != null
          ? SizedBox(
              width: double.infinity,
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(catDataController.catData.data!.length,
                    (index) {
                  final catData =
                      catDataController.catData.data?.reversed.toList()[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => MenuScreen());
                      },
                      child: CatagoryTilleCommon(
                          catImage: catData?.catImg ?? catImage,
                          catData: catData?.catName ?? ''),
                    ),
                  );
                }),
              ),
            )
          : const CommonCircularProgressIndicator(
              width: double.infinity, height: 130);
    });
  }
}

import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/home_data_contoller/home_contorller.dart';

class SliderScreenWidget extends StatelessWidget {
  SliderScreenWidget({
    Key? key,
  }) : super(key: key);
  final homeDataController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (context) {
        return homeDataController.homeData.data?.sliderBanners != null
            ? Swiper(
                itemBuilder: (BuildContext context, int index) {
                  final data =
                      homeDataController.homeData.data?.sliderBanners![index];
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FancyShimmerImage(
                        imageUrl: data?.bannerImg ??
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.fill)),
                          );
                        },
                      )
                      );
                },
                itemCount:
                    homeDataController.homeData.data?.sliderBanners?.length ??
                        2,
                autoplay: true,
                pagination: const SwiperPagination(
                    margin: EdgeInsets.all(2), builder: SwiperPagination.rect),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intertoons/controller/catagory_controller/catagory_controller.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';

import 'package:intertoons/controller/const/style/text_style.dart';

import 'package:intertoons/view/menu/menu_items/menu_items.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);
  final catDataController = Get.put(CatagoryController());

  @override
  Widget build(BuildContext context) { 
    return DefaultTabController(
      length: 10,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: greenColour,
            title: const Text('Explore Menu'),
          ),
          body: catDataController.catData.data != null
              ? Column(
                  children: [
                    TabBar(
                     
                      isScrollable: true,
                      indicatorColor: greenColour,
                      tabs: List.generate(10, (index) {
                        final catData = catDataController.catData.data?.reversed
                            .toList()[index];
                        return Tab(
                          child: Text(
                            catData!.catName.toString(),
                            style: likedCardTextStyle(),
                          ),
                        );
                      }),
                    ),
                    Expanded(
                        child: TabBarView(children: [
                      Center(
                        child:
                            Text('Daily Specials', style: likedCardTextStyle()),
                      ),
                      MenuItemsScreenWidget(
                        catgaryName: 'Beverages',
                      ),
                      Center(
                        child: Text('Dry Fruits', style: likedCardTextStyle()),
                      ),
                      MenuItemsScreenWidget(catgaryName: 'Ice Creams'),
                      Center(
                        child: Text('Breads', style: likedCardTextStyle()),
                      ),
                      Center(
                        child: Text('Biriyani', style: likedCardTextStyle()),
                      ),
                      Center(
                        child: Text('Shavarma', style: likedCardTextStyle()),
                      ),
                      Center(
                        child: Text('Fish curry', style: likedCardTextStyle()),
                      ),
                      Center(
                        child: Text('cakes', style: likedCardTextStyle()),
                      ),
                      MenuItemsScreenWidget(
                        catgaryName: 'Smoothies',
                      ),
                    ]))
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Center(child: CircularProgressIndicator())],
                )),
    );
  }
}

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/style/Home%20Text/card_text_style.dart';
import 'package:intertoons/model/home_model/featured_product.dart';
import 'package:intertoons/view/common/add_cart_button_common/add_button_common.dart';

class MenuScreenTile extends StatelessWidget {
  const MenuScreenTile({
    Key? key,
    required this.catData,
  }) : super(key: key);

  final FeaturedProduct catData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Column(
          children: [
            FancyShimmerImage(
              width: double.infinity,
              height: 160,
              imageUrl: catData.image!,
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.fill),
                      color: Colors.purple,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                );
              },
            ),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  color: whiteColour,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 2.0,
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      catData.name!,
                      style: cardCurrencyTextStyle(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        catData.specialPrice == 0
                            ? Text(
                                '€ ${catData.price}',
                                style: cardCurrencyTextStyle(),
                              )
                            : Text(
                                '€ ${catData.specialPrice}',
                                style: cardCurrencyTextStyle(),
                              ),
                         AddButton(
                          productPrice: num.parse(catData.price!),
                          productId: catData.id.toString(),
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

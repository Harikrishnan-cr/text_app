



import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';

class AdditionalBanneers extends StatelessWidget {
  const AdditionalBanneers({
    Key? key,
    required this.strImage,
  }) : super(key: key);

  final String strImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12,left: 12,right: 12),
      child: SizedBox(
        width: double.infinity,
        height: 150,
      child: FancyShimmerImage(
            imageUrl: 
                strImage, 
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.fill)),
              );
            },
          ),
      ),
    );
  }
}
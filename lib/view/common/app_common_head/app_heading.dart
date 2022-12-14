import 'package:flutter/cupertino.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';
import 'package:intertoons/controller/const/style/Home%20Text/home_text.dart';

class CommonHeadings extends StatelessWidget {
  const CommonHeadings(
      {Key? key, required this.headTextData, required this.viewAll})
      : super(key: key);

  final String headTextData;
  final bool viewAll;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          headText(headTextData: headTextData),
          viewAll == true
              ? Container(
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: greyBacground,
                  ),
                  height: 25,
                  child: const Center(child: Text('View All')),
                )
              : Container()
        ],
      ),
    );
  }
}

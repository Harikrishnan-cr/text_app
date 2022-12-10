





import 'package:flutter/material.dart';
import 'package:intertoons/controller/const/color%20const/colors.dart';

class IsVegOrNonVeg extends StatelessWidget {
  const IsVegOrNonVeg({
    Key? key,
    required this.isVeg,
  }) : super(key: key);

  final int isVeg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
          border: Border.all(width: 1.5, color: blackColour)),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: CircleAvatar(
          backgroundColor: isVeg == 1 ? greenColour : Colors.red,
        ),
      ),
    );
  }
}
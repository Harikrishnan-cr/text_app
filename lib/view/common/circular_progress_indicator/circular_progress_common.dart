



import 'package:flutter/material.dart';

class CommonCircularProgressIndicator extends StatelessWidget {
  const CommonCircularProgressIndicator({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
           width: width,
        height: height,
      child: const Center(
          child: CircularProgressIndicator(),
        ),
    );
  }
}
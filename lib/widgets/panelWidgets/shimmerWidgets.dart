import 'package:flutter/material.dart';

class ShimmerWidgets extends StatelessWidget {
  const ShimmerWidgets.allText({Key? key, required this.height, required this.width, this.decoration, this.radius}) : super(key: key);

  final double height;
  final double width;
  final BoxDecoration? decoration;
  final BorderRadius? radius;

  const ShimmerWidgets.imgContainer({super.key,required this.height,required this.width,this.decoration,this.radius});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      height: height,
      width: width,
    );
  }
}

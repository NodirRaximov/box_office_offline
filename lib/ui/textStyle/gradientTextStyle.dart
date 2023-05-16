import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({Key? key, required this.text, this.style, required this.gradient}) : super(key: key);

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds)=>
          gradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height)
          ),
      blendMode: BlendMode.srcIn,
      child: Text(text,style: style,textAlign: TextAlign.center,),
    );
  }
}
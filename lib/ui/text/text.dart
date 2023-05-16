
import 'package:flutter/material.dart';

class RecurrenceText extends StatelessWidget {
  const RecurrenceText({Key? key,
    required this.style,
    required this.str,
    required this.margin})
      : super(key: key);

  final TextStyle style;
  final String str;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:margin,
        child: Text(str,
          style: style,
        ));
  }

}

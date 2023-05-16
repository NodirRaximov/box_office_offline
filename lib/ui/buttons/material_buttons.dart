import 'package:box_office_offline/providers/mainProviders.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/textStyle/gradientTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MaterialButtons extends StatelessWidget {
  const MaterialButtons(
      {Key? key,
      this.colors,
      required this.text,
      this.textColor,
      this.height,
      this.width,
      this.tf,
      this.shape,
      this.margin,
      this.padding,
      this.textStyle,
      required this.onPressed,
      required this.decoration,
       required this.gradientText, required this.gr,})
      : super(key: key);

  final Color? colors;
  final String text;
  final Color? textColor;
  final double? height;
  final double? width;
  final bool? tf;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final RoundedRectangleBorder? shape;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final LinearGradient gradientText;
  final bool gr;

  final Decoration decoration;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<MainProviders>(builder: (context, mainProviders, child) {
        return Consumer<RegisterProviders>(
            builder: (context, registerProviders, child) {
          return gr?Container(
            height: height,
            width:width,
            margin: margin,
            padding: EdgeInsets.all(1.3.sp),
            decoration: decoration,
            child: Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: RadiusBorder.radius_8),
              child: MaterialButton(
                  onPressed: onPressed,
                  shape: shape,
                  padding:padding,
                  color:colors,
                  child:GradientText(
                    gradient:gradientText,
                    text: text,
                    style: textStyle,
                  )
              ),
            ),
          ):Container(
          decoration: decoration,
          width: width,
              height: height,
              margin: margin,
              child: MaterialButton(
              shape: shape,
              padding: padding,
              onPressed: onPressed,
              color: colors,
              child: Text(text,style: textStyle,)
              )
          );
        });
      });
    });
  }
}

import 'package:box_office_offline/providers/mainProviders.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class IconsButtons extends StatelessWidget {
  const IconsButtons(
      {Key? key,
      this.startIconColors,
      required this.text,
      this.textColor,
      this.height,
      this.width,
      this.tf,
      this.margin,
      this.padding,
      this.shape,
      this.textStyle,
      required this.onPressed,
      this.iconStart,
      this.iconEnd,
      required this.decoration,
        this.endIconColors})
      : super(key: key);
  final Color? startIconColors;
  final Color? endIconColors;
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
  final dynamic iconStart;
  final dynamic iconEnd;
  final Decoration decoration;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<MainProviders>(builder: (context, mainProviders, child) {
        return Consumer<RegisterProviders>(
            builder: (context, registerProviders, child) {
          return Container(
            decoration: decoration,
            width: width,
            height: height,
            margin: margin,
            child: MaterialButton(
              shape: shape,
              padding: padding,
              onPressed: onPressed,
              child: iconEnd == ""
                  ? Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Image.asset(
                        iconStart,
                        height: 16.sp,
                        color: startIconColors,
                        width: 16.sp,
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      Text(
                        text,
                        style: textStyle,
                      ),
                    ])
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Text(
                        text,
                        style: textStyle,
                      ),
                      SizedBox(
                        width: 5.sp,
                      ),
                      Image.asset(
                        iconEnd,
                        color: endIconColors,
                        height: 14.sp,
                        width: 14.sp,
                      ),
                    ]),
            ),
          );
        });
      });
    });
  }
}

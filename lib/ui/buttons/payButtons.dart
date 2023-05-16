import 'package:box_office_offline/providers/mainProviders.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PayButtons extends StatelessWidget {
  const PayButtons(
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
        this.iconStart,
        this.iconEnd,
        this.startIconColor,
        this.endIconColors,
        this.startHeight,
        this.startWidth,
        this.endHeight,
        this.endWidth,})
      : super(key: key);

  final Color? colors;
  final Color? startIconColor;
  final Color? endIconColors;
  final String text;
  final String? iconStart;
  final String? iconEnd;
  final Color? textColor;
  final double? height;
  final double? width;
  final double? startHeight;
  final double? startWidth;
  final double? endHeight;
  final double? endWidth;
  final bool? tf;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final RoundedRectangleBorder? shape;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
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
                    color: colors,
                    child: Row(
                      children: [
                        iconStart==""?Container()
                            :Image.asset(iconStart!,color: startIconColor,height: startHeight,width: startWidth,),
                        SizedBox(width: 5.sp,),
                        Text(text,style: textStyle,),
                        iconEnd==""?Container()
                        :iconStart==""?Expanded(child: Container(margin: EdgeInsets.only(right: 5.sp),
                            alignment: Alignment.centerRight,
                            child: Image.asset(iconEnd!,color: endIconColors,height: endHeight,width: endWidth)))
                            :Image.asset(iconEnd!,color: endIconColors,height: endHeight,width: endWidth)
                      ],
                    )
                ),
              );
            });
      });
    });
  }
}


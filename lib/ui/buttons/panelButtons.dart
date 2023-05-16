
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PanelButtons extends StatelessWidget {
  const PanelButtons(
      {this.providersClass,
      required this.img,
      this.height,
      this.width,
      required this.iconTf,
      required this.index,
      required this.onPressed,
        this.providers,
      Key? key, })
      : super(key: key);

  final ProvidersClass? providersClass;
  final dynamic providers;
  final String img;
  final double? height;
  final double? width;
  final dynamic iconTf;
  final int index;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: iconTf
                ? const Border(left: BorderSide(
                width: 2, color: Colors.white))
                : null),
        margin:EdgeInsets.only(bottom: 7.sp,top:7.sp),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor:
              MaterialStateColor.resolveWith(
                      (states) =>
                  iconTf
                      ? Colors.white
                      : const Color.fromARGB(0, 50, 50, 50))),
          child: Image.asset(
              img, height: 32.sp,width: 32.sp,
              color: (iconTf
                  ? Colors.blue
                  : Colors.white)),
        )
    );
  }
}

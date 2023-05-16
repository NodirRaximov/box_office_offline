
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ContainerLines extends StatelessWidget {
  const ContainerLines({Key? key,
    this.height,
    this.widtht,
    this.onPressed,
    this.registerProviders,
    this.margin,
    this.padding,
    this.btnImg,
    required this.sufIcon,
    this.hintText,
    this.textStyle,
    this.decorationBox,
    required this.index,
    this.btnImgColor}) : super(key: key);
  final double? height;
  final double? widtht;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final VoidCallback? onPressed;
  final RegisterProviders? registerProviders;
  final String? btnImg;
  final dynamic btnImgColor;
  final String sufIcon;
  final String? hintText;
  final int index;
  final BoxDecoration? decorationBox;
  final TextStyle? textStyle;


  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context,providersClass,child){
      return Container(
        height: height,
        width: widtht,
        margin: margin,
        decoration: decorationBox ?? DecorationBox.borderGrey,
        child: MaterialButton(
          padding: EdgeInsets.only(left: 10,right: 8,top: 5.sp),
          onPressed: onPressed,
          child: Row(
            children: [
              providersClass.coupons==""
                  ?sufIcon!=""
                  ?Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Image.asset(sufIcon))
                  :Container()
                  :Container(),
              Expanded(
                  child: Container(
                    margin: index==-1?EdgeInsets.zero:EdgeInsets.only(top: 10.sp),
                    child: Text(hintText=="Filter Date Range"?
                      'Filter Date Range':hintText!,
                      style: textStyle,
                    ),
                  )),
              btnImg!=null
                  ? Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                      btnImg!,
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      color: btnImgColor ?? Colors.white))
                  :Container()
            ],
          ),
        ),
      );
    });
  }
}
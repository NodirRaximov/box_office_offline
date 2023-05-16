import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/border/gf_border.dart';
import 'package:getwidget/types/gf_border_type.dart';

class ToTalDiscount extends StatelessWidget {
  const ToTalDiscount(
      {super.key,
        this.onPressedOne,
        this.onPressedTwo,
        this.onPressedThree,
        this.providersClass,
        this.providers,
        required this.index,
        required this.couponesShow});

  final VoidCallback? onPressedOne;
  final VoidCallback? onPressedTwo;
  final VoidCallback? onPressedThree;
  final ProvidersClass? providersClass;
  final dynamic providers;
  final int index;
  final bool couponesShow;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(15, 5, 10, 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
           couponesShow
               ? Container(
              height: 50,
              margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
              decoration:DecorationBox.allBoxDecoration,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      height: 45,
                      width: 45,
                      child: TextButton(
                          onPressed: () {
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RadiusBorder.roundedRadius_8,
                              )),
                          child: Image.asset(
                            "assets/coupons-icon.png",
                            color: Colors.grey.withOpacity(1.0),
                          ))),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Text(providersClass!.imglistshop[0].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 90, 95, 1),
                              fontSize: 16),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                    ),
                  ),

                ],
              ),
            )
               :Container(),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
              child: Row(
                children:  [
                  Expanded(flex:1,
                      child:Text("Детали\nзаказа",textAlign: TextAlign.start,style: TextStyle(height: 2,fontSize: 16.sp,fontWeight: FontWeight.w500),)),
                  Expanded(flex: 4,
                      child:GFBorder(
                          radius: const Radius.circular(8),
                          color:AppColor.grey,
                          dashedLine: const [3, 2],
                          type: GFBorderType.rRect,
                          child: Column(children: [
                            returnContainer(
                                "Total:",
                                "${index!=-1?providersClass!.imglistshop[index].price:providersClass!.prises} UZS",
                                AppTextStyle.grey_16_txt,
                                AppTextStyle.grey_16_txt,
                                EdgeInsets.only(top: 12.sp,left: 14.sp,right: 12.sp)),
                           returnContainer(
                               "Внесено:",
                               "${index!=-1?providersClass!.imglistshop[index].price * 0:providersClass!.prises*0.8} UZS",
                               AppTextStyle.grey_16_txt,
                               AppTextStyle.grey_16_txt,
                             EdgeInsets.only(top:2.sp,left: 14.sp,right: 12.sp,)
                           ),
                            returnContainer(
                                "Total with discount:",
                                "${index!=-1?providersClass!.imglistshop[index].price * 0:providersClass!.prises*0.8} UZS",
                                AppTextStyle.blue_16_txt,
                                AppTextStyle.blue_16_txt,
                                EdgeInsets.only(top:2.sp,left: 14.sp,right: 12.sp,)
                            ),
                            returnContainer(
                                "Total:",
                                "${index!=-1?providersClass!.imglistshop[index].price:providersClass!.prises} UZS",
                                AppTextStyle.grey_16_txt,
                                AppTextStyle.grey_16_txt,
                                EdgeInsets.only(top: 2.sp,left: 14.sp,right: 12.sp)),
                            returnContainer(
                                "Внесено:",
                                "${index!=-1?providersClass!.imglistshop[index].price * 0:providersClass!.prises*0.8} UZS",
                                AppTextStyle.grey_16_txt,
                                AppTextStyle.grey_16_txt,
                                EdgeInsets.only(top:2.sp,left: 14.sp,right: 12.sp,bottom: 12.sp)
                            ),
                          ],)
                      )
                  )
                ],
              ),
            ),
          ],
        ));
  }
  returnContainer(textOne,textTwo,textStyleOne,textStyleTwo,padding){
   return Container(
      padding: padding,
      child: Row(mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(textOne, textAlign: TextAlign.left,
                style: textStyleOne),
          ),
          Expanded(
            child: Text(
              textTwo,
              textAlign: TextAlign.left,
              style: textStyleTwo),
          ),
        ],),
    );

  }

}
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoneyItemsProf extends StatelessWidget {
  const MoneyItemsProf(
      {Key? key,
      required this.text,
      this.icon,
      this.percentage,
      required this.price,
      required this.decoration})
      : super(key: key);

  final String text;
  final dynamic icon;
  final dynamic percentage;
  final String price;
  final Decoration decoration;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(left:5.sp,right: 5.sp,top:20.sp),
      padding: EdgeInsets.all(8.sp),
      decoration: decoration,
      child: ListTile(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.asset(
                icon,
                height: 24.sp,
                width: 24.sp,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: AppTextStyle.white_16_txt_w4,
              ),
            ],
          ),
        ),
        subtitle: Text(
          price,
          style: AppTextStyle.white_24_txt_w5_h,
        ),
        trailing: Text(
          percentage,
          style: AppTextStyle.white_16_txt_w4,
        ),
      ),
    ));
  }
}

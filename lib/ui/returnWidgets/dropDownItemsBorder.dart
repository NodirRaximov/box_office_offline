import 'package:box_office_offline/model/dropItems.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DropDownItemsBorder extends StatelessWidget {
  const DropDownItemsBorder(
      {Key? key,
        required this.list,
        required this.onChanged,
        required this.hintText,
        this.icon,
        this.iconItem,
        required this.providerText,
        this.iconColor})
      : super(key: key);

  final List<DropItems> list;
  final Function(String?)? onChanged;

  final String hintText;
  final dynamic icon;
  final dynamic iconItem;
  final Color? iconColor;
  final String providerText;
  final String? values = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Container(
          alignment: Alignment.center,
          decoration: DecorationBox.allBoxDecoration,
          height: 50.sp,
          width: 210,
          margin: const EdgeInsets.all(10,),
          padding: const EdgeInsets.only(left: 10),
          child: DropdownButtonFormField(
            items: list.map((value) {
              return DropdownMenuItem<String>(
                alignment: Alignment.centerLeft,
                value: value.title,
                child: Row(
                  children: [
                    iconItem==null?Image.asset(value.icon==true?"assets/check-circle_drop.png":value.icon==false?"assets/no_check_circle_drop.png":value.icon,color: iconColor??null,):Container(),
                    SizedBox(width: 8.sp,),
                    Text(value.title),
                  ],
                ),
              );
            }).toList(),
            style: AppTextStyle.grey_16_txt,
            iconSize: 0,
            value: providerText == ""
                ? null
                : providerText,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: providerText != ""
                    ? AppTextStyle.grey_12_txt
                    : AppTextStyle.grey_14_txt,
                suffixIcon: icon!=null?Image.asset(
                  icon,
                  color: AppColor.grey,
                ):Container(),
                border: InputBorder.none),
            onChanged: onChanged,
          ));
    });
  }
}

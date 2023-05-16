import 'package:box_office_offline/providers/mainProviders.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BuildDropListOptions{
  BuildDropListOptions._();

  static buildDropListOptions(List<String> items, BuildContext context) {
    return Column(
      children: items.map((item) => _buildSubMenu(item, context)).toList(),
    );
  }

  static Widget _buildSubMenu(String item, BuildContext context) {
    return Consumer<MainProviders>(builder: (context,mainProvider,child){
      return TextButton(
        child: Container(
          margin:
          const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
          child: Row(
            children: <Widget>[
              Container(
                height: 48.sp,
                width: 48.sp,
                margin:  EdgeInsets.only(right: 8.sp,bottom: 4.sp,top: 4.sp),
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/shape.png")),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5)),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25.sp,
                height: 40,
                alignment: Alignment.centerLeft,
                child: Text(item.toString(),
                    style: AppTextStyle.black_16_txt_w4,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ),
        onPressed: () {
          mainProvider.selectint(item);
          mainProvider.compNameBox=item;
          mainProvider.expandController.reverse();
          mainProvider.setIsShow(false);
          // onOptionSelected(item);
        },
      );});

  }

}
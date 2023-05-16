import 'dart:io';

import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void showDialogImg(ctx,index,) {
  var height=MediaQuery.of(ctx).size.height;
  var width=MediaQuery.of(ctx).size.width;
  showDialog(context: ctx, builder: (BuildContext context){return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Consumer<RegisterProviders>(builder: (context,providers,child){
        return Container(
          alignment: Alignment.center,
          height: height * 0.6,
          width: width * 0.5,
          margin: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(image:DecorationImage(image: FileImage(File(providers.picList[index])),fit: BoxFit.fill)),
        );
      })
  );});
}
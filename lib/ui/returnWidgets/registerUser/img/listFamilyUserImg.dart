import 'dart:io';

import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/cutomDialogs/imgShow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ListFamilyUserImg extends StatelessWidget {
  const ListFamilyUserImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterProviders>(
        builder: (context, registerProvider, child) {
      return Stack(
        children: [
          Container(
            alignment: Alignment.centerRight,
            height: 80,
            margin: const EdgeInsets.only(left: 20, right: 5, top: 20),
            width: MediaQuery.of(context).size.width * 0.16,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Row(
                  children: List.generate(
                      registerProvider.picList.length,
                      (index) => index != 0
                          ? InkWell(
                              onTap: () {
                                showDialogImg(context, index);
                              },
                              child: Container(
                                height: 50.sp,
                                width: 50.sp,
                                margin:
                                    const EdgeInsets.only(right: 2, left: 15),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(60)),
                                    image: DecorationImage(
                                        image: FileImage(
                                          File(registerProvider.picList[index]),
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                            )
                          : Container())),
            ),
          ),
          Positioned(
              left: 15,
              top: 0,
              bottom: 0,
              child: Container(
                height: 55,
                width: 40,
                decoration: BoxDecoration(
                    gradient: LinearGradient(stops: const [
                  0.4,
                  0.5,
                  0.7
                ], colors: [
                  Colors.white.withOpacity(0.8),
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.05)
                ])),
              ))
        ],
      );
    });
  }
}

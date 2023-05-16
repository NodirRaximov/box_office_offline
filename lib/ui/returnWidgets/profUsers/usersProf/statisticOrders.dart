import 'package:box_office_offline/ui/returnWidgets/profUsers/filtrsContainer.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StatisticOrders extends StatelessWidget {
  const StatisticOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              alignment: Alignment.centerLeft,
              padding:  EdgeInsets.only(left: 10, right: 10,bottom: 10.spMax),
              height: 60,
              child: Text(
                "Users",
                style: AppTextStyle.text_black_24_w5,
              )),
          Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: const FiltresContainer(
                filtrOne: 'Gender',
                filtrTwo: 'Ready',
                filtrThree: 'Age',
                filtrFour: 'Filter Date Range',
              )),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 10.sp, ),
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Келиб тушган даромад",
                    style: AppTextStyle.text_black_24_w5,
                  ),
                  Text(
                    "34 455 645 UZS",
                    style: AppTextStyle.text_black_24_w5,
                  ),
                ],
              )),
        ],
      )],
    );
  }
}

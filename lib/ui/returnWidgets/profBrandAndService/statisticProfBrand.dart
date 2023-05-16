import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/ui/returnWidgets/profUsers/filtrsContainer.dart';
import 'package:box_office_offline/ui/returnWidgets/returnProf/returnProfStatistic.dart';
import 'package:box_office_offline/ui/textStyle/myTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class StatisticProfBrand extends StatelessWidget {
  const StatisticProfBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
      return Consumer<PanelProvider>(builder: (context, panelProvider, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding:  EdgeInsets.only(left: 10, right: 10,bottom: 10.spMax),
                  height: 60,
                  child: Text(
                    "Товарлар",
                    style: AppTextStyle.text_black_24_w5,
                  )),
              Container(
                padding: EdgeInsets.only(left: 5.sp,right: 5.sp),
                child: const FiltresContainer(
                  filtrOne: 'Сотилиш буйича',
                  filtrTwo: 'Реализация буйича',
                  filtrThree: 'Остатка буйича',
                  filtrFour: 'Дата',
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10.sp,),
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
              Container(
                  margin: EdgeInsets.only(left: 8, right: 8, top: 10.sp),
                  height: 48.sp,
                  decoration: BoxDecoration(
                      borderRadius: RadiusBorder.radius_8,
                      color: AppColor.greyStatic),
                  child: ReturnProf.returnCategoryBrand()),
              ReturnProf.returnBrandCategory()
            ],
          ),
        );
      });
    });
  }
}

import 'package:box_office_offline/providers/historyProvider.dart';
import 'package:box_office_offline/providers/panelProvider.dart';
import 'package:box_office_offline/providers/providersClass.dart';
import 'package:box_office_offline/providers/registerProviders.dart';
import 'package:box_office_offline/ui/ListsFile.dart';
import 'package:box_office_offline/ui/boxDecoration/boxDecoration.dart';
import 'package:box_office_offline/ui/colors/myColors.dart';
import 'package:box_office_offline/widgets/home/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ListHistoryOfVisits extends StatelessWidget {
  const ListHistoryOfVisits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvidersClass>(builder: (context, providersClass, child) {
      return Consumer<HistoryProvider>(builder: (context, historyProv, child) {
          return Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding:EdgeInsets.only(left:8.sp,top: 3.sp),
                    height: 48.sp,
                    margin: EdgeInsets
                        .only(left: 5,
                        top: 20, right: 2.sp),
                    decoration: DecorationBox
                        .allBoxDecoration,
                    child:
                    DropdownButtonFormField(
                      items: regionList
                          .map((item) {
                        return DropdownMenuItem(
                            alignment: Alignment
                                .centerLeft,
                            value: item
                                .toString(),
                            child: Text(item
                                .toString()));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedValue =
                              value
                                  .toString();
                        });
                      },
                      iconSize: 0,
                      decoration:
                      InputDecoration(
                          hintText:
                          "Kassir",
                          suffixIcon:
                          Image
                              .asset(
                            "assets/arrow-down.png",
                            color: AppColor
                                .grey,
                          ),
                          border:
                          InputBorder
                              .none),
                    ),
                  ),
                ),
                Container(
                  height: 48.sp,

                  margin:
                  EdgeInsets.only(
                      left: 3.sp,
                      right: 8.sp,
                      top: 20),
                  decoration: DecorationBox
                      .allBoxDecoration,
                  child: TextButton(
                    onPressed: () {
                      historyProv.setHistoryListTf();
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty
                            .resolveWith(
                                (states) =>
                            RadiusBorder
                                .roundedRadius_8)),
                    child: Row(
                      children: [
                        Image.asset(
                            "assets/storis-shop.png",color: historyProv.historyOfVisits?Colors.blue:Colors.grey,),
                        SizedBox(width: 5.sp,),
                        const Text("11"),
                        SizedBox(width: 5.sp,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
      });
    });
  }
}
